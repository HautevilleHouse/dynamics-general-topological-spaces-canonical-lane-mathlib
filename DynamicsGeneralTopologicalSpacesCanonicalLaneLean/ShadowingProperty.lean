import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Dynamics.Shadowing

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure ShadowingPackage (X : Type u) [MetricSpace X] (f : X → X) where
  space : X
  transformation : X → X
  shadowingProperty : Prop
  shadowingDistance : ℝ
  shadowingDistancePos : shadowingDistance > 0
  periodicShadowing : Prop

def ShadowingEvidence {X : Type u} [MetricSpace X] {f : X → X} (pkg : ShadowingPackage X f) : Prop :=
  pkg.shadowingProperty ∧ pkg.shadowingDistancePos ∧ pkg.periodicShadowing

def ShadowingClosed {X : Type u} [MetricSpace X] {f : X → X} (pkg : ShadowingPackage X f) : Prop :=
  ShadowingEvidence pkg

theorem shadowing_closed_from_evidence {X : Type u} [MetricSpace X] {f : X → X}
  (pkg : ShadowingPackage X f) (ev : ShadowingEvidence pkg) : ShadowingClosed pkg :=
  ev

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse