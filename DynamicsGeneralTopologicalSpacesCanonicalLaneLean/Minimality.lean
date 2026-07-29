import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsGeneralTopologicalSpacesCanonicalLaneLean.TopologicalFlow

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure Minimality (F : TopologicalFlow X) where
  minimal : ∀ (x : X), closure (Set.range (λ (t : F.time) => F.action t x)) = Set.univ

structure MinimalityEvidence (M : Minimality F) where
  minimalClosed : M.minimal

def MinimalityClosed (M : Minimality F) : Prop :=
  M.minimal

theorem minimality_closed_from_evidence (M : Minimality F) (E : MinimalityEvidence M) : MinimalityClosed M := by
  exact E.minimalClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse
