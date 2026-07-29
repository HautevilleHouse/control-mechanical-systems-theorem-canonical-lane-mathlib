import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure FeedbackControlPackage (L : PrimitiveLagrangianSystem) (H : PrimitiveHamiltonianSystem) where
  stateSpace : Type u
  controlInput : Type v
  feedbackLaw : Type w
  stabilizability : Prop
  controllability : Prop
  lyapunovFunctionExistence : Prop
  stabilizabilityTerm : stabilizability
  controllabilityTerm : controllability
  lyapunovFunctionExistenceTerm : lyapunovFunctionExistence

structure FeedbackControlEvidence {L : PrimitiveLagrangianSystem} {H : PrimitiveHamiltonianSystem}
    (C : FeedbackControlPackage L H) where
  stabilizabilityClosed : C.stabilizability
  controllabilityClosed : C.controllability
  lyapunovFunctionExistenceClosed : C.lyapunovFunctionExistence

def FeedbackControlClosed {L : PrimitiveLagrangianSystem} {H : PrimitiveHamiltonianSystem}
    (C : FeedbackControlPackage L H) : Prop :=
  C.stabilizability ∧ C.controllability ∧ C.lyapunovFunctionExistence

theorem feedback_control_closed_from_evidence {L : PrimitiveLagrangianSystem} {H : PrimitiveHamiltonianSystem}
    (C : FeedbackControlPackage L H) (E : FeedbackControlEvidence C) : FeedbackControlClosed C := by
  exact And.intro E.stabilizabilityClosed (And.intro E.controllabilityClosed E.lyapunovFunctionExistenceClosed)

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse