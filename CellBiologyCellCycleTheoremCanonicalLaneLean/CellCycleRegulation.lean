import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CellBiologyCellCycleTheoremCanonicalLaneLean.CheckpointControl

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCycleRegulationPackage {O : CellCycleAdmittedObject} {D : CyclinDynamicsPackage O} {C : CheckpointControlPackage D} where
  growthSignals : Prop
  nutrientSensing : Prop
  dnaIntegrity : Prop
  regulationClosed : growthSignals ∧ nutrientSensing ∧ dnaIntegrity

structure CellCycleRegulationEvidence {O : CellCycleAdmittedObject} {D : CyclinDynamicsPackage O} {C : CheckpointControlPackage D} (R : CellCycleRegulationPackage C) where
  growthClosed : R.growthSignals
  nutrientClosed : R.nutrientSensing
  dnaIntegrityClosed : R.dnaIntegrity

def CellCycleRegulationClosed {O : CellCycleAdmittedObject} {D : CyclinDynamicsPackage O} {C : CheckpointControlPackage D} (R : CellCycleRegulationPackage C) : Prop :=
  R.regulationClosed

theorem cell_cycle_regulation_closed_from_evidence {O : CellCycleAdmittedObject} {D : CyclinDynamicsPackage O} {C : CheckpointControlPackage D} (R : CellCycleRegulationPackage C) (E : CellCycleRegulationEvidence R) : CellCycleRegulationClosed R :=
  E.growthClosed ∧ E.nutrientClosed ∧ E.dnaIntegrityClosed

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse