import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BridgeClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse
