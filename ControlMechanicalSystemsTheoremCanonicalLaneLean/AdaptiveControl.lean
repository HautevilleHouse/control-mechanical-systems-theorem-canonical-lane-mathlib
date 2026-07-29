import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure AdaptiveControlPackage where
  parameterEstimation : Type u
  updateLaw : Prop
  certaintyEquivalence : Prop
  stabilityGuarantee : Prop

structure AdaptiveControlEvidence (A : AdaptiveControlPackage) where
  parameterEstimationClosed : A.parameterEstimation
  updateLawClosed : A.updateLaw
  certaintyEquivalenceClosed : A.certaintyEquivalence
  stabilityGuaranteeClosed : A.stabilityGuarantee

def AdaptiveControlClosed (A : AdaptiveControlPackage) : Prop :=
  A.parameterEstimation ∧ A.updateLaw ∧ A.certaintyEquivalence ∧ A.stabilityGuarantee

theorem adaptive_control_closed_from_evidence (A : AdaptiveControlPackage)
    (E : AdaptiveControlEvidence A) : AdaptiveControlClosed A := by
  exact And.intro E.parameterEstimationClosed (And.intro E.updateLawClosed
    (And.intro E.certaintyEquivalenceClosed E.stabilityGuaranteeClosed))

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse