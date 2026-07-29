import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure ShadowingPackage (T : TopologicalDynamicalSystem) where
  shadowingProperty : Prop
  structuralStability : Prop

structure ShadowingEvidence (T : TopologicalDynamicalSystem) (S : ShadowingPackage T) where
  shadowingPropertyClosed : S.shadowingProperty
  structuralStabilityClosed : S.structuralStability

def ShadowingClosed (T : TopologicalDynamicalSystem) (S : ShadowingPackage T) : Prop :=
  S.shadowingProperty ∧ S.structuralStability

theorem shadowing_closed_from_evidence (T : TopologicalDynamicalSystem) (S : ShadowingPackage T) (E : ShadowingEvidence T S) :
    ShadowingClosed T S := by
  exact And.intro E.shadowingPropertyClosed E.structuralStabilityClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse