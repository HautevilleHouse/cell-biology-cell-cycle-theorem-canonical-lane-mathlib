import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure MitoticCheckpointPackage where
  spindleAssemblyCheckpoint : Prop
  chromosomeAlignment : Prop
  anaphasePromotion : Prop
  separaseActivation : Prop
  cytokinesisInitiation : Prop

structure MitoticCheckpointEvidence (M : MitoticCheckpointPackage) where
  spindleAssemblyCheckpointClosed : M.spindleAssemblyCheckpoint
  chromosomeAlignmentClosed : M.chromosomeAlignment
  anaphasePromotionClosed : M.anaphasePromotion
  separaseActivationClosed : M.separaseActivation
  cytokinesisInitiationClosed : M.cytokinesisInitiation

def MitoticCheckpointClosed (M : MitoticCheckpointPackage) : Prop :=
  M.spindleAssemblyCheckpoint ∧ M.chromosomeAlignment ∧
  M.anaphasePromotion ∧ M.separaseActivation ∧ M.cytokinesisInitiation

theorem mitotic_checkpoint_closed_from_evidence (M : MitoticCheckpointPackage)
    (E : MitoticCheckpointEvidence M) : MitoticCheckpointClosed M := by
  exact And.intro E.spindleAssemblyCheckpointClosed
    (And.intro E.chromosomeAlignmentClosed
      (And.intro E.anaphasePromotionClosed
        (And.intro E.separaseActivationClosed E.cytokinesisInitiationClosed)))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse