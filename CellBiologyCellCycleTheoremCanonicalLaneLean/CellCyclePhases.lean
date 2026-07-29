import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCyclePhasesPackage where
  g1Phase : Prop
  sPhase : Prop
  g2Phase : Prop
  mPhase : Prop
  phaseOrdering : Prop
  phaseTransitions : Prop

structure CellCyclePhasesEvidence (P : CellCyclePhasesPackage) where
  g1PhaseClosed : P.g1Phase
  sPhaseClosed : P.sPhase
  g2PhaseClosed : P.g2Phase
  mPhaseClosed : P.mPhase
  phaseOrderingClosed : P.phaseOrdering
  phaseTransitionsClosed : P.phaseTransitions

def CellCyclePhasesClosed (P : CellCyclePhasesPackage) : Prop :=
  P.g1Phase ∧ P.sPhase ∧ P.g2Phase ∧ P.mPhase ∧ P.phaseOrdering ∧ P.phaseTransitions

theorem cell_cycle_phases_closed_from_evidence (P : CellCyclePhasesPackage)
    (E : CellCyclePhasesEvidence P) : CellCyclePhasesClosed P := by
  exact And.intro E.g1PhaseClosed
    (And.intro E.sPhaseClosed
      (And.intro E.g2PhaseClosed
        (And.intro E.mPhaseClosed
          (And.intro E.phaseOrderingClosed E.phaseTransitionsClosed))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse
