import HautevilleHouse.ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure RandomProcessesConvergencePackage (A : AdmissibleClass) where
  processDefinition : Prop
  finiteDimensionalConvergence : Prop
  tightnessCondition : Prop
  limitProcessExistence : Prop

structure RandomProcessesConvergenceEvidence (A : AdmissibleClass) (R : RandomProcessesConvergencePackage A) where
  processDefinitionClosed : R.processDefinition
  finiteDimensionalConvergenceClosed : R.finiteDimensionalConvergence
  tightnessConditionClosed : R.tightnessCondition
  limitProcessExistenceClosed : R.limitProcessExistence

def RandomProcessesConvergenceClosed (A : AdmissibleClass) (R : RandomProcessesConvergencePackage A) : Prop :=
  R.processDefinition ∧ R.finiteDimensionalConvergence ∧ R.tightnessCondition ∧ R.limitProcessExistence

theorem random_processes_convergence_closed_from_evidence (A : AdmissibleClass) (R : RandomProcessesConvergencePackage A)
    (E : RandomProcessesConvergenceEvidence A R) : RandomProcessesConvergenceClosed A R := by
  exact And.intro E.processDefinitionClosed (And.intro E.finiteDimensionalConvergenceClosed
    (And.intro E.tightnessConditionClosed E.limitProcessExistenceClosed))

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse