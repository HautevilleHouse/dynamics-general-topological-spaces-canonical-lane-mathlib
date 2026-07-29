import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Dynamics.Ergodic.MeasurePreserving

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure InvariantMeasurePackage (X : Type u) [TopologicalSpace X] (f : X → X) where
  space : X
  transformation : X → X
  borelSigmaAlgebra : MeasurableSpace X
  invariantProbabilityMeasure : Measure X
  measurePreserving : MeasurePreserving f invariantProbabilityMeasure invariantProbabilityMeasure
  ergodic : Prop

def InvariantMeasureEvidence {X : Type u} [TopologicalSpace X] {f : X → X} (pkg : InvariantMeasurePackage X f) : Prop :=
  pkg.measurePreserving ∧ pkg.ergodic

def InvariantMeasureClosed {X : Type u} [TopologicalSpace X] {f : X → X} (pkg : InvariantMeasurePackage X f) : Prop :=
  InvariantMeasureEvidence pkg

theorem invariant_measure_closed_from_evidence {X : Type u} [TopologicalSpace X] {f : X → X}
  (pkg : InvariantMeasurePackage X f) (ev : InvariantMeasureEvidence pkg) : InvariantMeasureClosed pkg :=
  ev

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse