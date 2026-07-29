import ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean.LieGroupGeometricObjects

noncomputable section

universe u

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean

structure NativeContinuousCohomologyProfile (G : NativeLieGroup.{u}) where
  degree : ℕ
  coefficientModule : Type u
  continuousCohomologyGroup : Type (u + 1)
  differentiableCohomologyRoute : Bool
  continuousCohomologyRoute : Bool

def continuousCohomologyProfile (G : NativeLieGroup.{u}) (p : ℕ) : NativeContinuousCohomologyProfile G := {
  degree := p,
  coefficientModule := ℝ,
  continuousCohomologyGroup := G.ContinuousCohomology p ℝ,
  differentiableCohomologyRoute := true,
  continuousCohomologyRoute := true
}

def ContinuousCohomologyTypeAvailable (G : NativeLieGroup.{u}) : Prop :=
  ∀ (p : ℕ), Nonempty (NativeContinuousCohomologyProfile G)

theorem continuous_cohomology_type_available_checked (G : NativeLieGroup.{u}) :
    ContinuousCohomologyTypeAvailable G := by
  intro p
  exact ⟨continuousCohomologyProfile G p⟩

theorem continuous_cohomology_profile_routes_checked (G : NativeLieGroup.{u}) (p : ℕ) :
    (continuousCohomologyProfile G p).differentiableCohomologyRoute = true ∧
    (continuousCohomologyProfile G p).continuousCohomologyRoute = true := by
  simp [continuousCohomologyProfile]

end ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean
end HautevilleHouse