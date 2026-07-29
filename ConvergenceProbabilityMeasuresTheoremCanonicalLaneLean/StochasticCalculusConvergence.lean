import HautevilleHouse.ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.RandomProcessesConvergence

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure StochasticCalculusConvergencePackage (A : AdmissibleClass) where
  itoIntegralDefined : Prop
  itoFormulaHolds : Prop
  stochasticDifferentialEquationConvergence : Prop
  limitIsDiffusion : Prop

structure StochasticCalculusConvergenceEvidence (A : AdmissibleClass) (S : StochasticCalculusConvergencePackage A) where
  itoIntegralDefinedClosed : S.itoIntegralDefined
  itoFormulaHoldsClosed : S.itoFormulaHolds
  stochasticDifferentialEquationConvergenceClosed : S.stochasticDifferentialEquationConvergence
  limitIsDiffusionClosed : S.limitIsDiffusion

def StochasticCalculusConvergenceClosed (A : AdmissibleClass) (S : StochasticCalculusConvergencePackage A) : Prop :=
  S.itoIntegralDefined ∧ S.itoFormulaHolds ∧ S.stochasticDifferentialEquationConvergence ∧ S.limitIsDiffusion

theorem stochastic_calculus_convergence_closed_from_evidence (A : AdmissibleClass) (S : StochasticCalculusConvergencePackage A)
    (E : StochasticCalculusConvergenceEvidence A S) : StochasticCalculusConvergenceClosed A S := by
  exact And.intro E.itoIntegralDefinedClosed (And.intro E.itoFormulaHoldsClosed
    (And.intro E.stochasticDifferentialEquationConvergenceClosed E.limitIsDiffusionClosed))

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse