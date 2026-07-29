import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure DNACellCycleCheckpointPackage where
  g1Checkpoint : Prop
  g2Checkpoint : Prop
  dnaDamageSensors : Prop
  p53Activation : Prop
  cellCycleArrest : Prop
  repairRecruitment : Prop

structure DNACellCycleCheckpointEvidence (D : DNACellCycleCheckpointPackage) where
  g1CheckpointClosed : D.g1Checkpoint
  g2CheckpointClosed : D.g2Checkpoint
  dnaDamageSensorsClosed : D.dnaDamageSensors
  p53ActivationClosed : D.p53Activation
  cellCycleArrestClosed : D.cellCycleArrest
  repairRecruitmentClosed : D.repairRecruitment

def DNACellCycleCheckpointClosed (D : DNACellCycleCheckpointPackage) : Prop :=
  D.g1Checkpoint ∧ D.g2Checkpoint ∧ D.dnaDamageSensors ∧
  D.p53Activation ∧ D.cellCycleArrest ∧ D.repairRecruitment

theorem dna_cell_cycle_checkpoint_closed_from_evidence
    (D : DNACellCycleCheckpointPackage)
    (E : DNACellCycleCheckpointEvidence D) : DNACellCycleCheckpointClosed D := by
  exact And.intro E.g1CheckpointClosed
    (And.intro E.g2CheckpointClosed
      (And.intro E.dnaDamageSensorsClosed
        (And.intro E.p53ActivationClosed
          (And.intro E.cellCycleArrestClosed E.repairRecruitmentClosed))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse