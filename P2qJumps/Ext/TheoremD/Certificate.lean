/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import Mathlib

/-!
# P2qJumps.Ext.TheoremD.Certificate

Machine-checked Lean 4 module.
-/

namespace P2qTheoremD

def shiftedN (p q : ℝ) : ℝ := p^2*q+12
def defectA (p q : ℝ) : ℝ := p*(p+q-1)
def invariantQ (p q : ℝ) : ℝ := p^4+p*q^2-p-12*(2*p+q+1)
def gapH (p q : ℝ) : ℝ :=
  (defectA p q)^2*((shiftedN p q)^2-invariantQ p q) -
  (p-1)*invariantQ p q*(shiftedN p q)^2

/-- All 50 coefficients are verified by `ring` in the kernel. -/
lemma gapH_certificate (u v : ℝ) :
    gapH (5+v) (121*(5+v)^2+u) =
    1*u^4*v^5 +
    25*u^4*v^4 +
    249*u^4*v^3 +
    1235*u^4*v^2 +
    3050*u^4*v +
    3000*u^4 +
    486*u^3*v^7 +
    17008*u^3*v^6 +
    254618*u^3*v^5 +
    2113686*u^3*v^4 +
    10507996*u^3*v^3 +
    31283302*u^3*v^2 +
    51638820*u^3*v +
    36457300*u^3 +
    88571*u^2*v^9 +
    3984971*u^2*v^8 +
    79601448*u^2*v^7 +
    926561423*u^2*v^6 +
    6925922712*u^2*v^5 +
    34476223473*u^2*v^4 +
    114286161796*u^2*v^3 +
    243275105065*u^2*v^2 +
    301734936969*u^2*v +
    166137915220*u^2 +
    7173848*u*v^11 +
    394474278*u*v^10 +
    9853113248*u*v^9 +
    147566539538*u*v^8 +
    1472368828520*u*v^7 +
    10276515001190*u*v^6 +
    51197202304964*u*v^5 +
    182059837555936*u*v^4 +
    452868269537494*u*v^3 +
    750457523626422*u*v^2 +
    745615736659398*u*v +
    336480831155212*u +
    217887362*v^13 +
    14159164690*v^12 +
    424476396069*v^11 +
    7773028800966*v^10 +
    97005056089909*v^9 +
    871219970372883*v^8 +
    5793251378294540*v^7 +
    28878258873107255*v^6 +
    107912463196443131*v^5 +
    298556808669155502*v^4 +
    594430632416495466*v^3 +
    806543956869002608*v^2 +
    668431452748893383*v +
    255548359570022612 := by
  unfold gapH defectA shiftedN invariantQ
  ring

lemma gapH_positive (p q : ℝ) (hp : 5 ≤ p) (hq : 121*p^2 ≤ q) :
    0 < gapH p q := by
  let u := q-121*p^2
  let v := p-5
  have hu : 0 ≤ u := sub_nonneg.mpr hq
  have hv : 0 ≤ v := sub_nonneg.mpr hp
  have he : gapH p q = gapH (5+v) (121*(5+v)^2+u) := by
    dsimp [u,v]
    congr 1 <;> ring
  rw [he, gapH_certificate]
  positivity

end P2qTheoremD
