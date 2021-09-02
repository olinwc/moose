//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "ADMortarConstraint.h"

#include <unordered_map>

/**
 * Computes the weighted gap that will later be used to enforce the
 * zero-penetration mechanical contact conditions
 */
class ComputeWeightedGapLMMechanicalContact : public ADMortarConstraint
{
public:
  static InputParameters validParams();

  ComputeWeightedGapLMMechanicalContact(const InputParameters & parameters);
  using ADMortarConstraint::computeResidual;
  void computeResidual(Moose::MortarType mortar_type) override;
  using ADMortarConstraint::computeJacobian;
  void computeJacobian(Moose::MortarType mortar_type) override;
  void residualSetup() override;
  void jacobianSetup() override;
  void post() override;

protected:
  ADReal computeQpResidual(Moose::MortarType mortar_type) final;

  /**
   * Computes properties that are functions only of the current quadrature point (\p _qp), e.g.
   * indepedent of shape functions
   */
  virtual void computeQpProperties();

  /**
   * Computes properties that are functions both of \p _qp and \p _i, for example the weighted gap
   */
  virtual void computeQpIProperties();

  /**
   * Method called from \p post(). Used to enforce node-associated constraints. E.g. for the base \p
   * ComputeWeightedGapLMMechanicalContact we enforce the zero-penetration constraint in this method
   * using an NCP function. This is also where we actually feed the node-based constraint
   * information into the system residual and Jacobian
   */
  void enforceConstraintOnDof(const dof_id_type dof_index);

  /// x-displacement on the secondary face
  const ADVariableValue & _secondary_disp_x;
  /// x-displacement on the primary face
  const ADVariableValue & _primary_disp_x;
  /// y-displacement on the secondary face
  const ADVariableValue & _secondary_disp_y;
  /// y-displacement on the primary face
  const ADVariableValue & _primary_disp_y;

  /// For 2D mortar contact no displacement will be specified, so const pointers used
  const bool _has_disp_z;
  /// z-displacement on the secondary face
  const ADVariableValue * const _secondary_disp_z;
  /// z-displacement on the primary face
  const ADVariableValue * const _primary_disp_z;

  /// The normal index. This is _qp if we are interpolating the nodal normals, else it is _i
  const unsigned int & _normal_index;

  /// This factor multiplies the weighted gap. This member, provided through a user parameter,
  /// should be of a value such that its product with the gap is on the same scale as the lagrange
  /// multiplier
  const Real _c;

  /// The value of the gap at the current quadrature point
  ADReal _qp_gap;
  /// The value of the LM at the current quadrature point
  ADReal _qp_traction;

  /// A map from node to weighted gap (and weighted traction for non-dual)
  std::unordered_map<dof_id_type, std::pair<ADReal, ADReal>> _dof_to_weighted_gap;

  /// A pointer members that can be used to help avoid copying ADReals
  const ADReal * _weighted_gap_ptr = nullptr;
  const ADReal * _weighted_traction_ptr = nullptr;
};
