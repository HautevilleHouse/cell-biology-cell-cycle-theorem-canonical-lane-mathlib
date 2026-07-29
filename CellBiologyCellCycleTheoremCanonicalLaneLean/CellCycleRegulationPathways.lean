import canonicalLaneMathlib.AdmissibleClass
import CellBiologyCellCycleTheoremCanonicalLaneLean.CellCyclePhases
import CellBiologyCellCycleTheoremCanonicalLaneLean.CheckpointRegulation
import CellBiologyCellCycleTheoremCanonicalLaneLean.CyclinCdkDynamics
import CellBiologyCellCycleTheoremCanonicalLaneLean.CellDivisionControl

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCycleRegulationPathwaysPackage {P : CellCyclePhasesPackage}
    {C : CheckpointRegulationPackage P}
    {D : CyclinCdkDynamicsPackage P C}
    {M : CellDivisionControlPackage P C D} where
  p53Pathway : Prop
  rbPathway : Prop
  mycPathway : Prop
  wntPathway : Prop
  growthFactorSignaling : Prop
  stressResponse : Prop
  dnaRepairCoupling : Prop

structure CellCycleRegulationPathwaysEvidence {P : CellCyclePhasesPackage}
    {C : CheckpointRegulationPackage P}
    {D : CyclinCdkDynamicsPackage P C}
    {M : CellDivisionControlPackage P C D}
    (R : CellCycleRegulationPathwaysPackage P C D M) where
  p53PathwayClosed : R.p53Pathway
  rbPathwayClosed : R.rbPathway
  mycPathwayClosed : R.mycPathway
  wntPathwayClosed : R.wntPathway
  growthFactorSignalingClosed : R.growthFactorSignaling
  stressResponseClosed : R.stressResponse
  dnaRepairCouplingClosed : R.dnaRepairCoupling

def CellCycleRegulationPathwaysClosed {P : CellCyclePhasesPackage}
    {C : CheckpointRegulationPackage P}
    {D : CyclinCdkDynamicsPackage P C}
    {M : CellDivisionControlPackage P C D}
    (R : CellCycleRegulationPathwaysPackage P C D M) : Prop :=
  R.p53Pathway ∧ R.rbPathway ∧ R.mycPathway ∧ R.wntPathway ∧
  R.growthFactorSignaling ∧ R.stressResponse ∧ R.dnaRepairCoupling

theorem cell_cycle_regulation_pathways_closed_from_evidence
    {P : CellCyclePhasesPackage}
    {C : CheckpointRegulationPackage P}
    {D : CyclinCdkDynamicsPackage P C}
    {M : CellDivisionControlPackage P C D}
    (R : CellCycleRegulationPathwaysPackage P C D M)
    (E : CellCycleRegulationPathwaysEvidence R) :
    CellCycleRegulationPathwaysClosed R := by
  exact And.intro E.p53PathwayClosed
    (And.intro E.rbPathwayClosed
      (And.intro E.mycPathwayClosed
        (And.intro E.wntPathwayClosed
          (And.intro E.growthFactorSignalingClosed
            (And.intro E.stressResponseClosed
              E.dnaRepairCouplingClosed)))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse
