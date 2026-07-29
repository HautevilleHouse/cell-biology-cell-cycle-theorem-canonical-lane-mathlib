import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheorem

structure OncogeneTumorSuppressorPackage where
  rasSignaling : Prop
  mycTranscription : Prop
  p53Regulation : Prop
  rbPathway : Prop
  apoptosisLink : Prop

structure OncogeneTumorSuppressorEvidence (O : OncogeneTumorSuppressorPackage) where
  rasSignalingClosed : O.rasSignaling
  mycTranscriptionClosed : O.mycTranscription
  p53RegulationClosed : O.p53Regulation
  rbPathwayClosed : O.rbPathway
  apoptosisLinkClosed : O.apoptosisLink

def OncogeneTumorSuppressorClosed (O : OncogeneTumorSuppressorPackage) : Prop :=
  O.rasSignaling ∧ O.mycTranscription ∧ O.p53Regulation ∧ O.rbPathway ∧ O.apoptosisLink

theorem oncogene_tumor_suppressor_closed_from_evidence (O : OncogeneTumorSuppressorPackage) (E : OncogeneTumorSuppressorEvidence O) :
    OncogeneTumorSuppressorClosed O := by
  exact And.intro E.rasSignalingClosed
    (And.intro E.mycTranscriptionClosed
      (And.intro E.p53RegulationClosed
        (And.intro E.rbPathwayClosed E.apoptosisLinkClosed)))

end CellBiologyCellCycleTheorem
end HautevilleHouse