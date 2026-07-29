import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure InvariantMeasurePackage (T : TopologicalDynamicalSystem) where
  invariantMeasures : Set (Measure T.space)
  ergodicDecomposition : Prop
  classificationBySupport : Prop

structure InvariantMeasureEvidence (T : TopologicalDynamicalSystem) (I : InvariantMeasurePackage T) where
  ergodicDecompositionClosed : I.ergodicDecomposition
  classificationBySupportClosed : I.classificationBySupport

def InvariantMeasureClosed (T : TopologicalDynamicalSystem) (I : InvariantMeasurePackage T) : Prop :=
  I.ergodicDecomposition ∧ I.classificationBySupport

theorem invariant_measure_closed_from_evidence (T : TopologicalDynamicalSystem) (I : InvariantMeasurePackage T) (E : InvariantMeasureEvidence T I) :
    InvariantMeasureClosed T I := by
  exact And.intro E.ergodicDecompositionClosed E.classificationBySupportClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse