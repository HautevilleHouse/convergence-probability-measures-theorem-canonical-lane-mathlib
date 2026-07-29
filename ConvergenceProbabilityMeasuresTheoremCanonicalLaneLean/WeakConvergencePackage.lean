import ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.PortmanteauTheorem

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure WeakConvergencePackage {M : MeasureTheory.MeasureSpace}
    {μ μn : MeasureTheory.Measure M} (h : PortmanteauTheorem μ μn) where
  boundedContinuousTest : Prop
  portmanteauEquivalence : Prop
  weakLimitCharacterized : Prop

structure WeakConvergenceEvidence {M : MeasureTheory.MeasureSpace}
    {μ μn : MeasureTheory.Measure M} {h : PortmanteauTheorem μ μn}
    (W : WeakConvergencePackage h) where
  boundedContinuousTestClosed : W.boundedContinuousTest
  portmanteauEquivalenceClosed : W.portmanteauEquivalence
  weakLimitCharacterizedClosed : W.weakLimitCharacterized

def WeakConvergenceClosed {M : MeasureTheory.MeasureSpace}
    {μ μn : MeasureTheory.Measure M} {h : PortmanteauTheorem μ μn}
    (W : WeakConvergencePackage h) : Prop :=
  W.boundedContinuousTest ∧ W.portmanteauEquivalence ∧ W.weakLimitCharacterized

theorem weak_convergence_closed_from_evidence
    {M : MeasureTheory.MeasureSpace} {μ μn : MeasureTheory.Measure M}
    {h : PortmanteauTheorem μ μn} (W : WeakConvergencePackage h)
    (E : WeakConvergenceEvidence W) : WeakConvergenceClosed W := by
  exact And.intro E.boundedContinuousTestClosed
    (And.intro E.portmanteauEquivalenceClosed E.weakLimitCharacterizedClosed)

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse