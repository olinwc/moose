#pragma once

#include "Kernel.h"

class HeatFluxFromHeatStructureBaseUserObject;

class OneDHeatFluxBase : public Kernel
{
public:
  OneDHeatFluxBase(const InputParameters & parameters);

  virtual void computeJacobian() override;
  virtual void computeOffDiagJacobian(unsigned jvar) override;

protected:
  virtual Real computeQpOffDiagJacobianNeighbor(unsigned int jvar) = 0;

  /// shape function values (in QPs)
  const VariablePhiValue & _phi_neighbor;
  /// User object that computes the heat flux
  const HeatFluxFromHeatStructureBaseUserObject & _q_uo;

public:
  static InputParameters validParams();
};
