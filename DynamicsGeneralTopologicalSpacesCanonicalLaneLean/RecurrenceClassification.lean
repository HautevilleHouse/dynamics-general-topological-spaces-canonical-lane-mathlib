import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure RecurrencePackage (X : Type u) [TopologicalSpace X] where
  recurrentPoints : Set X
  poissonStability : Prop
  minimalSetClassification : Prop
  recurrenceClosed : poissonStability ∧ minimalSetClassification

structure RecurrenceEvidence {X : Type u} [TopologicalSpace X] (R : RecurrencePackage X) where
  poissonStabilityClosed : R.poissonStability
  minimalSetClassificationClosed : R.minimalSetClassification

def RecurrenceClosed {X : Type u} [TopologicalSpace X] (R : RecurrencePackage X) : Prop :=
  R.poissonStability ∧ R.minimalSetClassification

theorem recurrence_closed_from_evidence {X : Type u} [TopologicalSpace X]
    (R : RecurrencePackage X) (E : RecurrenceEvidence R) : RecurrenceClosed R := by
  exact And.intro E.poissonStabilityClosed E.minimalSetClassificationClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse