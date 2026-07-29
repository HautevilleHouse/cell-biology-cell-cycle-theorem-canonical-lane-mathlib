import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CyclinCdkRegulationPackage where
  cyclinDExpression : Prop
  cyclinEExpression : Prop
  cyclinAExpression : Prop
  cyclinBExpression : Prop
  cdkActivation : Prop
  cdkInhibitionByP21 : Prop
  cdkInhibitionByP27 : Prop

structure CyclinCdkRegulationEvidence (C : CyclinCdkRegulationPackage) where
  cyclinDExpressionClosed : C.cyclinDExpression
  cyclinEExpressionClosed : C.cyclinEExpression
  cyclinAExpressionClosed : C.cyclinAExpression
  cyclinBExpressionClosed : C.cyclinBExpression
  cdkActivationClosed : C.cdkActivation
  cdkInhibitionByP21Closed : C.cdkInhibitionByP21
  cdkInhibitionByP27Closed : C.cdkInhibitionByP27

def CyclinCdkRegulationClosed (C : CyclinCdkRegulationPackage) : Prop :=
  C.cyclinDExpression ∧ C.cyclinEExpression ∧ C.cyclinAExpression ∧
  C.cyclinBExpression ∧ C.cdkActivation ∧ C.cdkInhibitionByP21 ∧ C.cdkInhibitionByP27

theorem cyclin_cdk_regulation_closed_from_evidence (C : CyclinCdkRegulationPackage)
    (E : CyclinCdkRegulationEvidence C) : CyclinCdkRegulationClosed C := by
  exact And.intro E.cyclinDExpressionClosed
    (And.intro E.cyclinEExpressionClosed
      (And.intro E.cyclinAExpressionClosed
        (And.intro E.cyclinBExpressionClosed
          (And.intro E.cdkActivationClosed
            (And.intro E.cdkInhibitionByP21Closed E.cdkInhibitionByP27Closed)))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse