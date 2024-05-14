//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#pragma once

#include "SurrogateModel.h"
#include "GaussianProcessTrainer.h"
#include "Standardizer.h"
#include <Eigen/Dense>
#include "CovarianceInterface.h"
#include "GaussianProcessGeneral.h"

class GaussianProcessSurrogateGeneral : public SurrogateModel, public CovarianceInterface
{
public:
  static InputParameters validParams();
  GaussianProcessSurrogateGeneral(const InputParameters & parameters);
  using SurrogateModel::evaluate;
  virtual Real evaluate(const std::vector<Real> & x) const;
  virtual void evaluate(const std::vector<Real> & x, std::vector<Real> & y) const;
  virtual Real evaluate(const std::vector<Real> & x, Real & std) const;
  virtual void
  evaluate(const std::vector<Real> & x, std::vector<Real> & y, std::vector<Real> & std) const;

  /**
   * This function is called by LoadCovarianceDataAction when the surrogate is
   * loading training data from a file. The action must recreate the covariance
   * object before this surrogate can set the correct pointer.
   */
  virtual void setupCovariance(UserObjectName _covar_name);

  StochasticTools::GaussianProcessGeneral & gp() { return _gp; }
  const StochasticTools::GaussianProcessGeneral & getGP() const { return _gp; }

private:
  StochasticTools::GaussianProcessGeneral & _gp;

  /// Paramaters (x) used for training
  const RealEigenMatrix & _training_params;

  /// Number of input parameters
  const unsigned int & _n_dims;

  /// The number of outputs
  const unsigned int & _n_outputs;
};
