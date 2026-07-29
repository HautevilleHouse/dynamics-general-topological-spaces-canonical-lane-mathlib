import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic
import Mathlib.Dynamics.Flow

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure DynamicsPackage where
  space : Type u
  topology : TopologicalSpace space
  flow : Flow ℝ space
  invariantSet : Set space
  isolationProperty : Prop

structure DynamicsEvidence (D : DynamicsPackage) where
  flowContinuous : Continuous (Function.uncurry D.flow)
  invariantSetClosed : IsClosed D.invariantSet
  isolationPropertyClosed : D.isolationProperty

def DynamicsClosed (D : DynamicsPackage) : Prop :=
  D.isolationProperty

theorem dynamics_closed_from_evidence (D : DynamicsPackage) (E : DynamicsEvidence D) :
    DynamicsClosed D := by
  exact E.isolationPropertyClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse