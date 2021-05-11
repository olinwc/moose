# Evanescent wave decay benchmark
# frequency = 20 GHz
# eps_R = 1.0
# mu_R = 1.0

[Mesh]
  type = FileMesh
  file = waveguide_discontinuous.msh
[]

[Functions]
  [./waveNumSq]
    type = ParsedFunction
    value = '(2*pi*20e9/3e8)^2'
  [../]
  [./omegaMu]
    type = ParsedFunction
    value = '2*pi*20e9*4*pi*1e-7'
  [../]
  [./beta]
    type = ParsedFunction
    value = '2*pi*20e9/3e8'
  [../]
  [./curr_real]
    type = ParsedVectorFunction
    value_y = 1.0
  [../]
[]

[Variables]
  [./E_real]
    family = NEDELEC_ONE
    order = FIRST
  [../]
  [./E_imag]
    family = NEDELEC_ONE
    order = FIRST
  [../]
[]

[Kernels]
  [./curlCurl_real]
    type = CurlCurlField
    variable = E_real
  [../]
  [./coeff_real]
    type = VectorCoeffField
    variable = E_real
    func = waveNumSq
    coeff = -1.0
  [../]
  [./source_real]
    type = VectorCurrentSource
    variable = E_real
    component = real
    source_real = curr_real
    source_imag = 0.0
    function_coefficient = omegaMu
    block = source
  [../]
  [./curlCurl_imag]
    type = CurlCurlField
    variable = E_imag
  [../]
  [./coeff_imag]
    type = VectorCoeffField
    variable = E_imag
    func = waveNumSq
    coeff = -1.0
  [../]
  [./source_imaginary]
    type = VectorCurrentSource
    variable = E_imag
    component = imaginary
    source_real = curr_real
    source_imag = 0.0
    function_coefficient = omegaMu
    block = source
  [../]
[]

[BCs]
  [./absorbing_left_real]
    type = VectorRobinBC
    variable = E_real
    component = real
    beta = beta
    coupled_field = E_imag
    mode = absorbing
    boundary = 'port'
  [../]
  [./absorbing_right_real]
    type = VectorRobinBC
    variable = E_real
    component = real
    beta = beta
    coupled_field = E_imag
    mode = absorbing
    boundary = 'exit'
  [../]
  [./absorbing_left_imag]
    type = VectorRobinBC
    variable = E_imag
    component = imaginary
    beta = beta
    coupled_field = E_real
    mode = absorbing
    boundary = 'port'
  [../]
  [./absorbing_right_imag]
    type = VectorRobinBC
    variable = E_imag
    component = imaginary
    beta = beta
    coupled_field = E_real
    mode = absorbing
    boundary = 'exit'
  [../]
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

[Executioner]
  type = Steady
  solve_type = 'NEWTON'
  petsc_options_iname = '-pc_type'
  petsc_options_value = 'lu'
[]

[Outputs]
  exodus = true
  print_linear_residuals = true
[]

[Debug]
  show_var_residual_norms = true
[]
