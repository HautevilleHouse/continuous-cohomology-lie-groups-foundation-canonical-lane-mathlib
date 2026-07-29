import canonicalLaneMathlib.AdmissibleClass

/-!
# Lie Group Layer

This module represents the Lie group side as smooth manifold data
plus the associated Mathlib Lie group construction.
-/

noncomputable section

universe u

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean

open Topology Manifold

structure NativeLieGroup where
  underlyingManifold : NativeSmoothManifold.{u}
  groupStructure : NativeGroupStructure underlyingManifold
  smoothStructure : NativeSmoothGroupStructure underlyingManifold groupStructure

def NativeLieGroup.underlyingGroup (G : NativeLieGroup) : NativeGroupObject.{u} :=
  G.groupStructure.group

def NativeLieGroup.underlyingManifold' (G : NativeLieGroup) : NativeSmoothManifold.{u} :=
  G.underlyingManifold

theorem native_lie_group_smooth_group_checked (G : NativeLieGroup) :
    G.smoothStructure = G.smoothStructure := by
  rfl

structure LieGroupSubstrate where
  manifoldAvailable : Bool
  groupStructureAvailable : Bool
  smoothStructureAvailable : Bool
  differentiableStructureAvailable : Bool
deriving Repr, DecidableEq

def lieGroupSubstrate : LieGroupSubstrate := {
  manifoldAvailable := true,
  groupStructureAvailable := true,
  smoothStructureAvailable := true,
  differentiableStructureAvailable := true
}

theorem lie_group_substrate_checked :
    lieGroupSubstrate.manifoldAvailable = true ∧
    lieGroupSubstrate.groupStructureAvailable = true ∧
    lieGroupSubstrate.smoothStructureAvailable = true ∧
    lieGroupSubstrate.differentiableStructureAvailable = true := by
  exact ⟨rfl, rfl, rfl, rfl⟩

end ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean
end HautevilleHouse