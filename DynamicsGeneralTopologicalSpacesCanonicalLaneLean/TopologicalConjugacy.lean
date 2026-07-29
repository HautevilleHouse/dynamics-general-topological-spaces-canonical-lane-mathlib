import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsGeneralTopologicalSpacesCanonicalLaneLean.TopologicalFlow

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure TopologicalConjugacy (F : TopologicalFlow X) (G : TopologicalFlow Y) where
  homeomorphism : X ≃ₜ Y
  conjugacyCondition : ∀ (t : F.time) (x : X), homeomorphism (F.action t x) = G.action t (homeomorphism x)

structure TopologicalConjugacyEvidence {F G} (C : TopologicalConjugacy F G) where
  homeomorphismClosed : Continuous C.homeomorphism ∧ Continuous C.homeomorphism.symm
  conjugacyConditionClosed : C.conjugacyCondition

def TopologicalConjugacyClosed {F G} (C : TopologicalConjugacy F G) : Prop :=
  (Continuous C.homeomorphism ∧ Continuous C.homeomorphism.symm) ∧ C.conjugacyCondition

theorem topological_conjugacy_closed_from_evidence {F G} (C : TopologicalConjugacy F G) (E : TopologicalConjugacyEvidence C) : TopologicalConjugacyClosed C := by
  exact And.intro E.homeomorphismClosed E.conjugacyConditionClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse
