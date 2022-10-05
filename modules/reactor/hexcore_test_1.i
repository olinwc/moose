[Mesh]
  [radial_reflector]
    type = PolygonConcentricCircleMeshGenerator
    num_sides = 6
    num_sectors_per_side = '2 2 2 2 2 2'
    polygon_size = 10.49445
    polygon_size_style = apothem
    background_block_ids = 10
    background_block_names = reflector
    preserve_volumes = on
  []
  [inner_core]
    type = PolygonConcentricCircleMeshGenerator
    num_sides = 6
    num_sectors_per_side = '2 2 2 2 2 2'
    polygon_size = 10.49445
    polygon_size_style = apothem
    background_block_ids = 20
    background_block_names = inner_core
    preserve_volumes = on
  []
  [primary_control]
    type = PolygonConcentricCircleMeshGenerator
    num_sides = 6
    num_sectors_per_side = '2 2 2 2 2 2'
    polygon_size = 10.49445
    polygon_size_style = apothem
    background_block_ids = 30
    background_block_names = primary_control
    preserve_volumes = on
  []
  [secondary_control]
    type = PolygonConcentricCircleMeshGenerator
    num_sides = 6
    num_sectors_per_side = '2 2 2 2 2 2'
    polygon_size = 10.49445
    polygon_size_style = apothem
    background_block_ids = 40
    background_block_names = secondary_control
    preserve_volumes = on
  []
  [outer_core]
    type = PolygonConcentricCircleMeshGenerator
    num_sides = 6
    num_sectors_per_side = '2 2 2 2 2 2'
    polygon_size = 10.49445
    polygon_size_style = apothem
    background_block_ids = 50
    background_block_names = outer_core
    preserve_volumes = on
  []
  [pattern]
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
