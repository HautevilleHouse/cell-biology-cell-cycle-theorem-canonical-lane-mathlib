import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CellBiologyCellCycleTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CyclinDynamicsPackage (O : CellCycleAdmittedObject) where
  cyclinSynthesis : Prop
  cyclinDegradation : Prop
  phosphorylationStates : Prop
  activityThresholds : Prop
  dynamicsClosed : cyclinSynthesis ∧ cyclinDegradation ∧ phosphorylationStates ∧ activityThresholds

structure CyclinDynamicsEvidence {O : CellCycleAdmittedObject} (C : CyclinDynamicsPackage O) where
  synthesisClosed : C.cyclinSynthesis
  degradationClosed : C.cyclinDegradation
  phosphorylationClosed : C.phosphorylationStates
  thresholdsClosed : C.activityThresholds

def CyclinDynamicsClosed {O : CellCycleAdmittedObject} (C : CyclinDynamicsPackage O) : Prop :=
  C.dynamicsClosed

theorem cyclin_dynamics_closed_from_evidence {O : CellCycleAdmittedObject} (C : CyclinDynamicsPackage O) (E : CyclinDynamicsEvidence C) : CyclinDynamicsClosed C :=
  E.synthesisClosed ∧ E.degradationClosed ∧ E.phosphorylationClosed ∧ E.thresholdsClosed

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse