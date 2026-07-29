import canonicalLaneMathlib.AdmissibleClass
import CellBiologyCellCycleTheoremCanonicalLaneLean.CellCyclePhases

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CheckpointRegulationPackage {P : CellCyclePhasesPackage} where
  g1Checkpoint : Prop
  g2Checkpoint : Prop
  spindleCheckpoint : Prop
  dnaDamageCheckpoint : Prop
  checkpointSignaling : Prop
  checkpointIntegrity : Prop

structure CheckpointRegulationEvidence {P : CellCyclePhasesPackage}
    (C : CheckpointRegulationPackage P) where
  g1CheckpointClosed : C.g1Checkpoint
  g2CheckpointClosed : C.g2Checkpoint
  spindleCheckpointClosed : C.spindleCheckpoint
  dnaDamageCheckpointClosed : C.dnaDamageCheckpoint
  checkpointSignalingClosed : C.checkpointSignaling
  checkpointIntegrityClosed : C.checkpointIntegrity

def CheckpointRegulationClosed {P : CellCyclePhasesPackage}
    (C : CheckpointRegulationPackage P) : Prop :=
  C.g1Checkpoint ∧ C.g2Checkpoint ∧ C.spindleCheckpoint ∧
  C.dnaDamageCheckpoint ∧ C.checkpointSignaling ∧ C.checkpointIntegrity

theorem checkpoint_regulation_closed_from_evidence {P : CellCyclePhasesPackage}
    (C : CheckpointRegulationPackage P) (E : CheckpointRegulationEvidence C) :
    CheckpointRegulationClosed C := by
  exact And.intro E.g1CheckpointClosed
    (And.intro E.g2CheckpointClosed
      (And.intro E.spindleCheckpointClosed
        (And.intro E.dnaDamageCheckpointClosed
          (And.intro E.checkpointSignalingClosed E.checkpointIntegrityClosed))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse
