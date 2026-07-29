import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure OptimalControlPackage (L : PrimitiveLagrangianSystem) (H : PrimitiveHamiltonianSystem) where
  costFunctional : Type u
  pontryaginPrinciple : Prop
  bellmanEquation : Prop
  hjbEquation : Prop
  pontryaginPrincipleTerm : pontryaginPrinciple
  bellmanEquationTerm : bellmanEquation
  hjbEquationTerm : hjbEquation

structure OptimalControlEvidence {L : PrimitiveLagrangianSystem} {H : PrimitiveHamiltonianSystem}
    (C : OptimalControlPackage L H) where
  pontryaginPrincipleClosed : C.pontryaginPrinciple
  bellmanEquationClosed : C.bellmanEquation
  hjbEquationClosed : C.hjbEquation

def OptimalControlClosed {L : PrimitiveLagrangianSystem} {H : PrimitiveHamiltonianSystem}
    (C : OptimalControlPackage L H) : Prop :=
  C.pontryaginPrinciple ∧ C.bellmanEquation ∧ C.hjbEquation

theorem optimal_control_closed_from_evidence {L : PrimitiveLagrangianSystem} {H : PrimitiveHamiltonianSystem}
    (C : OptimalControlPackage L H) (E : OptimalControlEvidence C) : OptimalControlClosed C := by
  exact And.intro E.pontryaginPrincipleClosed (And.intro E.bellmanEquationClosed E.hjbEquationClosed)

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse