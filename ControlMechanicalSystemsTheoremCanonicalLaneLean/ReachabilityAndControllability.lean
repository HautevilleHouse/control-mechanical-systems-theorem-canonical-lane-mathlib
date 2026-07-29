import ControlMechanicalSystemsTheoremCanonicalLaneLean.ControlSystemStateSpace

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure ReachabilityControllabilityPackage {S : ControlSystemStateSpace} where
  reachableSet : S.stateManifold -> Prop
  controllableSubspace : Prop
  controllabilityGramian : Prop
  reachableSetClosed : reachableSet S.stateManifold
  controllableSubspaceClosed : controllableSubspace
  controllabilityGramianClosed : controllabilityGramian

structure ReachabilityControllabilityEvidence {S : ControlSystemStateSpace}
    (R : ReachabilityControllabilityPackage S) where
  reachableSetClosed : R.reachableSetClosed
  controllableSubspaceClosed : R.controllableSubspaceClosed
  controllabilityGramianClosed : R.controllabilityGramianClosed

def ReachabilityControllabilityClosed {S : ControlSystemStateSpace}
    (R : ReachabilityControllabilityPackage S) : Prop :=
  R.reachableSetClosed ∧ R.controllableSubspaceClosed ∧ R.controllabilityGramianClosed

theorem reachability_controllability_closed_from_evidence
    {S : ControlSystemStateSpace} (R : ReachabilityControllabilityPackage S)
    (E : ReachabilityControllabilityEvidence R) : ReachabilityControllabilityClosed R := by
  exact And.intro E.reachableSetClosed (And.intro E.controllableSubspaceClosed E.controllabilityGramianClosed)

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse
