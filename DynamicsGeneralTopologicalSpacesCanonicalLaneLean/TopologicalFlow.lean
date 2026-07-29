import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure TopologicalFlow (X : Type u) [TopologicalSpace X] where
  time : Type v
  tauTopology : TopologicalSpace time
  addMonoidTime : AddMonoid time
  continuousAdd : ContinuousAdd time
  action : time → X → X
  continuousAction : Continuous (Function.uncurry action)
  monoidAction : ∀ (t s : time) (x : X), action (t + s) x = action t (action s x)
  identity : ∀ (x : X), action 0 x = x

structure TopologicalFlowEvidence (F : TopologicalFlow X) where
  continuousActionClosed : F.continuousAction
  monoidActionClosed : F.monoidAction
  identityClosed : F.identity

def TopologicalFlowClosed (F : TopologicalFlow X) : Prop :=
  F.continuousAction ∧ F.monoidAction ∧ F.identity

theorem topological_flow_closed_from_evidence (F : TopologicalFlow X) (E : TopologicalFlowEvidence F) : TopologicalFlowClosed F := by
  exact And.intro E.continuousActionClosed (And.intro E.monoidActionClosed E.identityClosed)

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse
