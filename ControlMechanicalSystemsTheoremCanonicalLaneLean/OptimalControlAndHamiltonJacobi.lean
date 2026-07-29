import ControlMechanicalSystemsTheoremCanonicalLaneLean.StabilizabilityAndFeedback

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure OptimalControlPackage {S : ControlSystemStateSpace}
    {R : ReachabilityControllabilityPackage S}
    {P : StabilizabilityFeedbackPackage S R} where
  costFunctional : (S.stateManifold -> S.controlInputSpace) -> ℝ
  hamiltonJacobiBellmanEquation : Prop
  valueFunction : S.stateManifold -> ℝ
  optimalFeedbackLaw : S.stateManifold -> S.controlInputSpace
  costFunctionalClosed : costFunctional optimalFeedbackLaw = 0
  hamiltonJacobiBellmanEquationClosed : hamiltonJacobiBellmanEquation
  valueFunctionClosed : valueFunction S.stateManifold = 0

structure OptimalControlEvidence {S : ControlSystemStateSpace}
    {R : ReachabilityControllabilityPackage S}
    {P : StabilizabilityFeedbackPackage S R}
    (O : OptimalControlPackage S R P) where
  costFunctionalClosed : O.costFunctionalClosed
  hamiltonJacobiBellmanEquationClosed : O.hamiltonJacobiBellmanEquationClosed
  valueFunctionClosed : O.valueFunctionClosed

def OptimalControlClosed {S : ControlSystemStateSpace}
    {R : ReachabilityControllabilityPackage S}
    {P : StabilizabilityFeedbackPackage S R}
    (O : OptimalControlPackage S R P) : Prop :=
  O.costFunctionalClosed ∧ O.hamiltonJacobiBellmanEquationClosed ∧ O.valueFunctionClosed

theorem optimal_control_closed_from_evidence
    {S : ControlSystemStateSpace} {R : ReachabilityControllabilityPackage S}
    {P : StabilizabilityFeedbackPackage S R} (O : OptimalControlPackage S R P)
    (E : OptimalControlEvidence O) : OptimalControlClosed O := by
  exact And.intro E.costFunctionalClosed (And.intro E.hamiltonJacobiBellmanEquationClosed E.valueFunctionClosed)

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse
