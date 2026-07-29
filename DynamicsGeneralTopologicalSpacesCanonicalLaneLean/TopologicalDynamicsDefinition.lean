import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure TopologicalDynamicalSystem where
  space : Type u
  topology : TopologicalSpace space
  time : Type v
  monoidStructure : AddMonoid time
  flow : time → space → space
  continuousFlow : ∀ t : time, Continuous (flow t)
  flowZero : flow 0 = id
  flowAdd : ∀ t1 t2 : time, flow (t1 + t2) = flow t1 ∘ flow t2

structure TopologicalDynamicalEvidence (T : TopologicalDynamicalSystem) where
  continuousFlowClosed : ∀ t : T.time, Continuous (T.flow t)
  flowZeroClosed : T.flow 0 = id
  flowAddClosed : ∀ t1 t2 : T.time, T.flow (t1 + t2) = T.flow t1 ∘ T.flow t2

def TopologicalDynamicalClosed (T : TopologicalDynamicalSystem) : Prop :=
  (∀ t : T.time, Continuous (T.flow t)) ∧ (T.flow 0 = id) ∧ (∀ t1 t2 : T.time, T.flow (t1 + t2) = T.flow t1 ∘ T.flow t2)

theorem topological_dynamical_closed_from_evidence (T : TopologicalDynamicalSystem) (E : TopologicalDynamicalEvidence T) :
    TopologicalDynamicalClosed T := by
  exact And.intro E.continuousFlowClosed (And.intro E.flowZeroClosed E.flowAddClosed)

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse