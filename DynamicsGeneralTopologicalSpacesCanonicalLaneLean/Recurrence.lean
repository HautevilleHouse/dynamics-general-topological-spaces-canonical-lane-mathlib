import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicsGeneralTopologicalSpacesCanonicalLaneLean.TopologicalFlow

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure Recurrence (F : TopologicalFlow X) where
  recurrentPoint : X
  netDirection : Set F.time
  recurrenceCondition : ∀ (U : Set X), IsOpen U → recurrentPoint ∈ U → ∃ (t : F.time), t ∈ netDirection ∧ t ≠ 0 ∧ F.action t recurrentPoint ∈ U

structure RecurrenceEvidence (R : Recurrence F) where
  recurrentPointClosed : True
  netDirectionClosed : True
  recurrenceConditionClosed : R.recurrenceCondition

def RecurrenceClosed (R : Recurrence F) : Prop :=
  R.recurrenceCondition

theorem recurrence_closed_from_evidence (R : Recurrence F) (E : RecurrenceEvidence R) : RecurrenceClosed R := by
  exact E.recurrenceConditionClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse
