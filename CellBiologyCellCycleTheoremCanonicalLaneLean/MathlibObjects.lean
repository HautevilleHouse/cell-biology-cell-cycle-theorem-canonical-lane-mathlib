import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CellCycleSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CellCycleAdmittedObject where
  space : CellCycleSpace
  cellCycleRegulation : Prop
  checkpointControl : Prop
  cyclinModel : Type
  cyclinTopology : TopologicalSpace cyclinModel
  cellCycleCompleted : cellCycleRegulation ∧ checkpointControl → cyclinModel ≃ₜ cyclinModel
  conclusion : cellCycleCompleted

structure CellCycleEndgameState where
  object : CellCycleAdmittedObject

def CellCycleWitnessClosed (O : CellCycleAdmittedObject) : Prop :=
  O.cellCycleCompleted

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse