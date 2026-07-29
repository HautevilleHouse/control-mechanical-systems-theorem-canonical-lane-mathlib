import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure AdmittedMechanicalSystem where
  stateSpace : Type u
  dynamics : Type v
  controlInputs : Type w
  stabilityGuaranteed : Prop
  controllabilityAchieved : Prop
  conclusion : stabilityGuaranteed ∧ controllabilityAchieved

structure BridgeClosed (S : AdmittedMechanicalSystem) : Prop where
  bridgeCondition : S.stabilityGuaranteed ∧ S.controllabilityAchieved

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse
