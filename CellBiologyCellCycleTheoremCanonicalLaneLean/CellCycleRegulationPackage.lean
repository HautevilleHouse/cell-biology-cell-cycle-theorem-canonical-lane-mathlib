import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheorem

structure CellCycleRegulationPackage where
  phaseTransitions : Prop
  cyclinDependentKinases : Prop
  checkpointMechanisms : Prop
  growthFactorSignaling : Prop
  tumorSuppressorPathways : Prop

structure CellCycleRegulationEvidence (C : CellCycleRegulationPackage) where
  phaseTransitionsClosed : C.phaseTransitions
  cyclinDependentKinasesClosed : C.cyclinDependentKinases
  checkpointMechanismsClosed : C.checkpointMechanisms
  growthFactorSignalingClosed : C.growthFactorSignaling
  tumorSuppressorPathwaysClosed : C.tumorSuppressorPathways

def CellCycleRegulationClosed (C : CellCycleRegulationPackage) : Prop :=
  C.phaseTransitions ∧ C.cyclinDependentKinases ∧ C.checkpointMechanisms ∧ C.growthFactorSignaling ∧ C.tumorSuppressorPathways

theorem cell_cycle_regulation_closed_from_evidence (C : CellCycleRegulationPackage) (E : CellCycleRegulationEvidence C) :
    CellCycleRegulationClosed C := by
  exact And.intro E.phaseTransitionsClosed
    (And.intro E.cyclinDependentKinasesClosed
      (And.intro E.checkpointMechanismsClosed
        (And.intro E.growthFactorSignalingClosed E.tumorSuppressorPathwaysClosed)))

end CellBiologyCellCycleTheorem
end HautevilleHouse