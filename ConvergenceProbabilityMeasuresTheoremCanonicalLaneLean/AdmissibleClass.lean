import ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : ConvergenceProbabilityObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ConvergenceMeasureClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse