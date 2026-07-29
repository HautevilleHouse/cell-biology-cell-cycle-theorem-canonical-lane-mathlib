import canonicalLaneMathlib.AdmissibleClass
import CellBiologyCellCycleTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CellBiologyCellCycleTheoremCanonicalLaneLean

structure DNAReplicationPackage where
  originLicensing : Prop
  preRCFormation : Prop
  helicaseActivation : Prop
  replicationFork : Prop
  okazakiFragments : Prop
  replicationCheckpoint : Prop

structure DNAReplicationEvidence (D : DNAReplicationPackage) where
  originLicensingClosed : D.originLicensing
  preRCFormationClosed : D.preRCFormation
  helicaseActivationClosed : D.helicaseActivation
  replicationForkClosed : D.replicationFork
  okazakiFragmentsClosed : D.okazakiFragments
  replicationCheckpointClosed : D.replicationCheckpoint

def DNAReplicationClosed (D : DNAReplicationPackage) : Prop :=
  D.originLicensing ∧ D.preRCFormation ∧ D.helicaseActivation ∧ D.replicationFork ∧ D.okazakiFragments ∧ D.replicationCheckpoint

theorem dna_replication_closed_from_evidence (D : DNAReplicationPackage) (E : DNAReplicationEvidence D) :
    DNAReplicationClosed D := by
  exact And.intro E.originLicensingClosed
    (And.intro E.preRCFormationClosed
      (And.intro E.helicaseActivationClosed
        (And.intro E.replicationForkClosed
          (And.intro E.okazakiFragmentsClosed E.replicationCheckpointClosed))))

end CellBiologyCellCycleTheoremCanonicalLaneLean
end HautevilleHouse