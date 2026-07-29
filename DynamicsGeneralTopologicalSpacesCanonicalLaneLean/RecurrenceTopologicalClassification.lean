import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure RecurrenceClassificationPackage (T : TopologicalDynamicalSystem) where
  transitivePoints : Set T.space
  minimalSubsets : Set (Set T.space)
  chainRecurrentSet : Set T.space
  classificationScheme : Prop

structure RecurrenceClassificationEvidence (T : TopologicalDynamicalSystem) (R : RecurrenceClassificationPackage T) where
  transitivePointsClosed : T.topology.IsOpen R.transitivePoints? -- placeholder
  minimalSubsetsClosed : ∀ s ∈ R.minimalSubsets, T.topology.IsClosed s
  chainRecurrentSetClosed : T.topology.IsClosed R.chainRecurrentSet
  classificationSchemeClosed : R.classificationScheme

def RecurrenceClassificationClosed (T : TopologicalDynamicalSystem) (R : RecurrenceClassificationPackage T) : Prop :=
  R.classificationScheme

theorem recurrence_classification_closed_from_evidence (T : TopologicalDynamicalSystem) (R : RecurrenceClassificationPackage T) (E : RecurrenceClassificationEvidence T R) :
    RecurrenceClassificationClosed T R := by
  exact E.classificationSchemeClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse