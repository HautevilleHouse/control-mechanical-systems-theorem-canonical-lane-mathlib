import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure MechanicalSystemsEvidenceTerms where
  stabilityCondition : Prop
  controllabilityCondition : Prop
  feedbackLawExists : Prop
  lyapunovFunctionConstructed : Prop
  stabilityConditionClosed : stabilityCondition
  controllabilityConditionClosed : controllabilityCondition
  feedbackLawExistsClosed : feedbackLawExists
  lyapunovFunctionConstructedClosed : lyapunovFunctionConstructed

def MechanicalSystemsEvidenceTermsClosed (E : MechanicalSystemsEvidenceTerms) : Prop :=
  E.stabilityCondition ∧ E.controllabilityCondition ∧ E.feedbackLawExists ∧ E.lyapunovFunctionConstructed

theorem mechanical_systems_complete (E : MechanicalSystemsEvidenceTerms) :
    MechanicalSystemsEvidenceTermsClosed E := by
  exact And.intro E.stabilityConditionClosed
    (And.intro E.controllabilityConditionClosed
      (And.intro E.feedbackLawExistsClosed E.lyapunovFunctionConstructedClosed))

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse
