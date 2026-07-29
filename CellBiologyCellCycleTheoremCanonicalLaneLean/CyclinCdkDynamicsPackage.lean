import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheorem

structure CyclinCdkDynamicsPackage where
  cyclinSynthesis : Prop
  cyclinDegradation : Prop
  cdkActivation : Prop
  cyclinCdkBinding : Prop
  substratePhosphorylation : Prop

structure CyclinCdkDynamicsEvidence (C : CyclinCdkDynamicsPackage) where
  cyclinSynthesisClosed : C.cyclinSynthesis
  cyclinDegradationClosed : C.cyclinDegradation
  cdkActivationClosed : C.cdkActivation
  cyclinCdkBindingClosed : C.cyclinCdkBinding
  substratePhosphorylationClosed : C.substratePhosphorylation

def CyclinCdkDynamicsClosed (C : CyclinCdkDynamicsPackage) : Prop :=
  C.cyclinSynthesis ∧ C.cyclinDegradation ∧ C.cdkActivation ∧ C.cyclinCdkBinding ∧ C.substratePhosphorylation

theorem cyclin_cdk_dynamics_closed_from_evidence (C : CyclinCdkDynamicsPackage) (E : CyclinCdkDynamicsEvidence C) :
    CyclinCdkDynamicsClosed C := by
  exact And.intro E.cyclinSynthesisClosed
    (And.intro E.cyclinDegradationClosed
      (And.intro E.cdkActivationClosed
        (And.intro E.cyclinCdkBindingClosed E.substratePhosphorylationClosed)))

end CellBiologyCellCycleTheorem
end HautevilleHouse