import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCycleCheckpointControlPackage where
  dnaDamageCheckpoint : Prop
  spindleCheckpoint : Prop
  restrictionPoint : Prop
  checkpointSignalingPathways : Prop
  cellCycleArrestMechanisms : Prop
  checkpointRecovery : Prop

structure CellCycleCheckpointControlEvidence (C : CellCycleCheckpointControlPackage) where
  dnaDamageCheckpointClosed : C.dnaDamageCheckpoint
  spindleCheckpointClosed : C.spindleCheckpoint
  restrictionPointClosed : C.restrictionPoint
  checkpointSignalingPathwaysClosed : C.checkpointSignalingPathways
  cellCycleArrestMechanismsClosed : C.cellCycleArrestMechanisms
  checkpointRecoveryClosed : C.checkpointRecovery

def CellCycleCheckpointControlClosed (C : CellCycleCheckpointControlPackage) : Prop :=
  C.dnaDamageCheckpoint ∧ C.spindleCheckpoint ∧ C.restrictionPoint ∧
  C.checkpointSignalingPathways ∧ C.cellCycleArrestMechanisms ∧ C.checkpointRecovery

theorem cell_cycle_checkpoint_control_closed_from_evidence
    (C : CellCycleCheckpointControlPackage) (E : CellCycleCheckpointControlEvidence C) :
    CellCycleCheckpointControlClosed C := by
  exact And.intro E.dnaDamageCheckpointClosed
    (And.intro E.spindleCheckpointClosed
      (And.intro E.restrictionPointClosed
        (And.intro E.checkpointSignalingPathwaysClosed
          (And.intro E.cellCycleArrestMechanismsClosed E.checkpointRecoveryClosed))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse
