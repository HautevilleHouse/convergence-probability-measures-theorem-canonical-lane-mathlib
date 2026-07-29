import ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Probability.ProbabilityMassFunction

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ConvergenceProbabilityObject where
  measureSpace : Type
  sigmaAlgebra : MeasurableSpace measureSpace
  probabilityMeasures : Set (MeasureTheory.Measure measureSpace)
  weakLimitProperty : Prop
  convergenceConclusion : weakLimitProperty

structure ConvergenceEndgameState where
  object : ConvergenceProbabilityObject

def ConvergenceMeasureClosed (O : ConvergenceProbabilityObject) : Prop :=
  O.weakLimitProperty

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse