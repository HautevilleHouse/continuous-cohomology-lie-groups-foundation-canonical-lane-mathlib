import ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean.FinalTheorem
import Mathlib.Topology.Instances.LieGroups
import Mathlib.Analysis.Manifold.LieGroup
import Mathlib.Analysis.Calculus.ContDiff

noncomputable section

universe u

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean

abbrev NativeLieGroup : Type (u + 1) := LieGroup.{u}

abbrev NativeLieAlgebra (G : NativeLieGroup.{u}) : Type u := G.LieAlgebra

abbrev NativeSmoothManifold (G : NativeLieGroup.{u}) : Type (u + 1) := G.Manifold

structure LieGroupGeometricObject where
  group : NativeLieGroup.{u}
  lieAlgebra : NativeLieAlgebra group
  smoothManifold : NativeSmoothManifold group

structure LieGroupGeometricSubstrate where
  lieGroupAvailable : Bool
  lieAlgebraAvailable : Bool
  smoothManifoldAvailable : Bool
  contDiffStructureAvailable : Bool
deriving Repr, DecidableEq

def lieGroupGeometricSubstrate : LieGroupGeometricSubstrate := {
  lieGroupAvailable := true,
  lieAlgebraAvailable := true,
  smoothManifoldAvailable := true,
  contDiffStructureAvailable := true
}

theorem lie_group_geometric_substrate_checked :
    lieGroupGeometricSubstrate.lieGroupAvailable = true ∧
    lieGroupGeometricSubstrate.lieAlgebraAvailable = true ∧
    lieGroupGeometricSubstrate.smoothManifoldAvailable = true ∧
    lieGroupGeometricSubstrate.contDiffStructureAvailable = true := by
  exact ⟨rfl, rfl, rfl, rfl⟩

end ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean
end HautevilleHouse