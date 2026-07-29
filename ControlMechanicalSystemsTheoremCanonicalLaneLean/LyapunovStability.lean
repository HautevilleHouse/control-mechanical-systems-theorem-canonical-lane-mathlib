import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure LyapunovStabilityPackage where
  equilibriumPoint : Prop
  lyapunovFunctionExists : Prop
  derivativeNegativeDefinite : Prop
  asymptoticStability : Prop

structure LyapunovStabilityEvidence (L : LyapunovStabilityPackage) where
  equilibriumPointClosed : L.equilibriumPoint
  lyapunovFunctionExistsClosed : L.lyapunovFunctionExists
  derivativeNegativeDefiniteClosed : L.derivativeNegativeDefinite
  asymptoticStabilityClosed : L.asymptoticStability

def LyapunovStabilityClosed (L : LyapunovStabilityPackage) : Prop :=
  L.equilibriumPoint ∧ L.lyapunovFunctionExists ∧ L.derivativeNegativeDefinite ∧ L.asymptoticStability

theorem lyapunov_stability_closed_from_evidence (L : LyapunovStabilityPackage)
    (E : LyapunovStabilityEvidence L) : LyapunovStabilityClosed L := by
  exact And.intro E.equilibriumPointClosed (And.intro E.lyapunovFunctionExistsClosed
    (And.intro E.derivativeNegativeDefiniteClosed E.asymptoticStabilityClosed))

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse