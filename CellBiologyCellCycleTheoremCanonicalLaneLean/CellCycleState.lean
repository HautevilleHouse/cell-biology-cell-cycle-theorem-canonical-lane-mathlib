import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCycleStatePackage where
  phase : String
  cyclinLevel : Float
  cdkActivity : Float
  checkpointEngaged : Prop
  dnaIntegrity : Prop

structure CellCycleStateEvidence (C : CellCycleStatePackage) where
  phaseClosed : C.phase = "S" ∨ C.phase = "G2" ∨ C.phase = "M"
  cyclinLevelClosed : C.cyclinLevel > 0.0
  cdkActivityClosed : C.cdkActivity > 0.0
  checkpointEngagedClosed : C.checkpointEngaged
  dnaIntegrityClosed : C.dnaIntegrity

def CellCycleStateClosed (C : CellCycleStatePackage) : Prop :=
  (C.phase = "S" ∨ C.phase = "G2" ∨ C.phase = "M") ∧
  C.cyclinLevel > 0.0 ∧
  C.cdkActivity > 0.0 ∧
  C.checkpointEngaged ∧
  C.dnaIntegrity

theorem cell_cycle_state_closed_from_evidence (C : CellCycleStatePackage) (E : CellCycleStateEvidence C) :
    CellCycleStateClosed C := by
  exact And.intro E.phaseClosed (And.intro E.cyclinLevelClosed (And.intro E.cdkActivityClosed (And.intro E.checkpointEngagedClosed E.dnaIntegrityClosed)))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse