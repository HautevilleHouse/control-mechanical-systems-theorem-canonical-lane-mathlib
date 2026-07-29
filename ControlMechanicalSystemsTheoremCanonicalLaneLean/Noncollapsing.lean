import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure NoncollapsingPackage where
  scaleInvariantBound : Prop
  curvatureScaleControl : Prop
  blowupLimitNoncollapsed : Prop

structure NoncollapsingEvidence (N : NoncollapsingPackage) where
  scaleInvariantBoundClosed : N.scaleInvariantBound
  curvatureScaleControlClosed : N.curvatureScaleControl
  blowupLimitNoncollapsedClosed : N.blowupLimitNoncollapsed

def NoncollapsingClosed (N : NoncollapsingPackage) : Prop :=
  N.scaleInvariantBound ∧ N.curvatureScaleControl ∧ N.blowupLimitNoncollapsed

theorem noncollapsing_closed_from_evidence (N : NoncollapsingPackage) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.scaleInvariantBoundClosed
    (And.intro E.curvatureScaleControlClosed E.blowupLimitNoncollapsedClosed)

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse
