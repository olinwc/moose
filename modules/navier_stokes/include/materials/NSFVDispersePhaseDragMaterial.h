//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "FunctorMaterial.h"

/**
 * This is the material class used to compute phase averaged properties of mixtures
 */
class NSFVDispersePhaseDragMaterial : public FunctorMaterial
{
public:
  static InputParameters validParams();

  NSFVDispersePhaseDragMaterial(const InputParameters & parameters);

protected:
  /// the dimension of the simulation
  const unsigned int _dim;

  /// x-velocity
  const Moose::Functor<ADReal> & _u_var;
  /// y-velocity
  const Moose::Functor<ADReal> * _v_var;
  /// z-velocity
  const Moose::Functor<ADReal> * _w_var;

  /// Continuous Phase Density
  const Moose::Functor<ADReal> & _rho_mixture;

  /// Mixture Density
  const Moose::Functor<ADReal> & _mu_mixture;

  /// Particle diameter in the dispersed phase
  const Moose::Functor<ADReal> & _particle_diameter;
};
