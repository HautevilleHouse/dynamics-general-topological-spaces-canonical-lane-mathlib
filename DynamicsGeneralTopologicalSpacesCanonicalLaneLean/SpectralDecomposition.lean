import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Dynamics.Spectral

namespace HautevilleHouse
namespace DynamicsGeneralTopologicalSpacesCanonicalLaneLean

structure SpectralDecompositionPackage where
  space : Type u
  topology : TopologicalSpace space
  flow : Flow ℝ space
  spectrum : Set ℂ
  spectralMeasure : Prop
  decompositionComplete : Prop

structure SpectralDecompositionEvidence (S : SpectralDecompositionPackage) where
  spectralMeasureClosed : S.spectralMeasure
  decompositionCompleteClosed : S.decompositionComplete

def SpectralDecompositionClosed (S : SpectralDecompositionPackage) : Prop :=
  S.spectralMeasure ∧ S.decompositionComplete

theorem spectral_decomposition_closed_from_evidence (S : SpectralDecompositionPackage)
    (E : SpectralDecompositionEvidence S) : SpectralDecompositionClosed S := by
  exact And.intro E.spectralMeasureClosed E.decompositionCompleteClosed

end DynamicsGeneralTopologicalSpacesCanonicalLaneLean
end HautevilleHouse