import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CellBiologyCellCycleTheoremCanonicalLaneLean.CyclinDynamics

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CheckpointControlPackage {O : CellCycleAdmittedObject} (D : CyclinDynamicsPackage O) where
  g1Checkpoint : Prop
  g2Checkpoint : Prop
  mitoticCheckpoint : Prop
  dnaDamageResponse : Prop
  controlClosed : g1Checkpoint ∧ g2Checkpoint ∧ mitoticCheckpoint ∧ dnaDamageResponse

structure CheckpointControlEvidence {O : CellCycleAdmittedObject} {D : CyclinDynamicsPackage O} (C : CheckpointControlPackage D) where
  g1Closed : C.g1Checkpoint
  g2Closed : C.g2Checkpoint
  mitoticClosed : C.mitoticCheckpoint
  dnaDamageClosed : C.dnaDamageResponse

def CheckpointControlClosed {O : CellCycleAdmittedObject} {D : CyclinDynamicsPackage O} (C : CheckpointControlPackage D) : Prop :=
  C.controlClosed

theorem checkpoint_control_closed_from_evidence {O : CellCycleAdmittedObject} {D : CyclinDynamicsPackage O} (C : CheckpointControlPackage D) (E : CheckpointControlEvidence C) : CheckpointControlClosed C :=
  E.g1Closed ∧ E.g2Closed ∧ E.mitoticClosed ∧ E.dnaDamageClosed

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse