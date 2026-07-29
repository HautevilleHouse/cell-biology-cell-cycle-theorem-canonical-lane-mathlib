import canonicalLaneMathlib.AdmissibleClass
import CellBiologyCellCycleTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure MitosisPackage where
  prophase : Prop
  prometaphase : Prop
  metaphase : Prop
  anaphase : Prop
  telophase : Prop
  cytokinesis : Prop
  spindleAssemblyCheckpoint : Prop

structure MitosisEvidence (M : MitosisPackage) where
  prophaseClosed : M.prophase
  prometaphaseClosed : M.prometaphase
  metaphaseClosed : M.metaphase
  anaphaseClosed : M.anaphase
  telophaseClosed : M.telophase
  cytokinesisClosed : M.cytokinesis
  spindleAssemblyCheckpointClosed : M.spindleAssemblyCheckpoint

def MitosisClosed (M : MitosisPackage) : Prop :=
  M.prophase ∧ M.prometaphase ∧ M.metaphase ∧ M.anaphase ∧ M.telophase ∧ M.cytokinesis ∧ M.spindleAssemblyCheckpoint

theorem mitosis_closed_from_evidence (M : MitosisPackage) (E : MitosisEvidence M) :
    MitosisClosed M := by
  exact And.intro E.prophaseClosed
    (And.intro E.prometaphaseClosed
      (And.intro E.metaphaseClosed
        (And.intro E.anaphaseClosed
          (And.intro E.telophaseClosed
            (And.intro E.cytokinesisClosed E.spindleAssemblyCheckpointClosed)))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse