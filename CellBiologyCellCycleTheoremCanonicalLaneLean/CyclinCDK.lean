import canonicalLaneMathlib.AdmissibleClass
import CellBiologyCellCycleTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CyclinCDKPackage where
  cyclinD_Cdk4_6 : Prop
  cyclinE_Cdk2 : Prop
  cyclinA_Cdk2 : Prop
  cyclinB_Cdk1 : Prop
  p21_p27_regulation : Prop

structure CyclinCDKEvidence (C : CyclinCDKPackage) where
  cyclinD_Cdk4_6Closed : C.cyclinD_Cdk4_6
  cyclinE_Cdk2Closed : C.cyclinE_Cdk2
  cyclinA_Cdk2Closed : C.cyclinA_Cdk2
  cyclinB_Cdk1Closed : C.cyclinB_Cdk1
  p21_p27_regulationClosed : C.p21_p27_regulation

def CyclinCDKClosed (C : CyclinCDKPackage) : Prop :=
  C.cyclinD_Cdk4_6 ∧ C.cyclinE_Cdk2 ∧ C.cyclinA_Cdk2 ∧ C.cyclinB_Cdk1 ∧ C.p21_p27_regulation

theorem cyclin_cdk_closed_from_evidence (C : CyclinCDKPackage) (E : CyclinCDKEvidence C) :
    CyclinCDKClosed C := by
  exact And.intro E.cyclinD_Cdk4_6Closed
    (And.intro E.cyclinE_Cdk2Closed
      (And.intro E.cyclinA_Cdk2Closed
        (And.intro E.cyclinB_Cdk1Closed E.p21_p27_regulationClosed)))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse