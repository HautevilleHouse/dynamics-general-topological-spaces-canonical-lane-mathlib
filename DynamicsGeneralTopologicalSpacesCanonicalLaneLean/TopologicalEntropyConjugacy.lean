import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure TopologicalEntropyPackage (T : TopologicalDynamicalSystem) where
  entropyDefined : Prop
  entropyInvariant : Prop
  entropyClassifies : Prop

structure TopologicalEntropyEvidence (T : TopologicalDynamicalSystem) (E : TopologicalEntropyPackage T) where
  entropyDefinedClosed : E.entropyDefined
  entropyInvariantClosed : E.entropyInvariant
  entropyClassifiesClosed : E.entropyClassifies

def TopologicalEntropyClosed (T : TopologicalDynamicalSystem) (E : TopologicalEntropyPackage T) : Prop :=
  E.entropyDefined ∧ E.entropyInvariant ∧ E.entropyClassifies

theorem topological_entropy_closed_from_evidence (T : TopologicalDynamicalSystem) (E : TopologicalEntropyPackage T) (Ev : TopologicalEntropyEvidence T E) :
    TopologicalEntropyClosed T E := by
  exact And.intro Ev.entropyDefinedClosed (And.intro Ev.entropyInvariantClosed Ev.entropyClassifiesClosed)

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse