import ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.MeasureTheoryFoundation

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure PortmanteauTheorem (M : MeasureTheory.MeasureSpace)
    (μ μn : MeasureTheory.Measure M) where
  closedSetCondition : Prop
  openSetCondition : Prop
  continuitySetCondition : Prop
  boundedContinuousCondition : Prop

structure PortmanteauEvidence {M : MeasureTheory.MeasureSpace}
    {μ μn : MeasureTheory.Measure M} (P : PortmanteauTheorem μ μn) where
  closedSetConditionClosed : P.closedSetCondition
  openSetConditionClosed : P.openSetCondition
  continuitySetConditionClosed : P.continuitySetCondition
  boundedContinuousConditionClosed : P.boundedContinuousCondition

def PortmanteauClosed {M : MeasureTheory.MeasureSpace}
    {μ μn : MeasureTheory.Measure M} (P : PortmanteauTheorem μ μn) : Prop :=
  P.closedSetCondition ∧ P.openSetCondition ∧
  P.continuitySetCondition ∧ P.boundedContinuousCondition

theorem portmanteau_closed_from_evidence
    {M : MeasureTheory.MeasureSpace} {μ μn : MeasureTheory.Measure M}
    (P : PortmanteauTheorem μ μn) (E : PortmanteauEvidence P) : PortmanteauClosed P := by
  exact And.intro E.closedSetConditionClosed
    (And.intro E.openSetConditionClosed
      (And.intro E.continuitySetConditionClosed E.boundedContinuousConditionClosed))

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse