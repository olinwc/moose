nu=1.1

[GlobalParams]
  variable = face_vel_x
  u = vel_x
  v = vel_y
  grad_u = grad_vel_x
  grad_v = grad_vel_y
  face_u = face_vel_x
  face_v = face_vel_y
  pressure = p
  enclosure_lm = lm
  nu = ${nu}
[]

[Mesh]
  [gen]
    type = GeneratedMeshGenerator
    dim = 2
    xmin = -1
    xmax = 1
    ymin = -1
    ymax = 1
    nx = 2
    ny = 2
    elem_type = TRI6
  []
[]

[Variables]
  [face_vel_x]
    family = SIDE_HIERARCHIC
  []
  [face_vel_y]
    family = SIDE_HIERARCHIC
  []
  [p]
    family = L2_LAGRANGE
  []
  [lm]
    family = SCALAR
  []
[]

[AuxVariables]
  [vel_x]
    family = L2_LAGRANGE
  []
  [vel_y]
    family = L2_LAGRANGE
  []
  [grad_vel_x]
    family = L2_LAGRANGE_VEC
  []
  [grad_vel_y]
    family = L2_LAGRANGE_VEC
  []
[]

[HybridizedKernels]
  [ns]
    type = NavierStokesHybridizedKernel
    body_force_x = forcing_u
    body_force_y = forcing_v
    pressure_mms_forcing_function = forcing_p
  []
[]

[HybridizedBCs]
  [exact]
    type = NavierStokesHybridizedVelocityDirichletBC
    boundary = 'left right bottom top'
    dirichlet_u = 'exact_u'
    dirichlet_v = 'exact_v'
  []
[]

[Functions]
  [exact_u]
    type = ParsedFunction
    expression = 'sin(y)*cos((1/2)*x*pi)'
  []
  [forcing_u]
    type = ParsedFunction
    expression = 'nu*sin(y)*cos((1/2)*x*pi) + (1/4)*pi^2*nu*sin(y)*cos((1/2)*x*pi) - 1/2*pi*sin(x)*sin(y)*sin((1/2)*y*pi)*cos((1/2)*x*pi) + sin(x)*cos(y)*cos((1/2)*x*pi)*cos((1/2)*y*pi) - pi*sin(y)^2*sin((1/2)*x*pi)*cos((1/2)*x*pi) + sin(y)*cos(x)'
    symbol_names = 'nu'
    symbol_values = '${nu}'
  []
  [exact_v]
    type = ParsedFunction
    expression = 'sin(x)*cos((1/2)*y*pi)'
  []
  [forcing_v]
    type = ParsedFunction
    expression = 'nu*sin(x)*cos((1/2)*y*pi) + (1/4)*pi^2*nu*sin(x)*cos((1/2)*y*pi) - pi*sin(x)^2*sin((1/2)*y*pi)*cos((1/2)*y*pi) - 1/2*pi*sin(x)*sin(y)*sin((1/2)*x*pi)*cos((1/2)*y*pi) + sin(x)*cos(y) + sin(y)*cos(x)*cos((1/2)*x*pi)*cos((1/2)*y*pi)'
    symbol_names = 'nu'
    symbol_values = '${nu}'
  []
  [exact_p]
    type = ParsedFunction
    expression = 'sin(x)*sin(y)'
  []
  [forcing_p]
    type = ParsedFunction
    expression = '-1/2*pi*sin(x)*sin((1/2)*y*pi) - 1/2*pi*sin(y)*sin((1/2)*x*pi)'
  []
[]

[Executioner]
  type = Steady
  solve_type = NEWTON
  petsc_options_iname = '-pc_type -pc_factor_shift_type'
  petsc_options_value = 'lu       NONZERO'
  line_search = 'basic'
[]

[Outputs]
  csv = true
[]

[Postprocessors]
  [h]
    type = AverageElementSize
    outputs = 'console csv'
    execute_on = 'timestep_end'
  []
  [L2u]
    type = ElementL2Error
    variable = vel_x
    function = exact_u
    outputs = 'console csv'
    execute_on = 'timestep_end'
  []
  [L2v]
    variable = vel_y
    function = exact_v
    type = ElementL2Error
    outputs = 'console csv'
    execute_on = 'timestep_end'
  []
  [L2p]
    variable = p
    function = exact_p
    type = ElementL2Error
    outputs = 'console csv'
    execute_on = 'timestep_end'
  []
[]
