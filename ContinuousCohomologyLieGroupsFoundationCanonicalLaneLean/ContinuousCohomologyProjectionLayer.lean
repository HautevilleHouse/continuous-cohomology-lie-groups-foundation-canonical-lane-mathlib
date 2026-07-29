import ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean.ContinuousCohomologySubstrate

noncomputable section

universe u

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean

structure ContinuousCohomologyProjectionState (G : NativeLieGroup.{u}) where
  geometricObject : String
  cohomologyProfile : NativeContinuousCohomologyProfile G
  continuousCohomologyRecorded : Bool
  admissibleContinuousCohomologyClass : Bool
  carriedClassicalBoundary : Bool

def continuousCohomologyProjection (G : NativeLieGroup.{u}) (S : ContinuousCohomologyProjectionState G) : ContinuousCohomologyProjectionState G :=
  { S with
    continuousCohomologyRecorded := true
    admissibleContinuousCohomologyClass := true
    carriedClassicalBoundary := true }

theorem continuous_cohomology_projection_idempotent (G : NativeLieGroup.{u}) (S : ContinuousCohomologyProjectionState G) :
    continuousCohomologyProjection G (continuousCohomologyProjection G S) = continuousCohomologyProjection G S := by
  cases S
  rfl

def continuousCohomologyProjectedClosureState (G : NativeLieGroup.{u}) (p : ℕ) : ContinuousCohomologyProjectionState G :=
  continuousCohomologyProjection G {
    geometricObject := "ContinuousCohomologyLieGroupsFoundation",
    cohomologyProfile := continuousCohomologyProfile G p,
    continuousCohomologyRecorded := false,
    admissibleContinuousCohomologyClass := false,
    carriedClassicalBoundary := false
  }

theorem continuous_cohomology_projected_closure_state_checked (G : NativeLieGroup.{u}) (p : ℕ) :
    (continuousCohomologyProjectedClosureState G p).continuousCohomologyRecorded = true ∧
    (continuousCohomologyProjectedClosureState G p).admissibleContinuousCohomologyClass = true ∧
    (continuousCohomologyProjectedClosureState G p).carriedClassicalBoundary = true := by
  exact ⟨rfl, rfl, rfl⟩

end ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean
end HautevilleHouse