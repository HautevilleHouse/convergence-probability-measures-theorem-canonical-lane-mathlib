import HautevilleHouse.ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.WeakConvergenceBridge

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure LevyProkhorovPackage (A : AdmissibleClass) where
  metricDefined : Prop
  metricMetrizesWeakConv : Prop
  completeness : Prop
  separability : Prop

structure LevyProkhorovEvidence (A : AdmissibleClass) (P : LevyProkhorovPackage A) where
  metricDefinedClosed : P.metricDefined
  metricMetrizesWeakConvClosed : P.metricMetrizesWeakConv
  completenessClosed : P.completeness
  separabilityClosed : P.separability

def LevyProkhorovClosed (A : AdmissibleClass) (P : LevyProkhorovPackage A) : Prop :=
  P.metricDefined ∧ P.metricMetrizesWeakConv ∧ P.completeness ∧ P.separability

theorem levy_prokhorov_closed_from_evidence (A : AdmissibleClass) (P : LevyProkhorovPackage A)
    (E : LevyProkhorovEvidence A P) : LevyProkhorovClosed A P := by
  exact And.intro E.metricDefinedClosed (And.intro E.metricMetrizesWeakConvClosed
    (And.intro E.completenessClosed E.separabilityClosed))

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse