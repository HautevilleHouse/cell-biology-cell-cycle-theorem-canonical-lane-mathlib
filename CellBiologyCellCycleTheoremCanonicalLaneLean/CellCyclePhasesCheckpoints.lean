import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCyclePhasesCheckpointsPackage where
  g1PhasePresent : Prop
  sPhasePresent : Prop
  g2PhasePresent : Prop
  mPhasePresent : Prop
  g1Checkpoint : Prop
  g2Checkpoint : Prop
  spindleCheckpoint : Prop

structure CellCyclePhasesCheckpointsEvidence (P : CellCyclePhasesCheckpointsPackage) where
  g1PhasePresentClosed : P.g1PhasePresent
  sPhasePresentClosed : P.sPhasePresent
  g2PhasePresentClosed : P.g2PhasePresent
  mPhasePresentClosed : P.mPhasePresent
  g1CheckpointClosed : P.g1Checkpoint
  g2CheckpointClosed : P.g2Checkpoint
  spindleCheckpointClosed : P.spindleCheckpoint

def CellCyclePhasesCheckpointsClosed (P : CellCyclePhasesCheckpointsPackage) : Prop :=
  P.g1PhasePresent ∧ P.sPhasePresent ∧ P.g2PhasePresent ∧ P.mPhasePresent ∧
  P.g1Checkpoint ∧ P.g2Checkpoint ∧ P.spindleCheckpoint

theorem cell_cycle_phases_checkpoints_closed_from_evidence (P : CellCyclePhasesCheckpointsPackage)
    (E : CellCyclePhasesCheckpointsEvidence P) : CellCyclePhasesCheckpointsClosed P := by
  exact And.intro E.g1PhasePresentClosed
    (And.intro E.sPhasePresentClosed
      (And.intro E.g2PhasePresentClosed
        (And.intro E.mPhasePresentClosed
          (And.intro E.g1CheckpointClosed
            (And.intro E.g2CheckpointClosed E.spindleCheckpointClosed)))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse