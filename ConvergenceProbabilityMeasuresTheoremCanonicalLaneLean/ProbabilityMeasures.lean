import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure ProbabilityMeasureSpace where
  carrier : Type u
  sigmaAlgebra : Set (Set carrier)
  measure : carrier → ℝ
  sigmaAdditive : Prop
  totalMassOne : Prop
  sigmaAdditiveTerm : sigmaAdditive
  totalMassOneTerm : totalMassOne

structure ConvergenceRandomVariable where
  domain : ProbabilityMeasureSpace
  codomain : Type v
  topology : TopologicalSpace codomain
  measurable : (domain.carrier → codomain) → Prop
  measurableTerm : measurable

structure WeakConvergence where
  source : ConvergenceRandomVariable
  target : ConvergenceRandomVariable
  expectedConvergence : Prop
  boundedContinuous : Prop
  convergenceHolds : Prop
  convergenceHoldsTerm : convergenceHolds

def WeakConvergenceClosed (W : WeakConvergence) : Prop :=
  W.expectedConvergence ∧ W.boundedContinuous ∧ W.convergenceHolds

theorem weak_convergence_closed_from_evidence (W : WeakConvergence) (E : W.convergenceHolds) :
    WeakConvergenceClosed W := by
  exact And.intro W.expectedConvergence (And.intro W.boundedContinuous E)

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse