import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure MixingPackage {X : Type} [TopologicalSpace X] (φ : ℕ → X → X) where
  topologicalMixing : ∀ (U : Set X) (V : Set X), IsOpen U → IsOpen V → U.Nonempty → V.Nonempty → ∃ N : ℕ, ∀ n ≥ N, (φ n '' U) ∩ V ≠ ∅
  weakMixing : ∀ (U : Set X) (V : Set X), IsOpen U → IsOpen V → U.Nonempty → V.Nonempty → ∃ n : ℕ, (φ n '' U) ∩ U ≠ ∅ ∧ (φ n '' U) ∩ V ≠ ∅

structure MixingEvidence {X : Type} [TopologicalSpace X] {φ : ℕ → X → X} (P : MixingPackage φ) where
  topologicalMixingClosed : P.topologicalMixing
  weakMixingClosed : P.weakMixing

def MixingClosed {X : Type} [TopologicalSpace X] {φ : ℕ → X → X} (P : MixingPackage φ) : Prop :=
  P.topologicalMixing ∧ P.weakMixing

theorem mixing_closed_from_evidence
    {X : Type} [TopologicalSpace X] {φ : ℕ → X → X} (P : MixingPackage φ) (E : MixingEvidence P) : MixingClosed P := by
  exact And.intro E.topologicalMixingClosed E.weakMixingClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse