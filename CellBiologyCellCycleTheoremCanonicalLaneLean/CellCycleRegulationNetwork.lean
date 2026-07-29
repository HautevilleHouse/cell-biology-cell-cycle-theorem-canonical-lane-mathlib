import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCycleRegulationNetworkPackage where
  transcriptionFactorControl : Prop
  growthFactorSignaling : Prop
  tumorSuppressorRegulation : Prop
  oncogeneActivation : Prop
  epigeneticModifications : Prop
  metabolicCheckpoints : Prop

structure CellCycleRegulationNetworkEvidence (C : CellCycleRegulationNetworkPackage) where
  transcriptionFactorControlClosed : C.transcriptionFactorControl
  growthFactorSignalingClosed : C.growthFactorSignaling
  tumorSuppressorRegulationClosed : C.tumorSuppressorRegulation
  oncogeneActivationClosed : C.oncogeneActivation
  epigeneticModificationsClosed : C.epigeneticModifications
  metabolicCheckpointsClosed : C.metabolicCheckpoints

def CellCycleRegulationNetworkClosed (C : CellCycleRegulationNetworkPackage) : Prop :=
  C.transcriptionFactorControl ∧ C.growthFactorSignaling ∧
  C.tumorSuppressorRegulation ∧ C.oncogeneActivation ∧
  C.epigeneticModifications ∧ C.metabolicCheckpoints

theorem cell_cycle_regulation_network_closed_from_evidence
    (C : CellCycleRegulationNetworkPackage) (E : CellCycleRegulationNetworkEvidence C) :
    CellCycleRegulationNetworkClosed C := by
  exact And.intro E.transcriptionFactorControlClosed
    (And.intro E.growthFactorSignalingClosed
      (And.intro E.tumorSuppressorRegulationClosed
        (And.intro E.oncogeneActivationClosed
          (And.intro E.epigeneticModificationsClosed E.metabolicCheckpointsClosed))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse
