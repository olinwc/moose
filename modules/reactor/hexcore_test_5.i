[Mesh]
  [radial_reflector]
    type = SimpleHexagonGenerator
    hexagon_size = 10.61025
    block_id = 10
    block_name = radial_reflector
  []
  [inner_core]
    type = SimpleHexagonGenerator
    hexagon_size = 10.61025
    block_id = 20
    block_name = inner_core
  []
  [primary_control]
    type = SimpleHexagonGenerator
    hexagon_size = 10.61025
    block_id = 30
    block_name = primary_control
  []
  [secondary_control]
    type = SimpleHexagonGenerator
    hexagon_size = 10.61025
    block_id = 40
    block_name = secondary_control
  []
  [outer_core]
    type = SimpleHexagonGenerator
    hexagon_size = 10.61025
    block_id = 50
    block_name = outer_core
  []
  [2d_core]
    type = HexIDPatternedMeshGenerator
    inputs = 'radial_reflector inner_core primary_control secondary_control outer_core'
    assign_type = 'cell'
    id_name = 'assembly_id'
    pattern_boundary = none
    pattern = '
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                 0 0 0 0 0 0 0 0 4 4 4 4 0 0 0 0 0 0 0 0;
                0 0 0 0 0 4 4 4 4 4 4 4 4 4 4 4 0 0 0 0 0;
               0 0 0 0 4 4 4 4 4 4 4 4 4 4 4 4 4 4 0 0 0 0;
              0 0 0 0 4 4 4 4 4 4 4 2 4 4 4 4 4 4 4 0 0 0 0;
             0 0 0 0 4 4 4 4 4 2 1 1 1 1 2 4 4 4 4 4 0 0 0 0;
            0 0 0 4 4 4 4 4 1 1 1 1 1 1 1 1 1 4 4 4 4 4 0 0 0;
           0 0 0 4 4 4 4 2 1 1 1 1 1 1 1 1 1 1 2 4 4 4 4 0 0 0;
          0 0 0 4 4 4 4 1 1 1 1 3 1 1 1 3 1 1 1 1 4 4 4 4 0 0 0;
         0 0 0 4 4 4 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 4 4 4 0 0 0;
        0 0 0 0 4 4 4 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 4 4 4 0 0 0 0;
       0 0 0 0 4 4 4 1 1 1 3 1 1 2 1 1 2 1 1 3 1 1 1 4 4 4 0 0 0 0;
      0 0 0 0 4 4 4 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 4 4 4 0 0 0 0;
     0 0 0 0 4 4 4 4 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 4 4 4 4 0 0 0 0;
    0 0 0 0 0 4 4 4 1 1 1 1 1 2 1 1 0 1 1 2 1 1 1 1 1 4 4 4 0 0 0 0 0;
     0 0 0 0 4 4 4 4 1 1 3 1 1 1 1 1 1 1 1 1 1 3 1 1 4 4 4 4 0 0 0 0;
      0 0 0 0 4 4 4 2 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 4 4 4 0 0 0 0;
       0 0 0 0 4 4 4 1 1 1 1 1 1 2 1 1 2 1 1 1 1 1 1 4 4 4 0 0 0 0;
        0 0 0 0 4 4 4 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 4 4 4 0 0 0 0;
         0 0 0 4 4 4 2 1 1 1 3 1 1 1 1 1 1 3 1 1 1 2 4 4 4 0 0 0;
          0 0 0 4 4 4 4 1 1 1 1 1 1 3 1 1 1 1 1 1 4 4 4 4 0 0 0;
           0 0 0 4 4 4 4 2 1 1 1 1 1 1 1 1 1 1 2 4 4 4 4 0 0 0;
            0 0 0 4 4 4 4 4 1 1 1 1 1 1 1 1 1 4 4 4 4 4 0 0 0;
             0 0 0 0 4 4 4 4 4 2 1 1 1 1 2 4 4 4 4 4 0 0 0 0;
              0 0 0 0 4 4 4 4 4 4 4 2 4 4 4 4 4 4 4 0 0 0 0;
               0 0 0 0 4 4 4 4 4 4 4 4 4 4 4 4 4 4 0 0 0 0;
                0 0 0 0 0 4 4 4 4 4 4 4 4 4 4 4 0 0 0 0 0;
                 0 0 0 0 0 0 0 0 4 4 4 4 0 0 0 0 0 0 0 0;
                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                   0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
                    0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0'
  []
  [3d_core]
    type = FancyExtruderGenerator
    input = 2d_core
    direction = '0 0 1'
    heights =    '89.91 30.17 20.11 20.11 20.11 20.11 20.11 10.05 80.45'
    num_layers = '9     3     2     2     2     2     2     1     8'
  []
  [3d_core_id]
    type = PlaneIDMeshGenerator
    input = 3d_core
    plane_coordinates = '0.0 89.91 120.08 140.19 160.3 180.41 200.52 220.63 230.68 311.13'
    num_ids_per_plane = '    1     1      1      1     1      1      1      1      1'
    id_name = 'plane_id'
  []
[]

[Executioner]
  type = Steady
[]

[Problem]
  solve = false
[]

[AuxVariables]
  [assembly_id]
    family = MONOMIAL
    order = CONSTANT
  []
  [plane_id]
    family = MONOMIAL
    order = CONSTANT
  []
[]

[AuxKernels]
  [set_assembly_id]
    type = ExtraElementIDAux
    variable = assembly_id
    extra_id_name = assembly_id
  []
  [set_plane_id]
    type = ExtraElementIDAux
    variable = plane_id
    extra_id_name = plane_id
  []
[]

[Outputs]
  exodus = true
  execute_on = timestep_end
[]
