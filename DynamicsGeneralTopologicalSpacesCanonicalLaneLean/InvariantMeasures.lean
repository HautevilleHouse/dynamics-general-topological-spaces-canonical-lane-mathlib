import canonicalLaneMathlib.AdmissibleClass
import Mathlib.MeasureTheory.Measure
import Mathlib.Dynamics.Ergodic

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure InvariantMeasuresPackage where
  space : Type u
  topology : TopologicalSpace space
  flow : Flow ℝ space
  measure : MeasureTheory.Measure space
  invariance : Prop
  ergodicity : Prop

structure InvariantMeasuresEvidence (I : InvariantMeasuresPackage) where
  invarianceClosed : I.invariance
  ergodicityClosed : I.ergodicity

def InvariantMeasuresClosed (I : InvariantMeasuresPackage) : Prop :=
  I.invariance ∧ I.ergodicity

theorem invariant_measures_closed_from_evidence (I : InvariantMeasuresPackage)
    (E : InvariantMeasuresEvidence I) : InvariantMeasuresClosed I := by
  exact And.intro E.invarianceClosed E.ergodicityClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse