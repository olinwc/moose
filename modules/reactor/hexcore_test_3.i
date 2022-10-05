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
    pattern_boundary = none
    assign_type = 'cell'
    id_name = 'assembly_id'
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
[]
