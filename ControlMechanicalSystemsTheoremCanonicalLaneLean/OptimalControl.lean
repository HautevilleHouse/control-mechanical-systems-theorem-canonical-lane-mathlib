import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure OptimalControlPackage where
  costFunctional : Type u
  dynamicsConstraint : Prop
  pontryaginMaximumPrinciple : Prop
  optimalTrajectory : Prop

structure OptimalControlEvidence (O : OptimalControlPackage) where
  costFunctionalClosed : O.costFunctional
  dynamicsConstraintClosed : O.dynamicsConstraint
  pontryaginMaximumPrincipleClosed : O.pontryaginMaximumPrinciple
  optimalTrajectoryClosed : O.optimalTrajectory

def OptimalControlClosed (O : OptimalControlPackage) : Prop :=
  O.costFunctional ∧ O.dynamicsConstraint ∧ O.pontryaginMaximumPrinciple ∧ O.optimalTrajectory

theorem optimal_control_closed_from_evidence (O : OptimalControlPackage)
    (E : OptimalControlEvidence O) : OptimalControlClosed O := by
  exact And.intro E.costFunctionalClosed (And.intro E.dynamicsConstraintClosed
    (And.intro E.pontryaginMaximumPrincipleClosed E.optimalTrajectoryClosed))

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse