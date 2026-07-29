import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

def ConstrainedControlMechanicalClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_control_mechanical_endgame (A : AdmissibleClass) :
    ConstrainedControlMechanicalClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse