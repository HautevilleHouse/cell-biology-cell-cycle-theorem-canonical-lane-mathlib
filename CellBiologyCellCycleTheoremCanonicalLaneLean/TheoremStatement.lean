import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCycleTheorem where
  object : AdmittedObject
  closure : CellCycleClosure ⟨object, True, True, Or.inl True⟩

theorem cell_cycle_theorem_statement (obj : AdmittedObject) :
    CellCycleClosure ⟨obj, True, True, Or.inl True⟩ := by
  exact cell_cycle_endgame ⟨obj, True, True, Or.inl True⟩

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse