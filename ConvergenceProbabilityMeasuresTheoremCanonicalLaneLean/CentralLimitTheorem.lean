import canonicalLaneMathlib.AdmissibleClass
import ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.ProbabilitySpace
import ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.WeakConvergence

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure IIDSequence (Ω : ProbabilitySpace) where
  randomVariables : ℕ → (Ω.carrier → ℝ)
  identicallyDistributed : ∀ n m, (∀ A ∈ Ω.sigmaAlgebra, (∫ x, indicator A (randomVariables n x) ∂Ω.probabilityMeasure) = (∫ x, indicator A (randomVariables m x) ∂Ω.probabilityMeasure))
  independent : ∀ (n : ℕ) (A : Set ℝ), (randomVariables n)⁻¹' A ∈ Ω.sigmaAlgebra
  finiteVariance : ∃ σ2 : ℝ, ∀ n, (∫ x, (randomVariables n x)^2 ∂Ω.probabilityMeasure) - ((∫ x, randomVariables n x ∂Ω.probabilityMeasure))^2 = σ2
  
structure CLTResult (Ω : ProbabilitySpace) (X : IIDSequence Ω) where
  standardNormalLimit : ProbabilitySpace
  normalizedSums : ℕ → (Ω.carrier → ℝ)
  normalizedSumsDef : ∀ N x, normalizedSums N x = (∑ n in Finset.range N, X.randomVariables n x - N * (∫ y, X.randomVariables 0 y ∂Ω.probabilityMeasure)) / (Real.sqrt (N * (X.finiteVariance.choose)))
  convergence : WeakConvergence (MetricSpaceWithProbabilityMeasures.mk ℝ (fun x y => |x-y|) {}) (WeakConvergence.mk (λ N => probabilitySpaceFromMeasure (law of normalizedSums N)) standardNormalLimit (by
    -- convergence in distribution
    sorry))

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse