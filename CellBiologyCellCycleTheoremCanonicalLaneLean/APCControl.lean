import CellBiologyCellCycleTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure APCControlPackage where
  apc_cdc20_active : Prop
  securin_degraded : Prop
  separase_active : Prop
  cohesin_cleaved : Prop
  cyclinB_degraded : Prop
  anaphase_initiated : Prop
  mitotic_exit : Prop

structure APCControlEvidence (A : APCControlPackage) where
  apc_cdc20_activeClosed : A.apc_cdc20_active
  securin_degradedClosed : A.securin_degraded
  separase_activeClosed : A.separase_active
  cohesin_cleavedClosed : A.cohesin_cleaved
  cyclinB_degradedClosed : A.cyclinB_degraded
  anaphase_initiatedClosed : A.anaphase_initiated
  mitotic_exitClosed : A.mitotic_exit

def APCControlClosed (A : APCControlPackage) : Prop :=
  A.apc_cdc20_active ∧ A.securin_degraded ∧ A.separase_active ∧
  A.cohesin_cleaved ∧ A.cyclinB_degraded ∧
  A.anaphase_initiated ∧ A.mitotic_exit

theorem apc_control_closed_from_evidence
    (A : APCControlPackage) (E : APCControlEvidence A) :
    APCControlClosed A := by
  exact And.intro E.apc_cdc20_activeClosed
    (And.intro E.securin_degradedClosed
      (And.intro E.separase_activeClosed
        (And.intro E.cohesin_cleavedClosed
          (And.intro E.cyclinB_degradedClosed
            (And.intro E.anaphase_initiatedClosed E.mitotic_exitClosed)))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse