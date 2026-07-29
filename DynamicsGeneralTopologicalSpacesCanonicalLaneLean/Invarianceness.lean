import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure InvariantSetPackage (X : Type u) [TopologicalSpace X] where
  invariantSet : Set X
  forwardInvariance : Prop
  backwardInvariance : Prop
  invarianceClosed : forwardInvariance ∧ backwardInvariance

structure InvariantSetEvidence {X : Type u} [TopologicalSpace X] (I : InvariantSetPackage X) where
  forwardInvarianceClosed : I.forwardInvariance
  backwardInvarianceClosed : I.backwardInvariance

def InvariantSetClosed {X : Type u} [TopologicalSpace X] (I : InvariantSetPackage X) : Prop :=
  I.forwardInvariance ∧ I.backwardInvariance

theorem invariant_set_closed_from_evidence {X : Type u} [TopologicalSpace X]
    (I : InvariantSetPackage X) (E : InvariantSetEvidence I) : InvariantSetClosed I := by
  exact And.intro E.forwardInvarianceClosed E.backwardInvarianceClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse