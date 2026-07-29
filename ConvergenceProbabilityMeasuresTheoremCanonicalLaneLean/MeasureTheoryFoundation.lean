import Mathlib.MeasureTheory.Integral.Bochner
import Mathlib.Probability.Process.Filtration

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure MeasureTheoryFoundation where
  probabilitySpace : Type u
  measurableFunctions : Type v
  integralsDefined : Prop
  dominatedConvergence : Prop

structure MeasureTheoryEvidence (M : MeasureTheoryFoundation) where
  integralsDefinedClosed : M.integralsDefined
  dominatedConvergenceClosed : M.dominatedConvergence

def MeasureTheoryFoundationClosed (M : MeasureTheoryFoundation) : Prop :=
  M.integralsDefined ∧ M.dominatedConvergence

theorem measure_theory_foundation_closed_from_evidence
    (M : MeasureTheoryFoundation) (E : MeasureTheoryEvidence M) :
    MeasureTheoryFoundationClosed M := by
  exact And.intro E.integralsDefinedClosed E.dominatedConvergenceClosed

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse