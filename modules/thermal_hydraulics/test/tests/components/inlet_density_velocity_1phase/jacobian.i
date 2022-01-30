[GlobalParams]
  initial_p = 1e5
  initial_T = 300
  initial_vel = 2

  scaling_factor_1phase = '1. 1. 1'

  closures = simple_closures
[]

[Modules/FluidProperties]
  [eos]
    type = StiffenedGasFluidProperties
    gamma = 2.35
    cv = 1816.0
    q = -1.167e6
    p_inf = 1.0e9
    q_prime = 0
    k = 0.5
    mu = 281.8e-6
  []
[]

[Closures]
  [simple_closures]
    type = Closures1PhaseSimple
  []
[]

[Components]
  [pipe]
    type = FlowChannel1Phase
    fp = eos
    # geometry
    position = '0 0 0'
    orientation = '1 0 0'
    A = 1e-4
    D_h = 1.12837916709551
    f = 0
    length = 1
    n_elems = 2
  []

  [inlet]
    type = InletDensityVelocity1Phase
    input = 'pipe:in'
    rho = 805
    vel = 1
  []
[]

[Preconditioning]
  [SMP_PJFNK]
    type = SMP
    full = true
  []
[]

[Executioner]
  type = Transient

  start_time = 0
  dt = 1e-2
  num_steps = 1
  abort_on_solve_fail = true

  solve_type = 'NEWTON'

  petsc_options_iname = '-snes_type -snes_test_err'
  petsc_options_value = 'test       1e-11'
[]
