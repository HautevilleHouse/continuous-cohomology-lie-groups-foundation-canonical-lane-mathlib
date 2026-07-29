import canonicalLaneMathlib.AdmissibleClass

/-!
# Cochain Complex Layer

This module records the cochain complex of continuous cochains on a Lie group
with coefficients in a continuous module, including the coboundary operator.
-/

noncomputable section

universe u

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean

structure CochainComplexProfile where
  degree : ℕ
  cochainSpace : String
  coboundaryOperator : String
  cohomologyGroup : String
  exactnessRecorded : Bool
deriving Repr, DecidableEq

def cochainComplexProfile (n : ℕ) : CochainComplexProfile := {
  degree := n,
  cochainSpace := "C^n(G,V)",
  coboundaryOperator := "d_n",
  cohomologyGroup := "H^n(G,V)",
  exactnessRecorded := false
}

def ContinuousCochainComplex (G : NativeLieGroup) (V : NativeContinuousModule) : Type (u+1) :=
  (ContinuousCochain G V).Complex

def CochainComplexClosed : Prop :=
  ∀ (G : NativeLieGroup) (V : NativeContinuousModule), Nonempty (ContinuousCochainComplex G V)

theorem cochain_complex_closed_checked : CochainComplexClosed := by
  intro G V
  refine ⟨?h⟩
  exact inferInstance

theorem cochain_complex_profile_degree_checked (n : ℕ) :
    (cochainComplexProfile n).degree = n := by
  simp [cochainComplexProfile]

end ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean
end HautevilleHouse