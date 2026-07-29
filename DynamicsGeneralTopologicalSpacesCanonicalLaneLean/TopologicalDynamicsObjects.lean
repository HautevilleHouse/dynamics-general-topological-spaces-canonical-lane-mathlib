import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure TopologicalSpaceCarrier (X : Type u) where
  top : TopologicalSpace X

def TopologicalDynamicsObject (X : Type u) [TopologicalSpace X] : Prop := True

structure DynamicAdmittedObject (X : Type u) [TopologicalSpace X] where
  carrierSet : Set X
  flowMap : X → X
  flowContinuous : Continuous flowMap
  invarianceProp : carrierSet ∈ {s : Set X | flowMap '' s ⊆ s}
  conclusion : invarianceProp

def DynamicWitnessClosed (O : DynamicAdmittedObject X) : Prop :=
  O.invarianceProp

def AdmissibleClass (X : Type u) [TopologicalSpace X] where
  object : DynamicAdmittedObject X
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass X) : Prop :=
  DynamicWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse