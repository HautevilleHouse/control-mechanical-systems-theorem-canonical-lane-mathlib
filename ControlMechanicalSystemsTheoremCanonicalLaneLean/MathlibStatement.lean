import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ControlMechanicalSystemsTheoremCanonicalLaneLean

structure MathlibProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def mathlibProofObligation : MathlibProofObligation := {
  sourceKey := "control-mechanical-systems-canonical-lane",
  theoremObject := "Control Mechanical Systems Theorem",
  commonCoreImported := true,
  theoremSpecificDefinitionsNative := true,
  theoremSpecificBridgeNative := true,
  theoremSpecificAdmittedClosureNative := true,
  unrestrictedClassicalClosureNative := false,
  carriedGap := "theorem-specific Mathlib endgame pilot closes over the admitted class; unrestricted classical closure remains carried"
}

def theoremSpecificEndgamePilotClosed : Prop :=
  forall (A : AdmissibleClass), ConstrainedMechanicalClosure A

theorem theorem_specific_endgame_pilot_checked :
    theoremSpecificEndgamePilotClosed := by
  intro A
  exact constrained_mechanical_endgame A

end ControlMechanicalSystemsTheoremCanonicalLaneLean
end HautevilleHouse
