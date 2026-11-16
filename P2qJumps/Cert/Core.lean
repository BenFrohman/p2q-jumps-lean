/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
import Mathlib.Tactic
import Mathlib.NumberTheory.ArithmeticFunction.Misc
import P2qJumps.Arith
import P2qJumps.R2ST
import P2qJumps.R3S

/-!
# Kernel-checkable certificate checkers and their soundness theorems

Each checker is a `Bool`-valued function built from `Nat.rec` and kernel-accelerated `Nat`
operations (`+`, `*`, `/`, `%`, `<`, `Nat.log2`). The certificate theorems in
`P2qJumps.Cert.Instances` evaluate the checkers with `decide +kernel` (kernel reduction only;
no `native_decide`, no `Lean.ofReduceBool`). The soundness lemmas here turn a `true` result
into the mathematical statement.

Nothing in a checker needs to be trusted: helper functions (`isqrt`, `strip`, the prime filter)
are only used to *propose* data, and every proposal is re-verified by the checker or is harmless
for soundness.
-/

namespace P2qJumps.Cert

open Nat ArithmeticFunction
open scoped ArithmeticFunction.sigma

/-! ## Bounded universal quantifier -/

/-- `allBelow f n = true` iff `f k = true` for every `k < n`. Defined by `Nat.rec` so that kernel
reduction is a flat loop. -/
def allBelow (f : ℕ → Bool) (n : ℕ) : Bool :=
  Nat.rec true (fun k acc => f k && acc) n

theorem allBelow_spec {f : ℕ → Bool} {n : ℕ} (h : allBelow f n = true) :
    ∀ k < n, f k = true := by
  induction n with
  | zero => intro k hk; omega
  | succ n ih =>
    intro k hk
    have h' : (f n && allBelow f n) = true := h
    rw [Bool.and_eq_true] at h'
    rcases Nat.lt_succ_iff_lt_or_eq.1 hk with hk | rfl
    · exact ih h'.2 k hk
    · exact h'.1

/-! ## Non-squares -/

/-- Newton iteration for the integer square root, with fuel. Untrusted: only used to propose a
witness. -/
def isqrtAux (n : ℕ) : ℕ → ℕ → ℕ
  | 0, x => x
  | fuel + 1, x =>
    let y := (x + n / x) / 2
    if y < x then isqrtAux n fuel y else x

/-- Proposed integer square root. -/
def isqrt (n : ℕ) : ℕ := if n < 2 then n else isqrtAux n 256 (2 ^ (Nat.log2 n / 2 + 1))

/-- Checked non-square test: `k^2 < n < (k+1)^2` for the proposed `k`. -/
def notSquareB (n : ℕ) : Bool :=
  let k := isqrt n
  decide (k * k < n) && decide (n < (k + 1) * (k + 1))

theorem notSquareB_spec {n : ℕ} (h : notSquareB n = true) : ∀ m : ℕ, m * m ≠ n := by
  intro m hm
  simp only [notSquareB, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨h1, h2⟩ := h
  rw [← hm] at h1 h2
  have a := Nat.mul_self_lt_mul_self_iff.1 h1
  have b := Nat.mul_self_lt_mul_self_iff.1 h2
  omega

theorem notSquareB_spec_int {n : ℕ} (h : notSquareB n = true) : ∀ k : ℤ, k ^ 2 ≠ (n : ℤ) := by
  intro k hk
  apply notSquareB_spec h k.natAbs
  have : ((k.natAbs * k.natAbs : ℕ) : ℤ) = (n : ℤ) := by
    rw [Int.natAbs_mul_self, ← hk]; ring
  exact_mod_cast this

/-! ## Certificate 1: the line `r = p + 4` of the shape `r^2 s t` -/

/-- `F(p)` as a natural number (valid for `p ≥ 1`). -/
def F8nat (p : ℕ) : ℕ :=
  p ^ 8 + 20 * p ^ 7 + 158 * p ^ 6 + 685 * p ^ 5 + 2064 * p ^ 4 + 4836 * p ^ 3 + 7976 * p ^ 2
    + 5760 * p - 2808

lemma F8nat_cast {p : ℕ} (hp : 1 ≤ p) : ((F8nat p : ℕ) : ℤ) = F8 p := by
  unfold F8nat F8
  have : 2808 ≤ p ^ 8 + 20 * p ^ 7 + 158 * p ^ 6 + 685 * p ^ 5 + 2064 * p ^ 4 + 4836 * p ^ 3
      + 7976 * p ^ 2 + 5760 * p := by
    have : 5760 ≤ 5760 * p := by omega
    omega
  push_cast [this]
  ring

/-- Checker for one value of `p` on the line `r = p + 4`: `2 F(p)` is not a perfect square. -/
def lineB (p : ℕ) : Bool := notSquareB (2 * F8nat p)

/-- Checker for all `p` with `5 ≤ p < B`. -/
def lineCheck (B : ℕ) : Bool := allBelow (fun p => decide (p < 5) || lineB p) B

theorem lineCheck_sound {B : ℕ} (h : lineCheck B = true) {p : ℕ} (hp5 : 5 ≤ p) (hpB : p < B) :
    ∀ k : ℤ, k ^ 2 ≠ 2 * F8 p := by
  have := allBelow_spec h p hpB
  simp only [Bool.or_eq_true, decide_eq_true_eq] at this
  rcases this with h1 | h1
  · omega
  · intro k hk
    apply notSquareB_spec_int h1 k
    rw [hk]; push_cast; rw [F8nat_cast (by omega)]

/-! ## Certificate 2: the strip `r^2 ∣ L(p)`, `r > p` of the shape `r^3 s` -/

/-- Trial division by every `d` with `2 ≤ d ≤ lim`, starting at `d`; returns the final `d` and
the stripped number. Fuel-bounded; the checker verifies that the loop ran past `lim`. -/
def strip (lim : ℕ) (fuel : ℕ) : ℕ → ℕ → ℕ × ℕ :=
  Nat.rec (fun d m => (d, m))
    (fun _ rec d m =>
      if lim < d then (d, m) else if m % d = 0 then rec d (m / d) else rec (d + 1) m) fuel

lemma strip_zero (lim d m : ℕ) : strip lim 0 d m = (d, m) := rfl

lemma strip_succ (lim fuel d m : ℕ) :
    strip lim (fuel + 1) d m =
      if lim < d then (d, m) else if m % d = 0 then strip lim fuel d (m / d)
      else strip lim fuel (d + 1) m := rfl

theorem strip_spec (lim : ℕ) :
    ∀ (fuel d m : ℕ), 2 ≤ d → (∀ e, 2 ≤ e → e < d → ¬ e ∣ m) →
      let res := strip lim fuel d m
      lim < res.1 → res.2 ∣ m ∧ (∀ e, 2 ≤ e → e < res.1 → ¬ e ∣ res.2) ∧
        (∀ r, r.Prime → lim < r → r ^ 2 ∣ m → r ^ 2 ∣ res.2) := by
  intro fuel
  induction fuel with
  | zero =>
    intro d m _ hinv res hres
    simp only [res, strip_zero] at hres ⊢
    exact ⟨dvd_rfl, hinv, fun r _ _ h => h⟩
  | succ fuel ih =>
    intro d m hd hinv res hres
    simp only [res, strip_succ] at hres ⊢
    by_cases hl : lim < d
    · simp only [hl, if_true] at hres ⊢
      exact ⟨dvd_rfl, hinv, fun r _ _ h => h⟩
    · simp only [hl, if_false] at hres ⊢
      by_cases hm : m % d = 0
      · simp only [hm, if_true] at hres ⊢
        have hdm : d ∣ m := Nat.dvd_of_mod_eq_zero hm
        have hinv' : ∀ e, 2 ≤ e → e < d → ¬ e ∣ m / d := fun e he1 he2 hed =>
          hinv e he1 he2 (hed.trans (Nat.div_dvd_of_dvd hdm))
        obtain ⟨a, b, c⟩ := ih d (m / d) hd hinv' hres
        refine ⟨a.trans (Nat.div_dvd_of_dvd hdm), b, fun r hr hlr hrm => c r hr hlr ?_⟩
        have hcop : Nat.Coprime (r ^ 2) d := by
          apply Nat.Coprime.pow_left
          rw [Nat.Prime.coprime_iff_not_dvd hr]
          intro hrd
          have := Nat.le_of_dvd (by omega) hrd
          omega
        obtain ⟨k, hk⟩ := hdm
        have : m / d = k := by rw [hk]; exact Nat.mul_div_cancel_left k (by omega)
        rw [this]
        rw [hk] at hrm
        exact hcop.dvd_of_dvd_mul_left hrm
      · simp only [hm, if_false] at hres ⊢
        have hinv' : ∀ e, 2 ≤ e → e < d + 1 → ¬ e ∣ m := by
          intro e he1 he2 hed
          rcases Nat.lt_succ_iff_lt_or_eq.1 he2 with h | rfl
          · exact hinv e he1 h hed
          · exact hm (Nat.mod_eq_zero_of_dvd hed)
        exact ih (d + 1) m (by omega) hinv' hres

/-- `L(p)` as a natural number (valid for `p ≥ 3`). -/
def Lnat (p : ℕ) : ℕ := p ^ 3 - p ^ 2 - 12

lemma Lnat_cast {p : ℕ} (hp : 3 ≤ p) : ((Lnat p : ℕ) : ℤ) = Lpoly p := by
  unfold Lnat Lpoly
  have h1 : p ^ 2 ≤ p ^ 3 := Nat.pow_le_pow_right (by omega) (by norm_num)
  have h2 : 12 ≤ p ^ 3 - p ^ 2 := by
    have : p ^ 3 = p * p ^ 2 := by ring
    have h9 : 9 ≤ p ^ 2 := by nlinarith
    have : p ^ 3 - p ^ 2 = (p - 1) * p ^ 2 := by
      rw [Nat.sub_mul, one_mul, ← this]
    rw [this]
    have := Nat.mul_le_mul (show 2 ≤ p - 1 by omega) h9
    omega
  push_cast [h1, h2]
  ring

/-- Checker for one `p`: strip all factors `≤ p` from `L(p)`; the loop must finish and the
remaining cofactor must not be a perfect square. -/
def stripB (p : ℕ) : Bool :=
  let res := strip p (p + 128) 2 (Lnat p)
  decide (p < res.1) && (decide (res.2 = 1) || notSquareB res.2)

/-- Trial-division primality filter used only to skip composite `p` (completeness direction is
all that soundness needs: every prime passes the filter). -/
def primeFilter (n : ℕ) : Bool :=
  decide (2 ≤ n) && allBelow (fun d => decide (d < 2) || decide (n % d ≠ 0)) (min n (isqrt n + 1))

theorem primeFilter_of_prime {n : ℕ} (hn : n.Prime) : primeFilter n = true := by
  simp only [primeFilter, Bool.and_eq_true, decide_eq_true_eq]
  refine ⟨hn.two_le, ?_⟩
  -- `allBelow` of a predicate true on every `d < n`
  have key : ∀ k, k ≤ n → allBelow (fun d => decide (d < 2) || decide (n % d ≠ 0)) k = true := by
    intro k
    induction k with
    | zero => intro _; rfl
    | succ k ih =>
      intro hk
      show ((decide (k < 2) || decide (n % k ≠ 0)) && allBelow _ k) = true
      rw [Bool.and_eq_true]
      refine ⟨?_, ih (by omega)⟩
      simp only [Bool.or_eq_true, decide_eq_true_eq]
      by_cases hk2 : k < 2
      · exact Or.inl hk2
      · right
        intro hmod
        have := (Nat.prime_def_lt'.1 hn).2 k (by omega) (by omega) (Nat.dvd_of_mod_eq_zero hmod)
        exact this
  exact key _ (Nat.min_le_left _ _)

/-- Checker for all prime `p` with `5 ≤ p < B`. -/
def stripCheck (B : ℕ) : Bool :=
  allBelow (fun p => decide (p < 5) || !primeFilter p || stripB p) B

theorem stripB_sound {p : ℕ} (hp5 : 5 ≤ p) (h : stripB p = true) :
    ∀ r : ℕ, r.Prime → p < r → ¬ ((r : ℤ) ^ 2 ∣ Lpoly p) := by
  intro r hr hpr hdvd
  simp only [stripB, Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq] at h
  obtain ⟨hfin, hsq1⟩ := h
  set res := strip p (p + 128) 2 (Lnat p) with hres
  obtain ⟨hMdvd, hMsmall, hMr⟩ := strip_spec p (p + 128) 2 (Lnat p) le_rfl
    (fun e he1 he2 => by omega) hfin
  have hLpos : 0 < Lnat p := by
    have := Lnat_cast (p := p) (by omega)
    have hL : (0 : ℤ) < Lpoly p := by
      unfold Lpoly
      have : (5 : ℤ) ≤ p := by exact_mod_cast hp5
      nlinarith
    omega
  have hr2 : r ^ 2 ∣ Lnat p := by
    rw [← Int.natCast_dvd_natCast]; push_cast; rw [Lnat_cast (by omega)]; exact hdvd
  have hrM := hMr r hr hpr hr2
  set M := res.2
  have hMpos : 0 < M := Nat.pos_of_dvd_of_pos hMdvd hLpos
  obtain ⟨c, hc⟩ := hrM
  have hc0 : 0 < c := by
    rcases Nat.eq_zero_or_pos c with h | h
    · rw [h, mul_zero] at hc; omega
    · exact h
  -- `M < p^3` because `M ∣ L(p) < p^3`.
  have hMle : M ≤ Lnat p := Nat.le_of_dvd hLpos hMdvd
  have hLlt : Lnat p < p ^ 3 := by
    have h1 := Nat.one_le_pow 2 p (by omega)
    have h2 := Nat.one_le_pow 3 p (by omega)
    simp only [Lnat]
    omega
  have hr2le : 4 ≤ r ^ 2 := by nlinarith [hr.two_le]
  rcases hsq1 with hM1 | hsq
  · have : r ^ 2 * c = 1 := by rw [← hc]; exact hM1
    have : r ^ 2 ≤ 1 := by nlinarith
    omega
  by_cases hc1 : c = 1
  · subst hc1
    exact notSquareB_spec hsq r (by rw [hc]; ring)
  · -- the least prime factor of `c` divides `M`, hence exceeds `p`.
    have hmf := Nat.minFac_prime hc1
    have hmfdvd : c.minFac ∣ M := (Nat.minFac_dvd c).trans ⟨r ^ 2, by rw [hc]; ring⟩
    have hmfge : res.1 ≤ c.minFac := by
      by_contra hlt
      push_neg at hlt
      exact hMsmall _ hmf.two_le hlt hmfdvd
    have hmfle : c.minFac ≤ c := Nat.minFac_le hc0
    have hcge : p + 1 ≤ c := by omega
    have : (p + 1) ^ 2 * (p + 1) ≤ r ^ 2 * c :=
      Nat.mul_le_mul (Nat.pow_le_pow_left (by omega) 2) hcge
    have : p ^ 3 < (p + 1) ^ 2 * (p + 1) := by nlinarith
    omega

theorem stripCheck_sound {B : ℕ} (h : stripCheck B = true) {p : ℕ} (hp : p.Prime) (hp5 : 5 ≤ p)
    (hpB : p < B) : ∀ r : ℕ, r.Prime → p < r → ¬ ((r : ℤ) ^ 2 ∣ Lpoly p) := by
  have := allBelow_spec h p hpB
  simp only [Bool.or_eq_true, decide_eq_true_eq, Bool.not_eq_true'] at this
  rcases this with (h1 | h1) | h1
  · omega
  · rw [primeFilter_of_prime hp] at h1; exact absurd h1 (by decide)
  · exact stripB_sound hp5 h1

/-! ## Certificate 3: exhaustive search over `n = p^2 q ≤ B` -/

/-- `sigAux n k = ∑_{1 ≤ d ≤ k, d ∣ n} d`. -/
def sigAux (n : ℕ) (k : ℕ) : ℕ :=
  Nat.rec 0 (fun d acc => acc + if n % (d + 1) = 0 then d + 1 else 0) k

lemma sigAux_eq (n k : ℕ) :
    sigAux n k = ∑ d ∈ Finset.filter (· ∣ n) (Finset.Ico 1 (k + 1)), d := by
  induction k with
  | zero => rfl
  | succ k ih =>
    show sigAux n k + (if n % (k + 1) = 0 then k + 1 else 0) = _
    rw [ih, Nat.Ico_succ_right_eq_insert_Ico (a := 1) (b := k + 1) (by omega),
      Finset.filter_insert]
    by_cases h : (k + 1) ∣ n
    · have hm : n % (k + 1) = 0 := Nat.mod_eq_zero_of_dvd h
      rw [if_pos hm, if_pos h, Finset.sum_insert (by simp)]
      ring
    · have hm : ¬ n % (k + 1) = 0 := fun h' => h (Nat.dvd_of_mod_eq_zero h')
      rw [if_neg hm, if_neg h, add_zero]

/-- `σ₁ n` by a flat divisor loop. -/
def sigLoop (n : ℕ) : ℕ := sigAux n n

lemma sigLoop_eq (n : ℕ) : sigLoop n = σ 1 n := by
  rw [sigLoop, sigAux_eq, sigma_one_apply]
  rfl

/-- Checker for one pair `(p, q)`: the `σ`-jump fails at `n = p^2 q`. -/
def pairB (p q : ℕ) : Bool := decide (sigLoop (p ^ 2 * q + 12) ≠ (p ^ 2 + p + 1) * (q + 1) + 12)

/-- Checker for all prime pairs `p ≠ q` with `p < P`, `q < Qb`. -/
def pairCheck (P Qb : ℕ) : Bool :=
  allBelow (fun p => !primeFilter p ||
    allBelow (fun q => !primeFilter q || decide (p = q) || pairB p q) Qb) P

theorem pairCheck_sound {P Qb : ℕ} (h : pairCheck P Qb = true) {p q : ℕ} (hp : p.Prime)
    (hq : q.Prime) (hpq : p ≠ q) (hpP : p < P) (hqQ : q < Qb) : ¬ Jumps (p ^ 2 * q) := by
  intro hJ
  have h1 := allBelow_spec h p hpP
  simp only [Bool.or_eq_true, Bool.not_eq_true', primeFilter_of_prime hp] at h1
  rcases h1 with h1 | h1
  · exact absurd h1 (by decide)
  have h2 := allBelow_spec h1 q hqQ
  simp only [Bool.or_eq_true, Bool.not_eq_true', primeFilter_of_prime hq, decide_eq_true_eq]
    at h2
  rcases h2 with (h2 | h2) | h2
  · exact absurd h2 (by decide)
  · exact hpq h2
  · simp only [pairB, decide_eq_true_eq] at h2
    apply h2
    rw [sigLoop_eq, hJ.2]
    have := (totient_sigma_p2q hp hq hpq).2
    have : σ 1 (p ^ 2 * q) = (p ^ 2 + p + 1) * (q + 1) := by exact_mod_cast this
    rw [this]

end P2qJumps.Cert
