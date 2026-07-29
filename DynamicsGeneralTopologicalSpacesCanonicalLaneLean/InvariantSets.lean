import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure InvariantSetsPackage {X : Type} [TopologicalSpace X] (φ : ℕ → X → X) where
  forwardInvariantSet : Set X
  backwardInvariantSet : Set X
  forwardInvariance : ∀ x ∈ forwardInvariantSet, ∀ n : ℕ, φ n x ∈ forwardInvariantSet
  backwardInvariance : ∀ x ∈ backwardInvariantSet, ∀ n : ℕ, φ n x ∈ backwardInvariantSet
  nonemptyForward : forwardInvariantSet.Nonempty
  nonemptyBackward : backwardInvariantSet.Nonempty

structure InvariantSetsEvidence {X : Type} [TopologicalSpace X] {φ : ℕ → X → X} (P : InvariantSetsPackage φ) where
  forwardInvarianceClosed : P.forwardInvariance
  backwardInvarianceClosed : P.backwardInvariance
  nonemptyForwardClosed : P.nonemptyForward
  nonemptyBackwardClosed : P.nonemptyBackward

def InvariantSetsClosed {X : Type} [TopologicalSpace X] {φ : ℕ → X → X} (P : InvariantSetsPackage φ) : Prop :=
  P.forwardInvariance ∧ P.backwardInvariance ∧ P.nonemptyForward ∧ P.nonemptyBackward

theorem invariant_sets_closed_from_evidence
    {X : Type} [TopologicalSpace X] {φ : ℕ → X → X} (P : InvariantSetsPackage φ) (E : InvariantSetsEvidence P) : InvariantSetsClosed P := by
  exact And.intro E.forwardInvarianceClosed (And.intro E.backwardInvarianceClosed (And.intro E.nonemptyForwardClosed E.nonemptyBackwardClosed))

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse