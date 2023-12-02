//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "FVElementalKernel.h"

/**
 * Implements a heat transfer term with an ambient medium, proportional to the
 * difference between the fluid and ambient temperature.
 */
class NSFVInterfaceTransfer : public FVElementalKernel
{
public:
  static InputParameters validParams();

  NSFVInterfaceTransfer(const InputParameters & parameters);

protected:
  ADReal computeQpResidual() override;

  /// Interface voumetric transfer coefficient
  const Moose::Functor<ADReal> & _alpha;
  /// Coupled Phase Functor
  const Moose::Functor<ADReal> & _phase_coupled;
};
