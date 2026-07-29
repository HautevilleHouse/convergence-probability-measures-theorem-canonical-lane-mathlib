import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure ProbabilitySpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)
  probabilityMeasure : (Set carrier) → ℝ
  probabilityOfWholeSpace : probabilityMeasure (Set.univ) = 1
  countableAdditive : ∀ (E : ℕ → Set carrier), (∀ n, E n ∈ sigmaAlgebra) → (DisjointFamily E) → probabilityMeasure (⋃ n, E n) = ∑' n, probabilityMeasure (E n)
  
structure ProbabilitySpaceEvidence (Ω : ProbabilitySpace) where
  probabilityOfWholeSpaceClosed : Ω.probabilityOfWholeSpace
  countableAdditiveClosed : Ω.countableAdditive

def ProbabilitySpaceClosed (Ω : ProbabilitySpace) : Prop :=
  Ω.probabilityOfWholeSpace ∧ Ω.countableAdditive

theorem probability_space_closed_from_evidence (Ω : ProbabilitySpace) (E : ProbabilitySpaceEvidence Ω) : ProbabilitySpaceClosed Ω := by
  exact And.intro E.probabilityOfWholeSpaceClosed E.countableAdditiveClosed

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse