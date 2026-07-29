import canonicalLaneMathlib.AdmissibleClass
import CellBiologyCellCycleTheoremCanonicalLaneLean.CellCyclePhases
import CellBiologyCellCycleTheoremCanonicalLaneLean.CheckpointRegulation

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CyclinCdkDynamicsPackage {P : CellCyclePhasesPackage}
    {C : CheckpointRegulationPackage P} where
  cyclinDExpression : Prop
  cyclinEExpression : Prop
  cyclinAExpression : Prop
  cyclinBExpression : Prop
  cdkActivation : Prop
  cyclinCdkComplexFormation : Prop
  degradationTiming : Prop

structure CyclinCdkDynamicsEvidence {P : CellCyclePhasesPackage}
    {C : CheckpointRegulationPackage P}
    (D : CyclinCdkDynamicsPackage P C) where
  cyclinDExpressionClosed : D.cyclinDExpression
  cyclinEExpressionClosed : D.cyclinEExpression
  cyclinAExpressionClosed : D.cyclinAExpression
  cyclinBExpressionClosed : D.cyclinBExpression
  cdkActivationClosed : D.cdkActivation
  cyclinCdkComplexFormationClosed : D.cyclinCdkComplexFormation
  degradationTimingClosed : D.degradationTiming

def CyclinCdkDynamicsClosed {P : CellCyclePhasesPackage}
    {C : CheckpointRegulationPackage P}
    (D : CyclinCdkDynamicsPackage P C) : Prop :=
  D.cyclinDExpression ∧ D.cyclinEExpression ∧ D.cyclinAExpression ∧
  D.cyclinBExpression ∧ D.cdkActivation ∧ D.cyclinCdkComplexFormation ∧
  D.degradationTiming

theorem cyclin_cdk_dynamics_closed_from_evidence {P : CellCyclePhasesPackage}
    {C : CheckpointRegulationPackage P} (D : CyclinCdkDynamicsPackage P C)
    (E : CyclinCdkDynamicsEvidence D) : CyclinCdkDynamicsClosed D := by
  exact And.intro E.cyclinDExpressionClosed
    (And.intro E.cyclinEExpressionClosed
      (And.intro E.cyclinAExpressionClosed
        (And.intro E.cyclinBExpressionClosed
          (And.intro E.cdkActivationClosed
            (And.intro E.cyclinCdkComplexFormationClosed
              E.degradationTimingClosed)))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse
