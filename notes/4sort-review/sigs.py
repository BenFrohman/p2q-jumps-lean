import re,sys,json,glob,os
os.chdir('/workspace/p2q-drift')
files=[f for f in glob.glob('P2qJumps/**/*.lean',recursive=True)]
src={f:open(f).read() for f in files}
def find(name):
    short=name.split('.')[-1]
    out=[]
    for f,s in src.items():
        for m in re.finditer(r'^(?:@\[[^\]]*\]\s*)?(?:private\s+|protected\s+)?(theorem|lemma|def|abbrev)\s+'+re.escape(short)+r'\b',s,re.M):
            start=m.start(); end=s.find(':=',start)
            # statement through ':='
            line=s[:start].count('\n')+1
            out.append(f"{f}:{line}: "+re.sub(r'\s+',' ',s[start:end]))
    return out or [f"NOT FOUND {name}"]
r=json.load(open('/workspace/p2q-4sort-notes/4sort-report-main-086a484/4sort-report.json'))
m=json.load(open('/workspace/p2q-4sort/final-check/claim-map.json'))
E={e['id']:e for e in m['claims']}
for c in r['claims']:
    if c['class']!='UNJUDGED': continue
    e=E[c['id']]
    print("="*8,c['id'],c['where'])
    print("PAPER:",c['statement'][:3000])
    for d in e.get('lean') or []:
        for x in find(d): print("  LEAN:",x[:1500])
    print()
