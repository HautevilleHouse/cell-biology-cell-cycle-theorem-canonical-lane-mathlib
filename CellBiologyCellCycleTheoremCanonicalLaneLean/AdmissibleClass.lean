import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure CellCycleObject where
  cellType : Type
  cyclePhase : Prop
  checkpointSatisfied : Prop
  dnaIntegrityConfirmed : Prop
  divisionCompetent : Prop
  cellCycleClosed : Prop
  divisionCompetentTerm : divisionCompetent
  checkpointSatisfiedTerm : checkpointSatisfied

structure AdmittedObject where
  object : CellCycleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

structure AdmissibleClass where
  object : AdmittedObject
  cycleEvidence : Prop
  cycleEvidenceTerm : cycleEvidence

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.cycleEvidence ∧ (A.object.endpointSatisfied ∨ A.object.remainderRecorded)

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse