import HautevilleHouse.CellBiologyCellCycleTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCyclePhase where
  name : String
  duration : ℕ
  cyclinDependence : String

def cellCyclePhases : List CellCyclePhase :=
  [
    { name := "G1", duration := 10, cyclinDependence := "CyclinD" },
    { name := "S", duration := 8, cyclinDependence := "CyclinE" },
    { name := "G2", duration := 4, cyclinDependence := "CyclinA" },
    { name := "M", duration := 2, cyclinDependence := "CyclinB" }
  ]

def totalCellCycleDuration : ℕ :=
  cellCyclePhases.foldl (fun acc p => acc + p.duration) 0

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse