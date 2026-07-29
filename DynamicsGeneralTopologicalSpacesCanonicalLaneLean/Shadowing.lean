import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsGeneralTopologicalSpacesCanonicalLaneLean.TopologicalFlow

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure ShadowingProperty (F : TopologicalFlow X) where
  delta : ℝ
  epsilon : ℝ
  positiveDelta : delta > 0
  positiveEpsilon : epsilon > 0
  shadowingCondition : ∀ (seq : ℕ → X), (∀ (n : ℕ), dist (F.action 1 (seq n)) (seq (n+1)) < delta) → ∃ (x : X), ∀ (n : ℕ), dist (F.action n x) (seq n) < epsilon

structure ShadowingEvidence (S : ShadowingProperty F) where
  positiveDeltaClosed : S.positiveDelta
  positiveEpsilonClosed : S.positiveEpsilon
  shadowingConditionClosed : S.shadowingCondition

def ShadowingClosed (S : ShadowingProperty F) : Prop :=
  S.positiveDelta ∧ S.positiveEpsilon ∧ S.shadowingCondition

theorem shadowing_closed_from_evidence (S : ShadowingProperty F) (E : ShadowingEvidence S) : ShadowingClosed S := by
  exact And.intro E.positiveDeltaClosed (And.intro E.positiveEpsilonClosed E.shadowingConditionClosed)

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse
