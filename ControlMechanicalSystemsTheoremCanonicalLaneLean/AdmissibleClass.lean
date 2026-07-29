import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedMechanicalSystem
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BridgeClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse
