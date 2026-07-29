import canonicalLaneMathlib.AdmissibleClass
import CellBiologyCellCycleTheoremCanonicalLaneLean.BridgeLemmas
import CellBiologyCellCycleTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

def ConstrainedCellCycleClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_cell_cycle_endgame (A : AdmissibleClass) :
    ConstrainedCellCycleClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse
