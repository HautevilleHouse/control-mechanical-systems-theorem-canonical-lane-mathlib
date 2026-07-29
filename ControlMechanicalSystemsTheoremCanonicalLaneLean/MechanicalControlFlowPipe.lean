import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure MechanicalControlFlowPipe (L : PrimitiveLagrangianSystem) (H : PrimitiveHamiltonianSystem) where
  lagrangianFlow : PrimitiveEulerLagrangeFlow L
  hamiltonianFlow : PrimitiveHamiltonFlow H
  feedbackControl : FeedbackControlPackage L H
  optimalControl : OptimalControlPackage L H
  lagrangianHamiltonianCompatibility : Prop
  controlClosedLoopStability : Prop
  lagrangianHamiltonianCompatibilityTerm : lagrangianHamiltonianCompatibility
  controlClosedLoopStabilityTerm : controlClosedLoopStability

structure MechanicalControlFlowEvidence (L : PrimitiveLagrangianSystem) (H : PrimitiveHamiltonianSystem)
    (P : MechanicalControlFlowPipe L H) where
  feedbackControlClosed : FeedbackControlClosed P.feedbackControl
  optimalControlClosed : OptimalControlClosed P.optimalControl
  lagrangianHamiltonianCompatibilityClosed : P.lagrangianHamiltonianCompatibility
  controlClosedLoopStabilityClosed : P.controlClosedLoopStability

def MechanicalControlFlowClosed (L : PrimitiveLagrangianSystem) (H : PrimitiveHamiltonianSystem)
    (P : MechanicalControlFlowPipe L H) : Prop :=
  FeedbackControlClosed P.feedbackControl ∧ OptimalControlClosed P.optimalControl ∧
  P.lagrangianHamiltonianCompatibility ∧ P.controlClosedLoopStability

theorem mechanical_control_flow_closed_from_evidence (L : PrimitiveLagrangianSystem) (H : PrimitiveHamiltonianSystem)
    (P : MechanicalControlFlowPipe L H) (E : MechanicalControlFlowEvidence L H P) :
    MechanicalControlFlowClosed L H P := by
  exact And.intro E.feedbackControlClosed (And.intro E.optimalControlClosed
    (And.intro E.lagrangianHamiltonianCompatibilityClosed E.controlClosedLoopStabilityClosed))

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse