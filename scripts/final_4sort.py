#!/usr/bin/env python3
# Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Authors: Benjamin Stanley Frohman
# SPDX-License-Identifier: Apache-2.0
"""Final last-mile 4-sort check: paper (LaTeX) vs kernel-checked Lean.

Runs LAST, after the certify job built the package from the committed lake-manifest.json.
Python standard library only. No network, no outside math tools, no file or line exclusions.
It only reports and halts; it never edits the paper, the Lean sources or the claim map.

Every theorem-like environment of the paper (theorem, lemma, proposition, corollary, conjecture,
hypothesis, remark, ... as configured) must be in the claim map. Each claim is sorted into one class:

  PROVED              paper states it as proved and a kernel-certified Lean theorem states exactly it
  WRONGLY-RETRACTED   Lean proves it (0 sorry, standard axioms) but the paper labels it
                      open / conjectural / data / pending / retracted, or states it weaker
  OVERCLAIM           paper presents it as proved but no kernel-certified theorem backs it
                      (missing declaration, a def rather than a proof, sorryAx, non-standard axiom
                      such as Lean.ofReduceBool from native_decide)
  WORDING-DRIFT       paper and Lean differ: narrower, conditional, different, or either side
                      changed since the alignment was recorded
  EXTERNAL            cited external result / external data, explicitly labeled as such (not a failure)
  NOT-CLAIMED         conjecture / hypothesis / commentary stated as such, with no Lean proof of it
                      (not a failure)
  UNMAPPED, UNJUDGED, MAP-ORPHAN   bookkeeping halts: the alignment has not been recorded

PASS iff every claim is PROVED, EXTERNAL or NOT-CLAIMED. Otherwise exit 1 with a HALT report.

Usage:
  python3 scripts/final_4sort.py [--map final-check/claim-map.json] [--out DIR] [--sha SHA]
  python3 scripts/final_4sort.py --seed      # append NEW unmapped environments as unjudged entries
                                             # (never changes an existing entry); then review by hand
  python3 scripts/final_4sort.py --no-lean   # paper-side checks only (every Lean-backed claim halts)
"""
import argparse, hashlib, json, os, re, subprocess, sys, tempfile
from datetime import datetime, timezone

STD_AXIOMS = {"propext", "Classical.choice", "Quot.sound"}
PASS_CLASSES = {"PROVED", "EXTERNAL", "NOT-CLAIMED"}
ORDER = ["OVERCLAIM", "WRONGLY-RETRACTED", "WORDING-DRIFT", "UNMAPPED", "UNJUDGED", "MAP-ORPHAN",
         "PROVED", "EXTERNAL", "NOT-CLAIMED"]
RELATIONS = {"exact", "paper-weaker", "lean-narrower", "conditional", "different", "unjudged"}
DISPOSITIONS = {"proved", "open", "external", "commentary"}

DEFAULT_CONFIG = {
    "paper": "paper/main.tex",
    "envs": ["theorem", "lemma", "proposition", "corollary", "conjecture", "hypothesis", "remark",
             "claim", "fact"],
    "lean_imports": [],
    "lean_open": [],
    "lean_cmd": ["lake", "env", "lean"],
    "external_sections": [],
    "external_markers": ["not kernel-checked", "cited", "external computational data",
                         "computationally verified"],
    "retraction_patterns": [
        r"\bremains? open\b", r"\bis open\b", r"\bare open\b", r"\bstill open\b", r"\bopen problem\b",
        r"\bconjectur\w*", r"\bnot proved\b", r"\bunproved\b", r"\bnot (?:yet )?kernel[- ]checked\b",
        r"\bnot formali[sz]ed\b", r"\bretract\w*", r"\bwithdrawn\b", r"\bexternal (?:computational )?data\b",
        r"\bpending\b", r"\bin progress\b", r"\bcomputationally verified\b", r"\bdata only\b",
        r"\bheuristic\b"],
    "retraction_macros": [],
    "proof_patterns": [r"\bkernel[- ]checked\b", r"\bproved in lean\b", r"\bkernel[- ]certified\b",
                       r"\bis proved\b", r"\bare proved\b"],
    "ref_words": ["Theorem", "Theorems", "Lemma", "Lemmas", "Proposition", "Propositions", "Corollary",
                  "Conjecture", "Remark", "Hypothesis", "Section", "Part", "Appendix", "Definition",
                  "Claim", "Fact", "item", "Item"],
}

# ----------------------------------------------------------------------------------------- paper side
def read_tex(path, seen=None):
    """Return [(file, lineno, text)] with \\input/\\include expanded (comments kept; stripped later)."""
    seen = seen or set()
    path = os.path.normpath(path)
    if path in seen:
        raise SystemExit("4-sort: recursive \\input of %s" % path)
    seen = seen | {path}
    out = []
    base = os.path.dirname(path)
    with open(path, encoding="utf-8") as fh:
        for n, line in enumerate(fh.read().split("\n"), 1):
            code = strip_comment(line)
            m = re.search(r"\\(?:input|include)\{([^}]+)\}", code)
            if m:
                pre = code[:m.start()]
                if pre.strip():
                    out.append((path, n, pre))
                sub = m.group(1)
                cand = os.path.join(base, sub if sub.endswith(".tex") else sub + ".tex")
                if os.path.exists(cand):
                    out.extend(read_tex(cand, seen))
                else:
                    out.append((path, n, line))
                post = code[m.end():]
                if post.strip():
                    out.append((path, n, post))
            else:
                out.append((path, n, line))
    return out

def strip_comment(line):
    return re.sub(r"(?<!\\)%.*", "", line)

def balanced(s, i, op="{", cl="}"):
    """s[i] == op; return index just past the matching close."""
    d = 0
    for j in range(i, len(s)):
        if s[j] == "\\":
            continue
        if s[j] == op and (j == 0 or s[j - 1] != "\\"):
            d += 1
        elif s[j] == cl and (j == 0 or s[j - 1] != "\\"):
            d -= 1
            if d == 0:
                return j + 1
    return len(s)

def remove_macro(s, name, nargs):
    out, i = [], 0
    pat = "\\" + name + "{"
    while True:
        k = s.find(pat, i)
        if k < 0:
            out.append(s[i:]); return "".join(out)
        out.append(s[i:k]); j = k + len(name) + 1
        for _ in range(nargs):
            while j < len(s) and s[j] in " \n":
                j += 1
            if j < len(s) and s[j] == "{":
                j = balanced(s, j)
        i = j

def macro_args(s, name, nargs):
    res, i = [], 0
    pat = "\\" + name + "{"
    while True:
        k = s.find(pat, i)
        if k < 0:
            return res
        j = k + len(name) + 1; args = []
        for _ in range(nargs):
            if j < len(s) and s[j] == "{":
                e = balanced(s, j); args.append(s[j + 1:e - 1]); j = e
        res.append(args); i = j

def norm_tex(s):
    s = remove_macro(s, "lean", 2)          # footnoted Lean locations are metadata, not statement
    s = remove_macro(s, "label", 1)
    return re.sub(r"\s+", " ", s).strip()

def parse_paper(lines, envs):
    """Find theorem-like environments. Returns list of dicts and the section of every line index."""
    text_lines = [strip_comment(t) for (_, _, t) in lines]
    begin_re = re.compile(r"\\(begin|end)\{(%s)(\*?)\}" % "|".join(map(re.escape, envs)))
    sec_re = re.compile(r"\\(part|section|subsection|appendix)\*?(?:\[[^\]]*\])?\{")
    found, stack = [], []
    section = {"title": "", "label": ""}
    sec_of_line = []
    pending_sec = None
    for idx, t in enumerate(text_lines):
        m = sec_re.search(t)
        if m and m.group(1) in ("part", "section", "appendix"):
            j = t.find("{", m.start())
            title = t[j + 1:balanced(t, j) - 1] if j >= 0 else ""
            section = {"title": title, "label": ""}
            pending_sec = section
        if pending_sec is not None:
            lm = re.search(r"\\label\{([^}]+)\}", t)
            if lm and not stack and (not m or lm.start() > m.start()):
                pending_sec["label"] = lm.group(1); pending_sec = None
        sec_of_line.append(dict(section))
        for bm in begin_re.finditer(t):
            if bm.group(1) == "begin":
                stack.append((bm.group(2) + bm.group(3), idx, bm.end()))
            else:
                if not stack:
                    continue
                kind, sidx, scol = stack.pop()
                body_parts = []
                for k in range(sidx, idx + 1):
                    seg = text_lines[k]
                    if k == idx:
                        seg = seg[:bm.start()]
                    if k == sidx:
                        seg = seg[scol:]
                    body_parts.append(seg)
                raw = "\n".join(body_parts)
                title = ""
                r = raw.lstrip()
                if r.startswith("["):
                    e = balanced(r, 0, "[", "]"); title = r[1:e - 1]; r = r[e:]
                lab = re.search(r"\\label\{([^}]+)\}", r)
                refs = []
                for args in macro_args(raw, "lean", 2):
                    refs += [x.strip().replace("\\_", "_") for x in re.split(r"[;,]", args[0]) if x.strip()]
                refs += [x.replace("\\_", "_") for x in re.findall(r"\\path\{([A-Za-z0-9_.']+)\}", title)
                         if "/" not in x and not x.endswith((".lean", ".json", ".tex", ".md", ".py"))]
                stmt = norm_tex(("[" + title + "] " if title else "") + r)
                f, n, _ = lines[sidx]
                found.append({
                    "kind": kind, "title": title, "label": lab.group(1) if lab else None,
                    "file": f, "line": n, "end_line_index": idx, "line_index": sidx,
                    "statement": stmt, "sha256": hashlib.sha256(stmt.encode()).hexdigest(),
                    "lean_refs": list(dict.fromkeys(refs)), "section": sec_of_line[sidx],
                })
    found.sort(key=lambda e: e["line_index"])
    for e in found:
        e["id"] = e["label"] or "nolabel:%s:%s" % (e["kind"], e["sha256"][:12])
    return found, text_lines, sec_of_line

REF_CMD = r"\\(?:ref|cref|Cref|autoref|eqref)\{([^}]*)\}"

def tokenize_refs(cfg, text, self_label=None):
    """Replace 'Theorem~\\ref{x}' (name word included) by <SELF> for self_label and <REF> otherwise, and
    drop identifier-like content (\\path, \\texttt, \\lean) so Lean names such as conjecture_iff_H2_H3
    are not read as status words."""
    words = "|".join(map(re.escape, cfg["ref_words"]))
    def rep(m):
        labs = [x.strip() for x in m.group(1).split(",")]
        return " <SELF> " if self_label in labs else " <REF> "
    text = remove_macro(text, "lean", 2)
    text = re.sub(r"(?:(?:%s)s?~?\s*)?%s(?:\([^)]*\))?" % (words, REF_CMD), rep, text)
    text = re.sub(r"\\(?:path|texttt|url|href)\{[^}]*\}", " <ID> ", text)
    return re.sub(r"\s+", " ", text).strip()

def mention_clauses(cfg, text_lines, lines, envs_found):
    """For every label, the sentences of the paper that mention it (\\ref, \\Cref, ...) plus the status
    paragraph right after its environment.  Returns {label: [(file, line, tokenized_sentence)]}.
    In a tokenized sentence the label itself is <SELF>, other references are <REF>."""
    joined, starts = "", []
    for t in text_lines:
        starts.append(len(joined)); joined += t + "\n"
    # mask punctuation inside braces so a sentence never ends inside \ref{conj:vanish} or \path{a.b}
    masked = re.sub(r"\{[^{}]*\}", lambda m: re.sub(r"[.;:,]", "\x00", m.group(0)), joined)
    def pos2line(p):
        lo, hi = 0, len(starts) - 1
        while lo < hi:
            mid = (lo + hi + 1) // 2
            if starts[mid] <= p: lo = mid
            else: hi = mid - 1
        return lines[lo][0], lines[lo][1]
    bounds = [". ", ".\n", ";", "\n\n", "\\item", "\\begin", "\\end", "\\\\", "&"]
    out = {}
    for m in re.finditer(REF_CMD, joined):
        a = max(masked.rfind(x, 0, m.start()) for x in bounds)
        ends = [e for e in (masked.find(x, m.end()) for x in bounds) if e >= 0]
        b = min(ends) if ends else len(joined)
        sent = joined[a + 1 if a >= 0 else 0:b]
        f, n = pos2line(m.start())
        for lab in m.group(1).split(","):
            out.setdefault(lab.strip(), []).append((f, n, tokenize_refs(cfg, sent, lab.strip())))
    for e in envs_found:
        if not e["label"]:
            continue
        k = e["end_line_index"] + 1; para = []
        while k < len(text_lines) and len(para) < 8:
            t = text_lines[k]
            if para and (not t.strip() or re.search(r"\\(begin|section|subsection|part)\b", t)):
                break
            if t.strip():
                if re.search(r"\\(begin|section|subsection|part)\b", t):
                    break
                para.append(t)
            k += 1
        if para and re.match(r"\s*(\\noindent)?\s*\\textbf\{Status", para[0]):
            f, n, _ = lines[min(e["end_line_index"] + 1, len(lines) - 1)]
            # status sentences without any reference speak about this environment
            for sent in re.split(r"(?<=\.)\s+", " ".join(para)):
                tok = tokenize_refs(cfg, sent, e["label"])
                if "<SELF>" not in tok and "<REF>" not in tok:
                    tok = "<SELF> " + tok
                out.setdefault(e["label"], []).append((f, n, tok))
    return out

def _paren_groups(text):
    """Index of the innermost (...) group of every character (0 = outside any group)."""
    gid, stack, nxt, out = 0, [0], 1, []
    for ch in text:
        if ch == "(":
            stack.append(nxt); nxt += 1; out.append(stack[-1])
        elif ch == ")" and len(stack) > 1:
            out.append(stack[-1]); stack.pop()
        else:
            out.append(stack[-1])
    return out

def self_hits(text, pats, macros=(), own=False):
    """Status words attributed to this claim.  A hit is attributed to the nearest reference token before it
    in the same parenthesis group (failing that, after it in the same group); a hit in a group with no token
    goes to the token right before that group (\"<SELF> (not kernel-checked)\"); tokens inside a group
    other than the hit's are ignored.  A hit with no token at all counts only in the claim's own text."""
    low = text.lower()
    grp = _paren_groups(low)
    toks = [(m.start(), m.group(0), grp[m.start()]) for m in re.finditer(r"<self>|<ref>", low)]
    hits = []
    for p in pats:
        for m in re.finditer(p, low):
            g = grp[m.start()]
            same = [t for t in toks if t[2] == g]
            before = [t for t in same if t[0] < m.start()]
            after = [t for t in same if t[0] > m.start()]
            tok = before[-1][1] if before else (after[0][1] if after else None)
            if tok is None and g != 0:
                open_at = max(i for i in range(m.start() + 1) if low[i] == "(" and grp[i] == g)
                prev = [t for t in toks if t[0] < open_at and t[2] == grp[open_at - 1 if open_at else 0]]
                if prev and re.fullmatch(r"\s*", low[prev[-1][0] + len(prev[-1][1]):open_at]):
                    tok = prev[-1][1]
            if tok == "<self>" or (tok is None and own):
                hits.append(m.group(0))
    for mac in macros:
        if mac in text and (own or "<SELF>" in text):
            hits.append(mac)
    return hits

def find_patterns(text, pats, macros=()):
    low = text.lower()
    hits = [m.group(0) for p in pats for m in re.finditer(p, low)]
    hits += [mac for mac in macros if mac in text]
    return hits

def strip_negated_proof(text):
    return re.sub(r"\bnot (?:yet )?(?:kernel[- ]checked|proved|kernel[- ]certified|formali[sz]ed)\b", " ", text.lower())

# ------------------------------------------------------------------------------------------ Lean side
LEAN_META = r'''
import Lean
open Lean Elab Command Meta

/-- Prints one machine-readable line per queried constant: resolved name, constant kind,
whether it is a proof of a proposition, its type and its axioms (as `#print axioms`). -/
elab "#four_sort_info " q:str id:ident : command => do
  try
    let name ← liftCoreM <| realizeGlobalConstNoOverload id
    let env ← getEnv
    let some ci := env.find? name | throwError "not found"
    let kind := match ci with
      | .thmInfo _ => "theorem" | .defnInfo _ => "def" | .axiomInfo _ => "axiom"
      | .opaqueInfo _ => "opaque" | .inductInfo _ => "inductive" | _ => "other"
    let (ty, isPf) ← liftTermElabM do
      let f ← ppExpr ci.type
      let p ← isProp ci.type
      pure (f.pretty 1000000, p)
    let axs ← liftCoreM <| collectAxioms name
    let j := Json.mkObj [("query", q.getString), ("name", toString name), ("kind", kind),
      ("is_proof", isPf), ("type", ty), ("axioms", toJson (axs.map toString))]
    logInfo m!"FOURSORT {j.compress}"
  catch e =>
    logInfo m!"FOURSORT {(Json.mkObj [("query", q.getString), ("error", toString (← e.toMessageData.toString))]).compress}"
'''

def lean_query(cfg, decls, workdir):
    if not decls:
        return {}
    src = "".join("import %s\n" % m for m in cfg["lean_imports"]) + LEAN_META
    src += "set_option pp.fullNames true\nset_option pp.proofs false\n"
    if cfg["lean_open"]:
        src += "open %s\n" % " ".join(cfg["lean_open"])
    for d in decls:
        src += "#four_sort_info %s %s\n" % (json.dumps(d), d if "'" not in d and "«" not in d else "«%s»" % d)
    fn = os.path.join(workdir, "FourSortQuery.lean")
    with open(fn, "w", encoding="utf-8") as fh:
        fh.write(src)
    p = subprocess.run(cfg["lean_cmd"] + [fn], capture_output=True, text=True)
    out = p.stdout + p.stderr
    with open(os.path.join(workdir, "lean-query.log"), "w", encoding="utf-8") as fh:
        fh.write(out)
    res = {}
    for line in out.splitlines():
        k = line.find("FOURSORT {")
        if k >= 0:
            try:
                j = json.loads(line[k + 9:])
                res[j["query"]] = j
            except json.JSONDecodeError:
                pass
    if p.returncode != 0 and not res:
        raise SystemExit("4-sort: the Lean query failed (exit %d):\n%s" % (p.returncode, out[-4000:]))
    for d in decls:
        res.setdefault(d, {"query": d, "error": "no output from Lean for this name"})
    return res

def axioms_log_query(path, decls):
    """Lean status from a CI certificate's `#print axioms` log (no statement types).  Used only when a
    local Lean run is impossible; the CI run with a live Lean query is the record."""
    txt = re.sub(r"\n\s+", " ", open(path, encoding="utf-8").read())
    known = {}
    for m in re.finditer(r"'([^']+)' (?:depends on axioms: \[([^\]]*)\]|does not depend on any axioms)", txt):
        known[m.group(1)] = [x.strip() for x in (m.group(2) or "").split(",") if x.strip()]
    res = {}
    for d in decls:
        hits = [n for n in known if n == d or n.endswith("." + d)]
        if len(hits) == 1:
            res[d] = {"query": d, "name": hits[0], "kind": "theorem", "is_proof": True,
                      "axioms": known[hits[0]], "source": "axioms-log"}
        else:
            res[d] = {"query": d, "error": ("not in the certificate's #print axioms log %s" % path) if not hits
                      else "ambiguous in the #print axioms log: %s" % hits}
    return res

def norm_lean(s):
    return re.sub(r"\s+", " ", s or "").strip()

def lean_status(info):
    """Return (ok, problem) for one declaration."""
    if "error" in info:
        return False, "Lean: %s" % info["error"].strip().splitlines()[0][:300]
    if info["kind"] != "theorem" or not info["is_proof"]:
        return False, "%s is a %s, not a theorem (a definition states, it does not prove)" % (info["name"], info["kind"])
    bad = [a for a in info["axioms"] if a not in STD_AXIOMS]
    if bad:
        return False, "%s depends on non-standard axioms %s%s" % (info["name"], bad,
                      " (sorry)" if "sorryAx" in bad else " (native_decide)" if "Lean.ofReduceBool" in bad else "")
    return True, ""

# ---------------------------------------------------------------------------------------- classify
def classify(cfg, env, entry, lean, mentions):
    """Return (class, [reasons], details)."""
    det = {"lean": {}}
    reasons = []
    disp = entry.get("disposition")
    rel = entry.get("relation", "unjudged")
    decls = entry.get("lean", [])
    infos = {d: lean.get(d) for d in decls}
    statuses = {}
    for d, info in infos.items():
        if info is None:
            statuses[d] = (False, "Lean not queried (--no-lean)")
            det["lean"][d] = {"status": "not queried"}
            continue
        ok, prob = lean_status(info)
        statuses[d] = (ok, prob)
        det["lean"][d] = {"name": info.get("name"), "type": norm_lean(info.get("type")),
                          "axioms": info.get("axioms"), "kind": info.get("kind"),
                          "certified": ok, "problem": prob}
    all_ok = bool(decls) and all(ok for ok, _ in statuses.values())
    # retraction / proof language around the claim
    own = tokenize_refs(cfg, env["statement"])
    ctx = [(env["file"], env["line"], own, True)] + [(f, n, c, False) for f, n, c in mentions.get(env["label"], [])]
    retr = []
    for f, n, c, is_own in ctx:
        h = self_hits(c, cfg["retraction_patterns"], cfg["retraction_macros"], own=is_own)
        ack = [x for x in entry.get("reviewed_status_sentences", [])
               if x.get("sha256") == hashlib.sha256(c.encode()).hexdigest()]
        if h and ack:
            det.setdefault("acknowledged_status_sentences", []).append(
                {"at": "%s:%d" % (f, n), "words": sorted(set(h)), "text": c[:400], "reason": ack[0].get("reason", "")})
            continue
        if h:
            retr.append({"at": "%s:%d" % (f, n), "words": sorted(set(h)), "text": c[:400]})
    det["retraction_mentions"] = retr
    in_ext_section = (env["section"]["label"] in cfg["external_sections"]
                      or env["section"]["title"] in cfg["external_sections"])
    ext_marked = in_ext_section or bool(find_patterns(own, [re.escape(x.lower()) for x in cfg["external_markers"]],
                                                      cfg["retraction_macros"]))
    proof_words = self_hits(strip_negated_proof(own), cfg["proof_patterns"], own=True)

    if not entry.get("reviewed"):
        return "UNJUDGED", ["no recorded review of this claim (claim-map field 'reviewed' is empty)"], det
    if disp not in DISPOSITIONS or rel not in RELATIONS:
        return "UNJUDGED", ["claim map: disposition %r / relation %r not recognised" % (disp, rel)], det

    # Lean drift and paper drift are checked for every Lean-backed claim
    drift = []
    if entry.get("paper_sha256") != env["sha256"]:
        drift.append("paper statement changed since the alignment was recorded (pinned sha256 %s, now %s)"
                     % (str(entry.get("paper_sha256"))[:12], env["sha256"][:12]))
    unpinned = []
    for d in decls:
        info = infos.get(d)
        if info and "type" in info:
            if d not in entry.get("lean_expected", {}):
                unpinned.append(d); continue
            exp = norm_lean(entry.get("lean_expected", {}).get(d))
            if exp != norm_lean(info["type"]):
                drift.append("Lean statement of %s changed: pinned `%s`, now `%s`" % (d, exp[:600], norm_lean(info["type"])[:600]))

    if disp == "proved":
        if not decls:
            return "OVERCLAIM", ["the paper presents it as proved; the claim map names no Lean theorem"], det
        if not all_ok:
            return "OVERCLAIM", [p for ok, p in statuses.values() if not ok], det
        if drift:
            return "WORDING-DRIFT", drift, det
        if unpinned:
            return "UNJUDGED", ["Lean statement of %s is not pinned in the claim map (the report shows it; pin it after comparing)" % ", ".join(unpinned)], det
        if rel == "unjudged":
            return "UNJUDGED", ["relation between paper and Lean statement not judged"], det
        if rel in ("lean-narrower", "conditional", "different"):
            return "WORDING-DRIFT", ["recorded relation: Lean is %s than/to the paper statement: %s" % (rel, entry.get("note", ""))], det
        if rel == "paper-weaker":
            return "WRONGLY-RETRACTED", ["the paper states it weaker than Lean proves: %s" % entry.get("note", "")], det
        if retr:
            return "WRONGLY-RETRACTED", ["Lean proves it, but the paper labels it %s at %s" % (", ".join(r["words"]), r["at"]) for r in retr], det
        return "PROVED", [], det
    if disp in ("open", "external"):
        if all_ok and rel in ("exact", "paper-weaker"):
            return "WRONGLY-RETRACTED", ["paper labels it %s, but %s is kernel-certified (standard axioms, no sorry)%s"
                                         % (disp, ", ".join(decls), "" if not drift else "; also: " + "; ".join(drift))], det
        if disp == "external":
            if proof_words:
                return "OVERCLAIM", ["labeled external but its text says %s" % ", ".join(sorted(set(proof_words)))], det
            if not ext_marked:
                return "OVERCLAIM", ["external result stated without an external label (not in an external section, no marker such as %s)" % cfg["external_markers"][:3]], det
            return "EXTERNAL", [], det
        # open
        if env["kind"].rstrip("*") in ("conjecture", "hypothesis") or retr:
            if proof_words and env["kind"].rstrip("*") not in ("conjecture", "hypothesis"):
                return "OVERCLAIM", ["labeled open but its text says %s" % ", ".join(sorted(set(proof_words)))], det
            return "NOT-CLAIMED", [], det
        return "OVERCLAIM", ["recorded as open, but the %s environment carries no open/conjecture/data label" % env["kind"]], det
    # commentary: a remark may cite Lean declarations for what it says is kernel-checked; those must be certified
    if decls and not all_ok:
        return "OVERCLAIM", ["the remark cites Lean declarations that are not kernel-certified: "] + [p for ok, p in statuses.values() if not ok], det
    if proof_words and not decls:
        return "OVERCLAIM", ["commentary whose text says %s with no Lean theorem in the claim map" % ", ".join(sorted(set(proof_words)))], det
    return "NOT-CLAIMED", [], det

# ------------------------------------------------------------------------------------------- fix route
def fix_route(r):
    """Who can fix a halt item.  PAPER-FIX: Lean is exact or stronger, so the agent aligns the paper to the
    Lean statement (never weakening it), rebuilds and commits the PDF, then reruns this check.
    HUMAN: an overclaim, or any fix that would weaken or cloak a paper claim (or formalize the missing proof).
    RE-REVIEW: the recorded alignment is missing or stale; a reviewer re-records it, then it routes as above."""
    c, rel = r["class"], r.get("relation")
    if c in PASS_CLASSES:
        return ""
    if c == "WRONGLY-RETRACTED":
        return "PAPER-FIX"
    if c == "OVERCLAIM":
        return "HUMAN"
    if c == "WORDING-DRIFT":
        if any(x.startswith(("paper statement changed", "Lean statement of")) for x in r["reasons"]):
            return "RE-REVIEW"
        return "HUMAN"   # Lean narrower / conditional / different: matching Lean would weaken the paper
    return "RE-REVIEW"

FIX_TEXT = {
    "PAPER-FIX": "paper-fixable: Lean proves it exactly or more strongly; state the Lean theorem in the paper verbatim "
                 "(keep every hypothesis, range and symbol), rebuild and commit the PDF, rerun the 4-sort",
    "HUMAN": "needs the human: the paper says more than Lean proves, or matching Lean would weaken/cloak the claim; "
             "either formalize the missing part or the author decides the wording; never weaken silently",
    "RE-REVIEW": "re-review: record (or re-record) the paper-vs-Lean alignment in the claim map with both pinned hashes; "
                 "the item then routes as PAPER-FIX or HUMAN",
}

# ------------------------------------------------------------------------------------------- report
def write_reports(outdir, meta, results):
    os.makedirs(outdir, exist_ok=True)
    for r in results:
        r["fix_route"] = fix_route(r)
    counts = {c: sum(1 for r in results if r["class"] == c) for c in ORDER}
    routes = {k: sum(1 for r in results if r["fix_route"] == k) for k in FIX_TEXT}
    verdict = "PASS" if all(r["class"] in PASS_CLASSES for r in results) else "HALT"
    meta = dict(meta, verdict=verdict, counts=counts, fix_routes=routes)
    with open(os.path.join(outdir, "4sort-report.json"), "w", encoding="utf-8") as fh:
        json.dump({"meta": meta, "claims": results}, fh, indent=1, ensure_ascii=False)
    L = ["# Final 4-sort check: %s" % verdict, ""]
    for k in ["lean_status_source", "repo", "commit", "paper", "paper_sha256", "claim_map", "claim_map_sha256", "lean_toolchain", "lake_manifest_sha256", "generated"]:
        L.append("- %s: `%s`" % (k, meta.get(k)))
    L += ["", "| class | count |", "|---|---|"] + ["| %s | %d |" % (c, counts[c]) for c in ORDER] + [""]
    if verdict == "HALT":
        L += ["Fix routes of the halt items: " + ", ".join("%s=%d" % kv for kv in routes.items()), ""]
        L += ["- **%s**: %s" % kv for kv in FIX_TEXT.items()] + [""]
        L += ["## HALT items", "", "Each item names the claim, where it is in the paper, the Lean declaration(s), the class and the exact mismatch. "
              "Nothing was changed; the fix is the author's decision (never weaken a statement to pass).", ""]
    for c in ORDER:
        rs = [r for r in results if r["class"] == c]
        if not rs:
            continue
        L += ["## %s (%d)" % (c, len(rs)), ""]
        for r in rs:
            L.append("### `%s` (%s) at %s" % (r["id"], r["kind"], r["where"]))
            if r.get("title"):
                L.append("- title: %s" % r["title"])
            L.append("- paper statement: %s" % r["statement"][:700])
            for d, v in r["details"].get("lean", {}).items():
                L.append("- Lean `%s`: `%s` axioms %s%s" % (v.get("name") or d, (v.get("type") or "")[:700], v.get("axioms"),
                         "" if v.get("certified") else " NOT CERTIFIED: %s" % v.get("problem", v.get("status"))))
            if r["fix_route"]:
                L.append("- **fix route: %s**" % r["fix_route"])
            for why in r["reasons"]:
                L.append("- **mismatch:** %s" % why)
            for m in r["details"].get("acknowledged_status_sentences", []):
                L.append("- acknowledged status sentence at %s (reviewed, not hidden): %s: \"%s\" (reason: %s)" % (m["at"], m["words"], m["text"][:200], m["reason"]))
            for m in r["details"].get("retraction_mentions", [])[:6]:
                L.append("- status wording at %s: %s: \"%s\"" % (m["at"], m["words"], m["text"][:300]))
            if r.get("note"):
                L.append("- claim-map note: %s" % r["note"])
            L.append("")
    L += ["## Scope", "", "This check compares recorded paper-vs-Lean alignments, kernel status (sorryAx, non-standard axioms, "
          "def vs theorem) and status wording. Whether a Lean statement says what the English says is a human judgment, recorded "
          "in the claim map with pinned hashes of both sides; the tool detects any later change on either side and halts. It "
          "cannot recover unwritten intent.", ""]
    with open(os.path.join(outdir, "4sort-report.md"), "w", encoding="utf-8") as fh:
        fh.write("\n".join(L))
    return verdict, counts

def sha_file(p):
    try:
        return hashlib.sha256(open(p, "rb").read()).hexdigest()
    except OSError:
        return None

def git(*a):
    try:
        return subprocess.run(["git"] + list(a), capture_output=True, text=True).stdout.strip()
    except OSError:
        return ""

# --------------------------------------------------------------------------------------------- main
def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--map", default="final-check/claim-map.json")
    ap.add_argument("--out", default=None)
    ap.add_argument("--sha", default=None)
    ap.add_argument("--seed", action="store_true")
    ap.add_argument("--no-lean", action="store_true")
    ap.add_argument("--axioms-log", default=None,
                    help="PREVIEW ONLY: take kernel status from a CI certificate's print-axioms.log instead of "
                         "querying Lean; Lean statements are then not compared")
    ap.add_argument("--pin-from-report", default=None,
                    help="like --pin-missing, but take the Lean statements from a CI 4sort-report.json "
                         "(the live Lean query of the official run); never overwrites a pin")
    ap.add_argument("--pin-missing", action="store_true",
                    help="record the current Lean statement for mapped declarations that have no pin yet "
                         "(never overwrites a pin); use while recording a review")
    ap.add_argument("--lean-cmd", default=None, help="override config lean_cmd, e.g. 'lean' with LEAN_PATH set")
    a = ap.parse_args()
    root = git("rev-parse", "--show-toplevel") or os.getcwd()
    os.chdir(root)
    cmap = json.load(open(a.map, encoding="utf-8"))
    cfg = dict(DEFAULT_CONFIG); cfg.update(cmap.get("config", {}))
    if a.lean_cmd:
        cfg["lean_cmd"] = a.lean_cmd.split()
    lines = read_tex(cfg["paper"])
    envs_found, text_lines, _ = parse_paper(lines, cfg["envs"])
    ids = [e["id"] for e in envs_found]
    dup = sorted({i for i in ids if ids.count(i) > 1})
    entries = {c["id"]: c for c in cmap.get("claims", [])}
    sha = a.sha or git("rev-parse", "HEAD")

    decls = sorted({d for c in cmap.get("claims", []) for d in c.get("lean", [])} |
                   ({d for e in envs_found for d in e["lean_refs"]} if a.seed else set()))
    lean = {}
    tmp = tempfile.mkdtemp(prefix="4sort-")
    if a.pin_from_report:
        rep = json.load(open(a.pin_from_report, encoding="utf-8"))
        if not rep.get("meta", {}).get("lean_queried"):
            raise SystemExit("4-sort: %s was not produced by a live Lean query" % a.pin_from_report)
        lean = {}
        for c in rep.get("claims", []):
            for d, v in c.get("details", {}).get("lean", {}).items():
                if v.get("type"):
                    lean[d] = {"type": v["type"]}
        a.pin_missing = True
    elif a.axioms_log:
        lean = axioms_log_query(a.axioms_log, decls)
    elif not a.no_lean:
        lean = lean_query(cfg, decls, tmp)

    if a.pin_missing:
        k = 0
        for ent in cmap.get("claims", []):
            for d in ent.get("lean", []):
                if d in lean and "type" in lean[d] and d not in ent.setdefault("lean_expected", {}):
                    ent["lean_expected"][d] = norm_lean(lean[d]["type"]); k += 1
        with open(a.map, "w", encoding="utf-8") as fh:
            json.dump(cmap, fh, indent=1, ensure_ascii=False); fh.write("\n")
        print("4-sort --pin-missing: %d Lean statements pinned (existing pins untouched)" % k)
        return 0
    if a.seed:
        added = repinned = 0
        byid = {e["id"]: e for e in envs_found}
        for ent in cmap.get("claims", []):
            # an UNJUDGED entry carries no judgment, so re-pinning it to the current text is safe
            if ent.get("relation") == "unjudged" and not ent.get("reviewed") and ent["id"] in byid:
                ent["paper_sha256"] = byid[ent["id"]]["sha256"]
                for d in ent.get("lean", []):
                    if d in lean and "type" in lean[d]:
                        ent.setdefault("lean_expected", {})[d] = norm_lean(lean[d]["type"])
                repinned += 1
        for e in envs_found:
            if e["id"] in entries:
                continue
            guess = {"conjecture": "open", "hypothesis": "open", "remark": "commentary"}.get(e["kind"].rstrip("*"), "proved")
            refs = [lean[d]["name"] if d in lean and "name" in lean[d] else d for d in e["lean_refs"]]
            ent = {"id": e["id"], "kind": e["kind"], "where": "%s:%d" % (e["file"], e["line"]), "title": e["title"],
                   "disposition": guess, "lean": refs, "relation": "unjudged", "paper_sha256": e["sha256"],
                   "lean_expected": {}, "reviewed": "", "note": "seeded automatically; review required"}
            for d0, d in zip(e["lean_refs"], refs):
                if d0 in lean and "type" in lean[d0]:
                    ent["lean_expected"][d] = norm_lean(lean[d0]["type"])
            cmap.setdefault("claims", []).append(ent); entries[e["id"]] = ent; added += 1
        with open(a.map, "w", encoding="utf-8") as fh:
            json.dump(cmap, fh, indent=1, ensure_ascii=False); fh.write("\n")
        print("4-sort --seed: %d new unjudged entries appended to %s; %d unjudged entries re-pinned; reviewed entries untouched" % (added, a.map, repinned))
        return 0

    mentions = mention_clauses(cfg, text_lines, lines, envs_found)
    results = []
    for e in envs_found:
        base = {"id": e["id"], "kind": e["kind"], "title": e["title"], "where": "%s:%d" % (e["file"], e["line"]),
                "statement": e["statement"], "paper_sha256": e["sha256"]}
        if e["id"] in dup:
            results.append(dict(base, **{"class": "UNMAPPED", "reasons": ["duplicate id (two environments with the same label or the same unlabeled text)"], "details": {}}))
            continue
        ent = entries.get(e["id"])
        if ent is None:
            results.append(dict(base, **{"class": "UNMAPPED", "reasons": ["environment not in the claim map %s" % a.map], "details": {"lean_refs_in_paper": e["lean_refs"]}}))
            continue
        cls, why, det = classify(cfg, e, ent, lean, mentions)
        results.append(dict(base, **{"class": cls, "reasons": why, "details": det, "note": ent.get("note", ""),
                                      "disposition": ent.get("disposition"), "relation": ent.get("relation"),
                                      "lean_decls": ent.get("lean", [])}))
    present = set(ids)
    for cid, ent in entries.items():
        if cid not in present:
            results.append({"id": cid, "kind": ent.get("kind", "?"), "title": ent.get("title", ""), "where": ent.get("where", "?"),
                            "statement": "", "class": "MAP-ORPHAN", "details": {},
                            "reasons": ["claim-map entry has no environment in the paper (removed or relabeled claim)"]})
    meta = {"repo": os.environ.get("GITHUB_REPOSITORY") or os.path.basename(root), "commit": sha,
            "paper": cfg["paper"], "paper_sha256": sha_file(cfg["paper"]), "claim_map": a.map,
            "claim_map_sha256": sha_file(a.map), "lean_toolchain": (open("lean-toolchain").read().strip() if os.path.exists("lean-toolchain") else None),
            "lake_manifest_sha256": sha_file("lake-manifest.json"),
            "lean_queried": not a.no_lean and not a.axioms_log,
            "lean_status_source": ("PREVIEW: #print axioms log %s; Lean statements NOT compared" % a.axioms_log) if a.axioms_log
                                  else ("none (--no-lean)" if a.no_lean else "live Lean query on the built oleans"),
            "generated": datetime.now(timezone.utc).astimezone().strftime("%Y-%m-%d %H:%M:%S %Z")}
    out = a.out or os.path.join(tmp, "4sort-report-%s" % sha)
    verdict, counts = write_reports(out, meta, results)
    if os.path.exists(os.path.join(tmp, "lean-query.log")) and os.path.abspath(out) != tmp:
        os.replace(os.path.join(tmp, "lean-query.log"), os.path.join(out, "lean-query.log"))
    print(open(os.path.join(out, "4sort-report.md"), encoding="utf-8").read() if verdict == "HALT" else "")
    print("FINAL 4-SORT: %s  %s  report: %s" % (verdict, " ".join("%s=%d" % (k, v) for k, v in counts.items() if v), out))
    return 0 if verdict == "PASS" else 1

if __name__ == "__main__":
    sys.exit(main())
