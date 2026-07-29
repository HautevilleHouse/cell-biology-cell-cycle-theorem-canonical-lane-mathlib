import canonicalLaneMathlib.AdmissibleClass
import CellBiologyCellCycleTheoremCanonicalLaneLean.CellCyclePhases
import CellBiologyCellCycleTheoremCanonicalLaneLean.CheckpointRegulation
import CellBiologyCellCycleTheoremCanonicalLaneLean.CyclinCdkDynamics

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellDivisionControlPackage {P : CellCyclePhasesPackage}
    {C : CheckpointRegulationPackage P}
    {D : CyclinCdkDynamicsPackage P C} where
  mitoticEntry : Prop
  mitoticExit : Prop
  chromosomeSegregation : Prop
  cytokinesis : Prop
  asymmetricDivision : Prop
  divisionPlanePositioning : Prop

structure CellDivisionControlEvidence {P : CellCyclePhasesPackage}
    {C : CheckpointRegulationPackage P}
    {D : CyclinCdkDynamicsPackage P C}
    (M : CellDivisionControlPackage P C D) where
  mitoticEntryClosed : M.mitoticEntry
  mitoticExitClosed : M.mitoticExit
  chromosomeSegregationClosed : M.chromosomeSegregation
  cytokinesisClosed : M.cytokinesis
  asymmetricDivisionClosed : M.asymmetricDivision
  divisionPlanePositioningClosed : M.divisionPlanePositioning

def CellDivisionControlClosed {P : CellCyclePhasesPackage}
    {C : CheckpointRegulationPackage P}
    {D : CyclinCdkDynamicsPackage P C}
    (M : CellDivisionControlPackage P C D) : Prop :=
  M.mitoticEntry ∧ M.mitoticExit ∧ M.chromosomeSegregation ∧
  M.cytokinesis ∧ M.asymmetricDivision ∧ M.divisionPlanePositioning

theorem cell_division_control_closed_from_evidence {P : CellCyclePhasesPackage}
    {C : CheckpointRegulationPackage P}
    {D : CyclinCdkDynamicsPackage P C}
    (M : CellDivisionControlPackage P C D)
    (E : CellDivisionControlEvidence M) : CellDivisionControlClosed M := by
  exact And.intro E.mitoticEntryClosed
    (And.intro E.mitoticExitClosed
      (And.intro E.chromosomeSegregationClosed
        (And.intro E.cytokinesisClosed
          (And.intro E.asymmetricDivisionClosed
            E.divisionPlanePositioningClosed))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse
