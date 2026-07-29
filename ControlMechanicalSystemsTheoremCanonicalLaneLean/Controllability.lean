import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure ControllabilityPackage where
  reachableSet : Type u
  controlInputs : Type v
  systemDynamics : Prop
  fullReachability : Prop

structure ControllabilityEvidence (C : ControllabilityPackage) where
  reachableSetClosed : C.reachableSet
  controlInputsClosed : C.controlInputs
  systemDynamicsClosed : C.systemDynamics
  fullReachabilityClosed : C.fullReachability

def ControllabilityClosed (C : ControllabilityPackage) : Prop :=
  C.reachableSet ∧ C.controlInputs ∧ C.systemDynamics ∧ C.fullReachability

theorem controllability_closed_from_evidence (C : ControllabilityPackage)
    (E : ControllabilityEvidence C) : ControllabilityClosed C := by
  exact And.intro E.reachableSetClosed (And.intro E.controlInputsClosed
    (And.intro E.systemDynamicsClosed E.fullReachabilityClosed))

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse