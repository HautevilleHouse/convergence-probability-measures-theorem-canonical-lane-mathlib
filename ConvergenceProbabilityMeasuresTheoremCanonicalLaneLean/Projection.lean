import ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def convergenceProjection : Projection ConvergenceEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem convergence_projection_idempotent (x : ConvergenceEndgameState) :
    convergenceProjection.toFun (convergenceProjection.toFun x) = convergenceProjection.toFun x := by
  exact convergenceProjection.idempotent x

end ConvergenceProbabilityMeasuresTheoremCanonicalLaneLean
end HautevilleHouse