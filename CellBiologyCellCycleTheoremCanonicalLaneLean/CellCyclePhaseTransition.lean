import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCyclePhaseTransitionPackage where
  g1PhaseEntry : Prop
  sPhaseEntry : Prop
  g2PhaseEntry : Prop
  mitosisEntry : Prop
  cytokinesis : Prop
  phaseTransitionRegulation : Prop

structure CellCyclePhaseTransitionEvidence (C : CellCyclePhaseTransitionPackage) where
  g1PhaseEntryClosed : C.g1PhaseEntry
  sPhaseEntryClosed : C.sPhaseEntry
  g2PhaseEntryClosed : C.g2PhaseEntry
  mitosisEntryClosed : C.mitosisEntry
  cytokinesisClosed : C.cytokinesis
  phaseTransitionRegulationClosed : C.phaseTransitionRegulation

def CellCyclePhaseTransitionClosed (C : CellCyclePhaseTransitionPackage) : Prop :=
  C.g1PhaseEntry ∧ C.sPhaseEntry ∧ C.g2PhaseEntry ∧
  C.mitosisEntry ∧ C.cytokinesis ∧ C.phaseTransitionRegulation

theorem cell_cycle_phase_transition_closed_from_evidence
    (C : CellCyclePhaseTransitionPackage) (E : CellCyclePhaseTransitionEvidence C) :
    CellCyclePhaseTransitionClosed C := by
  exact And.intro E.g1PhaseEntryClosed
    (And.intro E.sPhaseEntryClosed
      (And.intro E.g2PhaseEntryClosed
        (And.intro E.mitosisEntryClosed
          (And.intro E.cytokinesisClosed E.phaseTransitionRegulationClosed))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse
