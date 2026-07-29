import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure SlidingModeControlPackage where
  switchingSurface : Type u
  reachingCondition : Prop
  equivalentControl : Prop
  chatteringSuppression : Prop

structure SlidingModeControlEvidence (S : SlidingModeControlPackage) where
  switchingSurfaceClosed : S.switchingSurface
  reachingConditionClosed : S.reachingCondition
  equivalentControlClosed : S.equivalentControl
  chatteringSuppressionClosed : S.chatteringSuppression

def SlidingModeControlClosed (S : SlidingModeControlPackage) : Prop :=
  S.switchingSurface ∧ S.reachingCondition ∧ S.equivalentControl ∧ S.chatteringSuppression

theorem sliding_mode_control_closed_from_evidence (S : SlidingModeControlPackage)
    (E : SlidingModeControlEvidence S) : SlidingModeControlClosed S := by
  exact And.intro E.switchingSurfaceClosed (And.intro E.reachingConditionClosed
    (And.intro E.equivalentControlClosed E.chatteringSuppressionClosed))

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse