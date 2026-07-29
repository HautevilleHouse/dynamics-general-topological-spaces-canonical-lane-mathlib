import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Dynamics.Hyperbolic

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure HyperbolicityPackage where
  space : Type u
  topology : TopologicalSpace space
  flow : Flow ℝ space
  hyperbolicSet : Set space
  splitting : Prop
  expansionContraction : Prop

structure HyperbolicityEvidence (H : HyperbolicityPackage) where
  splittingClosed : H.splitting
  expansionContractionClosed : H.expansionContraction

def HyperbolicityClosed (H : HyperbolicityPackage) : Prop :=
  H.splitting ∧ H.expansionContraction

theorem hyperbolicity_closed_from_evidence (H : HyperbolicityPackage)
    (E : HyperbolicityEvidence H) : HyperbolicityClosed H := by
  exact And.intro E.splittingClosed E.expansionContractionClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse