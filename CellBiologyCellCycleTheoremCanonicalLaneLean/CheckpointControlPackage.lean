import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheorem

structure CheckpointControlPackage where
  g1Checkpoint : Prop
  g2Checkpoint : Prop
  spindleCheckpoint : Prop
  dnaDamageCheckpoint : Prop
  mitoticExitCheckpoint : Prop

structure CheckpointControlEvidence (C : CheckpointControlPackage) where
  g1CheckpointClosed : C.g1Checkpoint
  g2CheckpointClosed : C.g2Checkpoint
  spindleCheckpointClosed : C.spindleCheckpoint
  dnaDamageCheckpointClosed : C.dnaDamageCheckpoint
  mitoticExitCheckpointClosed : C.mitoticExitCheckpoint

def CheckpointControlClosed (C : CheckpointControlPackage) : Prop :=
  C.g1Checkpoint ∧ C.g2Checkpoint ∧ C.spindleCheckpoint ∧ C.dnaDamageCheckpoint ∧ C.mitoticExitCheckpoint

theorem checkpoint_control_closed_from_evidence (C : CheckpointControlPackage) (E : CheckpointControlEvidence C) :
    CheckpointControlClosed C := by
  exact And.intro E.g1CheckpointClosed
    (And.intro E.g2CheckpointClosed
      (And.intro E.spindleCheckpointClosed
        (And.intro E.dnaDamageCheckpointClosed E.mitoticExitCheckpointClosed)))

end CellBiologyCellCycleTheorem
end HautevilleHouse