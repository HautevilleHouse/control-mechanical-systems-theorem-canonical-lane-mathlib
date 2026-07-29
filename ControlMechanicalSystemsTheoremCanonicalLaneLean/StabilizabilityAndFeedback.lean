import ControlMechanicalSystemsTheoremCanonicalLaneLean.ReachabilityAndControllability

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure StabilizabilityFeedbackPackage {S : ControlSystemStateSpace}
    {R : ReachabilityControllabilityPackage S} where
  stabilizableCondition : Prop
  feedbackLaw : S.stateManifold -> S.controlInputSpace
  lyapunovFunction : S.stateManifold -> ℝ
  stabilityMargin : ℝ
  stabilizableConditionClosed : stabilizableCondition
  feedbackLawClosed : feedbackLaw S.stateManifold = S.controlInputSpace
  lyapunovStability : ∀ x : S.stateManifold, lyapunovFunction x ≥ 0 ∧ lyapunovFunction (S.dynamics x (feedbackLaw x)) < lyapunovFunction x

structure StabilizabilityFeedbackEvidence {S : ControlSystemStateSpace}
    {R : ReachabilityControllabilityPackage S}
    (P : StabilizabilityFeedbackPackage S R) where
  stabilizableConditionClosed : P.stabilizableConditionClosed
  feedbackLawClosed : P.feedbackLawClosed
  lyapunovStabilityClosed : P.lyapunovStability

def StabilizabilityFeedbackClosed {S : ControlSystemStateSpace}
    {R : ReachabilityControllabilityPackage S}
    (P : StabilizabilityFeedbackPackage S R) : Prop :=
  P.stabilizableConditionClosed ∧ P.feedbackLawClosed ∧ P.lyapunovStability P.feedbackLaw P.lyapunovFunction

theorem stabilizability_feedback_closed_from_evidence
    {S : ControlSystemStateSpace} {R : ReachabilityControllabilityPackage S}
    (P : StabilizabilityFeedbackPackage S R) (E : StabilizabilityFeedbackEvidence P) :
    StabilizabilityFeedbackClosed P := by
  exact And.intro E.stabilizableConditionClosed (And.intro E.feedbackLawClosed E.lyapunovStabilityClosed)

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse
