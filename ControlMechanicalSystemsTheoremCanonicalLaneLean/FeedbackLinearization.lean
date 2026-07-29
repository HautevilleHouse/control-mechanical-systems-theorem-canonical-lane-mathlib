import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure FeedbackLinearizationPackage where
  nonlinearSystem : Type u
  feedbackLaw : Type v
  diffeomorphism : Prop
  linearizedSystem : Prop

structure FeedbackLinearizationEvidence (F : FeedbackLinearizationPackage) where
  nonlinearSystemClosed : F.nonlinearSystem
  feedbackLawClosed : F.feedbackLaw
  diffeomorphismClosed : F.diffeomorphism
  linearizedSystemClosed : F.linearizedSystem

def FeedbackLinearizationClosed (F : FeedbackLinearizationPackage) : Prop :=
  F.nonlinearSystem ∧ F.feedbackLaw ∧ F.diffeomorphism ∧ F.linearizedSystem

theorem feedback_linearization_closed_from_evidence (F : FeedbackLinearizationPackage)
    (E : FeedbackLinearizationEvidence F) : FeedbackLinearizationClosed F := by
  exact And.intro E.nonlinearSystemClosed (And.intro E.feedbackLawClosed
    (And.intro E.diffeomorphismClosed E.linearizedSystemClosed))

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse