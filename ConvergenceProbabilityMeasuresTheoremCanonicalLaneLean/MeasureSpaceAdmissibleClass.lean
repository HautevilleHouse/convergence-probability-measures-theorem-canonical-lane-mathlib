import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

structure ProbabilityMeasureSpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)
  probabilityMeasure : (Set carrier) → ℝ
  probabilityMeasureProps : IsProbabilityMeasure probabilityMeasure

structure AdmittedObject where
  space : ProbabilityMeasureSpace
  limitMeasure : ProbabilityMeasureSpace
  convergenceMode : ConvergenceMode
  convergenceConclusion : Prop
  conclusion : convergenceConclusion

inductive ConvergenceMode where
  | weak
  | strong
  | inProbability
  | almostSure
  | inLp (p : ℝ)

definition AdmissibleClass (A : AdmittedObject) : Prop :=
  A.convergenceConclusion

structure ConstrainedTheoremClosure (A : AdmissibleClass) : Prop where
  bridgeClosed : A.convergenceConclusion
  gateClosed : A.limitMeasure.probabilityMeasureProps

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse