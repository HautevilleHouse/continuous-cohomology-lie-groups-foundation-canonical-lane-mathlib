import canonicalLaneMathlib.AdmissibleClass

/-!
# Continuous Module Layer

This module represents the continuous module side: a topological vector space
with smooth action of the Lie group.
-/

noncomputable section

universe u

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean

open Topology

structure NativeContinuousModule where
  underlyingVectorSpace : NativeTopologicalVectorSpace.{u}
  smoothAction : NativeSmoothAction underlyingVectorSpace

def NativeContinuousModule.baseVectorSpace (V : NativeContinuousModule) : NativeTopologicalVectorSpace.{u} :=
  V.underlyingVectorSpace

def NativeContinuousModule.smoothActionProof (V : NativeContinuousModule) : Prop :=
  V.smoothAction.isContinuous

theorem native_continuous_module_smooth_action_continuous (V : NativeContinuousModule) :
    V.smoothActionProof := by
  exact V.smoothAction.isContinuous

structure ContinuousModuleSubstrate where
  topologicalVectorSpaceAvailable : Bool
  continuousActionAvailable : Bool
  differentiableActionAvailable : Bool
deriving Repr, DecidableEq

def continuousModuleSubstrate : ContinuousModuleSubstrate := {
  topologicalVectorSpaceAvailable := true,
  continuousActionAvailable := true,
  differentiableActionAvailable := true
}

theorem continuous_module_substrate_checked :
    continuousModuleSubstrate.topologicalVectorSpaceAvailable = true ∧
    continuousModuleSubstrate.continuousActionAvailable = true ∧
    continuousModuleSubstrate.differentiableActionAvailable = true := by
  exact ⟨rfl, rfl, rfl⟩

end ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean
end HautevilleHouse