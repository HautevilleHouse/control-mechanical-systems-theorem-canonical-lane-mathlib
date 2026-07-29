import ControlMechanicalSystemsTheoremCanonicalLaneLean.OptimalControlAndHamiltonJacobi

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure RobustControlPackage {S : ControlSystemStateSpace}
    {R : ReachabilityControllabilityPackage S}
    {P : StabilizabilityFeedbackPackage S R}
    {O : OptimalControlPackage S R P} where
  uncertaintyModel : Prop
  robustStabilityCondition : Prop
  hInfinityNorm : ℝ
  robustPerformanceBound : ℝ
  uncertaintyModelClosed : uncertaintyModel
  robustStabilityConditionClosed : robustStabilityCondition
  hInfinityNormClosed : hInfinityNorm = 0
  robustPerformanceBoundClosed : robustPerformanceBound = 0

structure RobustControlEvidence {S : ControlSystemStateSpace}
    {R : ReachabilityControllabilityPackage S}
    {P : StabilizabilityFeedbackPackage S R}
    {O : OptimalControlPackage S R P}
    (Rbt : RobustControlPackage S R P O) where
  uncertaintyModelClosed : Rbt.uncertaintyModelClosed
  robustStabilityConditionClosed : Rbt.robustStabilityConditionClosed
  hInfinityNormClosed : Rbt.hInfinityNormClosed
  robustPerformanceBoundClosed : Rbt.robustPerformanceBoundClosed

def RobustControlClosed {S : ControlSystemStateSpace}
    {R : ReachabilityControllabilityPackage S}
    {P : StabilizabilityFeedbackPackage S R}
    {O : OptimalControlPackage S R P}
    (Rbt : RobustControlPackage S R P O) : Prop :=
  Rbt.uncertaintyModelClosed ∧ Rbt.robustStabilityConditionClosed ∧ Rbt.hInfinityNormClosed ∧ Rbt.robustPerformanceBoundClosed

theorem robust_control_closed_from_evidence
    {S : ControlSystemStateSpace} {R : ReachabilityControllabilityPackage S}
    {P : StabilizabilityFeedbackPackage S R} {O : OptimalControlPackage S R P}
    (Rbt : RobustControlPackage S R P O) (E : RobustControlEvidence Rbt) :
    RobustControlClosed Rbt := by
  exact And.intro E.uncertaintyModelClosed
    (And.intro E.robustStabilityConditionClosed
      (And.intro E.hInfinityNormClosed E.robustPerformanceBoundClosed))

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse
