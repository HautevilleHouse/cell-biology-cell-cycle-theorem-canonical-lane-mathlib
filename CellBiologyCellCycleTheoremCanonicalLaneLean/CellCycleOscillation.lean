import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCycleOscillationPackage where
  cyclinSynthesis : Prop
  cdkActivation : Prop
  phosphorylationCycles : Prop
  feedbackLoops : Prop
  bistableSwitch : Prop
  periodicity : Prop

structure CellCycleOscillationEvidence (O : CellCycleOscillationPackage) where
  cyclinSynthesisClosed : O.cyclinSynthesis
  cdkActivationClosed : O.cdkActivation
  phosphorylationCyclesClosed : O.phosphorylationCycles
  feedbackLoopsClosed : O.feedbackLoops
  bistableSwitchClosed : O.bistableSwitch
  periodicityClosed : O.periodicity

def CellCycleOscillationClosed (O : CellCycleOscillationPackage) : Prop :=
  O.cyclinSynthesis ∧ O.cdkActivation ∧ O.phosphorylationCycles ∧
  O.feedbackLoops ∧ O.bistableSwitch ∧ O.periodicity

theorem cell_cycle_oscillation_closed_from_evidence
    (O : CellCycleOscillationPackage)
    (E : CellCycleOscillationEvidence O) : CellCycleOscillationClosed O := by
  exact And.intro E.cyclinSynthesisClosed
    (And.intro E.cdkActivationClosed
      (And.intro E.phosphorylationCyclesClosed
        (And.intro E.feedbackLoopsClosed
          (And.intro E.bistableSwitchClosed E.periodicityClosed))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse