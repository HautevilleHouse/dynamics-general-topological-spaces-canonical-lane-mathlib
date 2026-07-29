import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DynamicsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse