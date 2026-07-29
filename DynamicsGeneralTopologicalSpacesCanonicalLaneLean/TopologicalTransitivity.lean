import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure TopologicalTransitivityPackage {X : Type} [TopologicalSpace X] (φ : ℕ → X → X) where
  denseOrbitPoint : X
  denseOrbit : Dense (Set.range (λ (n : ℕ) => φ n denseOrbitPoint))
  topologicalTransitivity : ∀ (U : Set X) (V : Set X), IsOpen U → IsOpen V → U.Nonempty → V.Nonempty → ∃ n : ℕ, (φ n '' U) ∩ V ≠ ∅

structure TopologicalTransitivityEvidence {X : Type} [TopologicalSpace X] {φ : ℕ → X → X} (P : TopologicalTransitivityPackage φ) where
  denseOrbitClosed : P.denseOrbit
  topologicalTransitivityClosed : P.topologicalTransitivity

def TopologicalTransitivityClosed {X : Type} [TopologicalSpace X] {φ : ℕ → X → X} (P : TopologicalTransitivityPackage φ) : Prop :=
  P.denseOrbit ∧ P.topologicalTransitivity

theorem topological_transitivity_closed_from_evidence
    {X : Type} [TopologicalSpace X] {φ : ℕ → X → X} (P : TopologicalTransitivityPackage φ) (E : TopologicalTransitivityEvidence P) : TopologicalTransitivityClosed P := by
  exact And.intro E.denseOrbitClosed E.topologicalTransitivityClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse