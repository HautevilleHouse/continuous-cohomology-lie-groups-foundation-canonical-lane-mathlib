import canonicalLaneMathlib.MathlibObjects

namespace HautevilleHouse
namespace ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedTheoremObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  NativeBridgeClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ContinuousCohomologyLieGroupsFoundationCanonicalLaneLean
end HautevilleHouse