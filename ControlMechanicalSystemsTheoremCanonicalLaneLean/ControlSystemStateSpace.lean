import ControlMechanicalSystemsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure ControlSystemStateSpace where
  stateManifold : Type u
  controlInputSpace : Type v
  dynamics : stateManifold -> controlInputSpace -> stateManifold
  smoothDynamics : Prop
  stateManifoldClosed : smoothDynamics

def ControlSystemStateSpaceClosed (S : ControlSystemStateSpace) : Prop :=
  S.smoothDynamics

theorem control_system_state_space_closed (S : ControlSystemStateSpace) :
    ControlSystemStateSpaceClosed S := by
  exact S.stateManifoldClosed

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse
