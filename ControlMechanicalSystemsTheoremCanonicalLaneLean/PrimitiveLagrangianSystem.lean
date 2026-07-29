import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure PrimitiveLagrangianSystem where
  manifold : Type u
  tangentBundle : Type v
  metric : Type w
  lagrangian : Type x
  kineticEnergy : Prop
  potentialEnergy : Prop
  smoothStructure : Prop
  kineticEnergyTerm : kineticEnergy
  potentialEnergyTerm : potentialEnergy
  smoothStructureTerm : smoothStructure

structure PrimitiveEulerLagrangeFlow (L : PrimitiveLagrangianSystem) where
  actionFunctional : Type y
  stationaryCondition : Prop
  geodesicEquation : Prop
  energyConservation : Prop
  stationaryConditionTerm : stationaryCondition
  geodesicEquationTerm : geodesicEquation
  energyConservationTerm : energyConservation

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse