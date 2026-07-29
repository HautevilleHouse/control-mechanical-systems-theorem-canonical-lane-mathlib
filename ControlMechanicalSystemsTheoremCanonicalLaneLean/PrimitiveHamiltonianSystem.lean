import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure PrimitiveHamiltonianSystem where
  phaseSpace : Type u
  symplecticForm : Type v
  hamiltonian : Type w
  symplecticManifold : Prop
  hamiltonianSmooth : Prop
  symplecticManifoldTerm : symplecticManifold
  hamiltonianSmoothTerm : hamiltonianSmooth

structure PrimitiveHamiltonFlow (H : PrimitiveHamiltonianSystem) where
  flowMap : Type x
  vectorField : Type y
  poissonBracket : Prop
  energyConservation : Prop
  poissonBracketTerm : poissonBracket
  energyConservationTerm : energyConservation

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse