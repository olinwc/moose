[Mesh]
  [radial_reflector]
    type = SimpleHexagonGenerator
    hexagon_size = 10.49445
    block_id = 10
    block_name = radial_reflector
  []
  [inner_core]
    type = SimpleHexagonGenerator
    hexagon_size = 10.49445
    block_id = 20
    block_name = inner_core
  []
  [primary_control]
    type = SimpleHexagonGenerator
    hexagon_size = 10.49445
    block_id = 30
    block_name = primary_control
  []
  [secondary_control]
    type = SimpleHexagonGenerator
    hexagon_size = 10.49445
    block_id = 40
    block_name = secondary_control
  []
  [outer_core]
    type = SimpleHexagonGenerator
    hexagon_size = 10.49445
    block_id = 50
    block_name = outer_core
  []
  [core]
    type = PatternedHexMeshGenerator
    inputs = 'radial_reflector inner_core primary_control secondary_control outer_core'
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
[]
