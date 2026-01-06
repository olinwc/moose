//* This file is part of the MOOSE framework
//* https://mooseframework.inl.gov
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "MTUserObject.h"

#include <fstream>

registerMooseObject("MooseTestApp", MTUserObject);

InputParameters
MTUserObject::validParams()
{
  InputParameters params = GeneralUserObject::validParams();
  params.addParam<Real>("scalar", 0, "A scalar value");
  params.addParam<std::vector<Real>>("vector", std::vector<Real>(), "A vector value");
  return params;
}

MTUserObject::MTUserObject(const InputParameters & params)
  : GeneralUserObject(params),
    _scalar(getParam<Real>("scalar")),
    _vector(getParam<std::vector<Real>>("vector")),
    _dyn_memory(NULL)
{
  // allocate some memory
  _dyn_memory = new Real[NUM];
}

MTUserObject::~MTUserObject() { delete[] _dyn_memory; }

Real
MTUserObject::doSomething() const
{
  std::vector<std::vector<int>> pids;
  pids.resize(n_processors());
  for (processor_id_type pid = 0; pid < n_processors(); ++pid)
    pids[pid].resize(n_processors(), n_processors());
  pids[processor_id()].assign(n_processors(), processor_id());
  // let's so something here, for example
  printf("%s%d\n", "Test Print for PID: ", processor_id());
  for (const auto & pid : pids)
    for (const auto & proc_id : pid)
      printf("%s%d%s%d\n", "Print 1 PID: ", proc_id, " on ", processor_id());
  if (processor_id() == 1)
  {
    mooseException("Erroring on processor ", processor_id());
  }
  for (const auto & pid : pids)
    for (const auto & proc_id : pid)
      printf("%s%d%s%d\n", "Print 2 PID: ", proc_id, " on ", processor_id());
  for (processor_id_type pid = 0; pid < n_processors(); ++pid)
  {
    comm().broadcast(pids[pid], pid);
    if (pid == processor_id())
      continue;
  }
  for (const auto & pid : pids)
    for (const auto & proc_id : pid)
      printf("%s%d%s%d\n", "Print 3 PID: ", proc_id, " on ", processor_id());
  return -2.;
}

void
MTUserObject::load(std::ifstream & stream)
{
  stream.read((char *)&_scalar, sizeof(_scalar));
}

void
MTUserObject::store(std::ofstream & stream)
{
  stream.write((const char *)&_scalar, sizeof(_scalar));
}
