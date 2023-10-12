//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "WCNSFVPhysicsBase.h"

/**
 * Creates all the objects needed to solve the Navier Stokes scalar advection equations
 */
class WCNSFVScalarAdvectionPhysics : public WCNSFVPhysicsBase
{
public:
  static InputParameters validParams();

  WCNSFVScalarAdvectionPhysics(const InputParameters & parameters);

  /// GeneralUO not the right base class probably
  virtual void initialize() override{};
  virtual void execute() override{};
  virtual void finalize() override{};

protected:
private:
  void addNonlinearVariables() override;
  void addInitialConditions() override;
  void addFVKernels() override;
  void addFVBCs() override;

  unsigned short getNumberAlgebraicGhostingLayersNeeded() const override;

  // /**
  //  * Functions adding kernels for the incompressible / weakly compressible scalar advection
  //  * equation
  //  * If the material properties are not constant, some of these can be used for
  //  * weakly-compressible simulations as well.
  //  */
  void addScalarTimeKernels();
  void addScalarDiffusionKernels();
  void addScalarAdvectionKernels();
  /// Equivalent of NSFVAction addScalarCoupledSourceKernels
  void addScalarSourceKernels();

  /// Functions adding boundary conditions for the incompressible simulation.
  /// These are used for weakly-compressible simulations as well.
  void addScalarInletBC();
  void addScalarWallBC();

  std::vector<NonlinearVariableName> _passive_scalar_names;
};
