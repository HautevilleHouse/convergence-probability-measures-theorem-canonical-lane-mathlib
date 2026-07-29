import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure Martingale where
  domain : ProbabilityMeasureSpace
  filtration : ℕ → Set (Set (domain.carrier))
  adapted : Prop
  integrable : Prop
  martingaleProperty : Prop
  adaptedTerm : adapted
  integrableTerm : integrable
  martingalePropertyTerm : martingaleProperty

structure AlmostSureConvergence where
  martingale : Martingale
  limitExists : Prop
  convergenceInProbability : Prop
  limitExistsTerm : limitExists
  convergenceInProbabilityTerm : convergenceInProbability

def AlmostSureConvergenceClosed (A : AlmostSureConvergence) : Prop :=
  A.limitExists ∧ A.convergenceInProbability

theorem almost_sure_convergence_closed_from_evidence (A : AlmostSureConvergence)
    (E : A.limitExists) (F : A.convergenceInProbability) : AlmostSureConvergenceClosed A := by
  exact And.intro E F

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse