import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CellBiologyCellCycleTheoremCanonicalLaneLean.CellCycleCheckpointControl
import HautevilleHouse.CellBiologyCellCycleTheoremCanonicalLaneLean.CyclinCdkDynamics
import HautevilleHouse.CellBiologyCellCycleTheoremCanonicalLaneLean.CellCyclePhaseTransition
import HautevilleHouse.CellBiologyCellCycleTheoremCanonicalLaneLean.CellCycleRegulationNetwork

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCycleAdmittedObject where
  cellType : Type
  cellCycleState : Prop
  checkpointControl : CellCycleCheckpointControlPackage
  cyclinCdkDynamics : CyclinCdkDynamicsPackage
  phaseTransition : CellCyclePhaseTransitionPackage
  regulationNetwork : CellCycleRegulationNetworkPackage
  cellCycleCompleted : Prop
  checkpointControlEvidence : CellCycleCheckpointControlEvidence checkpointControl
  cyclinCdkDynamicsEvidence : CyclinCdkDynamicsEvidence cyclinCdkDynamics
  phaseTransitionEvidence : CellCyclePhaseTransitionEvidence phaseTransition
  regulationNetworkEvidence : CellCycleRegulationNetworkEvidence regulationNetwork
  cellCycleCompletedTerm : cellCycleCompleted

def CellCycleWitnessClosed (O : CellCycleAdmittedObject) : Prop :=
  CellCycleCheckpointControlClosed O.checkpointControl ∧
  CyclinCdkDynamicsClosed O.cyclinCdkDynamics ∧
  CellCyclePhaseTransitionClosed O.phaseTransition ∧
  CellCycleRegulationNetworkClosed O.regulationNetwork

structure AdmissibleClass where
  object : CellCycleAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CellCycleWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  have hCheckpoint : CellCycleCheckpointControlClosed A.object.checkpointControl :=
    cell_cycle_checkpoint_control_closed_from_evidence _ A.object.checkpointControlEvidence
  have hCyclin : CyclinCdkDynamicsClosed A.object.cyclinCdkDynamics :=
    cyclin_cdk_dynamics_closed_from_evidence _ A.object.cyclinCdkDynamicsEvidence
  have hPhase : CellCyclePhaseTransitionClosed A.object.phaseTransition :=
    cell_cycle_phase_transition_closed_from_evidence _ A.object.phaseTransitionEvidence
  have hReg : CellCycleRegulationNetworkClosed A.object.regulationNetwork :=
    cell_cycle_regulation_network_closed_from_evidence _ A.object.regulationNetworkEvidence
  exact And.intro hCheckpoint (And.intro hCyclin (And.intro hPhase hReg))

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedCellCycleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_cell_cycle_endgame (A : AdmissibleClass) :
    ConstrainedCellCycleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse
