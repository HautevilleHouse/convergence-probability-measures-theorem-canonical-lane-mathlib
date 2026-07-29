import canonicalLaneMathlib.AdmissibleClass
import ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.ProbabilitySpace

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure MetricSpaceWithProbabilityMeasures where
  space : Type
  metric : space → space → ℝ
  probabilityMeasures : Set (ProbabilitySpace)
  
structure WeakConvergence (Ω : MetricSpaceWithProbabilityMeasures) where
  sequence : ℕ → ProbabilitySpace
  limit : ProbabilitySpace
  convergesForAllBoundedContinuous : ∀ (f : Ω.space → ℝ), (bounded f) → (continuous f) → Filter.Tendsto (λ n => (∫ x, f x ∂(sequence n).probabilityMeasure)) Filter.atTop (nhds (∫ x, f x ∂limit.probabilityMeasure))
  
structure WeakConvergenceEvidence (Ω : MetricSpaceWithProbabilityMeasures) (W : WeakConvergence Ω) where
  tightness : (∀ ε > 0, ∃ K compact, ∀ n, (W.sequence n).probabilityMeasure (Kᶜ) < ε) ∨ (Ω.metric is totally bounded)
  limitIsProbability : (W.limit).probabilityMeasure (Set.univ) = 1 ∧ (W.limit).countableAdditive
  
def WeakConvergenceClosed (Ω : MetricSpaceWithProbabilityMeasures) (W : WeakConvergence Ω) : Prop :=
  ∀ (f : Ω.space → ℝ), (bounded f) → (continuous f) → Filter.Tendsto (λ n => (∫ x, f x ∂(W.sequence n).probabilityMeasure)) Filter.atTop (nhds (∫ x, f x ∂W.limit.probabilityMeasure))
  
theorem weak_convergence_closed_from_evidence (Ω : MetricSpaceWithProbabilityMeasures) (W : WeakConvergence Ω) (E : WeakConvergenceEvidence Ω W) : WeakConvergenceClosed Ω W := by
  intro f hb hc
  exact W.convergesForAllBoundedContinuous f hb hc

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse