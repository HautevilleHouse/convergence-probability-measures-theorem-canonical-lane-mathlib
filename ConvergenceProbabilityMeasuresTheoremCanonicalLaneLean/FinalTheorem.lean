import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.ProbabilityMeasures
import HautevilleHouse.ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.MartingaleConvergence

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

def ConstrainedProbabilityConvergenceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_probability_convergence_endgame (A : AdmissibleClass) :
    ConstrainedProbabilityConvergenceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse