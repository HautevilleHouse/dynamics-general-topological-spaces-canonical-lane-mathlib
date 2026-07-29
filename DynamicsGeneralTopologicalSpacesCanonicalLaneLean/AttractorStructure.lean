import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure AttractorPackage (X : Type u) [TopologicalSpace X] where
  attractorSet : Set X
  attractionProperty : Prop
  invarianceUnderFlow : Prop
  attractorClosed : attractionProperty ∧ invarianceUnderFlow

structure AttractorEvidence {X : Type u} [TopologicalSpace X] (A : AttractorPackage X) where
  attractionPropertyClosed : A.attractionProperty
  invarianceUnderFlowClosed : A.invarianceUnderFlow

def AttractorClosed {X : Type u} [TopologicalSpace X] (A : AttractorPackage X) : Prop :=
  A.attractionProperty ∧ A.invarianceUnderFlow

theorem attractor_closed_from_evidence {X : Type u} [TopologicalSpace X]
    (A : AttractorPackage X) (E : AttractorEvidence A) : AttractorClosed A := by
  exact And.intro E.attractionPropertyClosed E.invarianceUnderFlowClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse