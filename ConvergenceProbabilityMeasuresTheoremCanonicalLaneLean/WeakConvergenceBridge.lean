import HautevilleHouse.ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.MeasureSpaceAdmissibleClass

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.convergenceConclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.conclusion

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse