[Mesh]
  [inner_core]
    type = SimpleHexagonGenerator
    hexagon_size = 8.12355
    block_id = 10
    block_name = inner_core
  []
  [middle_core]
    type = SimpleHexagonGenerator
    hexagon_size = 8.12355
    block_id = 20
    block_name = middle_core
  []
  [outer_core]
    type = SimpleHexagonGenerator
    hexagon_size = 8.12355
    block_id = 30
    block_name = outer_core
  []
  [radial_reflector]
    type = SimpleHexagonGenerator
    hexagon_size = 8.12355
    block_id = 40
    block_name = radial_reflector
  []
  [primary_control]
    type = SimpleHexagonGenerator
    hexagon_size = 8.12355
    block_id = 50
    block_name = primary_control
  []
  [secondary_control]
    type = SimpleHexagonGenerator
    hexagon_size = 8.12355
    block_id = 60
    block_name = secondary_control
  []
  [shield]
    type = SimpleHexagonGenerator
    hexagon_size = 8.12355
    block_id = 70
    block_name = shield
  []
  [2d_core]
    type = HexIDPatternedMeshGenerator
    inputs = 'inner_core middle_core outer_core radial_reflector primary_control secondary_control shield'
    #         0          1           2          3                4               5                 6
    assign_type = 'cell'
    id_name = 'assembly_id'
    pattern_boundary = none
    external_boundary_name = 'radial_edge'
    # added extra shield assemblies in the corner
    pattern = '
                   6 6 6 6 6 6 6 6 6 6 6 6;
                  6 6 6 3 3 3 3 3 3 3 6 6 6;
                 6 6 3 3 3 3 3 3 3 3 3 3 6 6;
                6 3 3 3 3 2 2 2 2 2 3 3 3 3 6;
               6 3 3 3 2 2 2 1 1 2 2 2 3 3 3 6;
              6 3 3 2 2 4 1 1 4 1 1 4 2 2 3 3 6;
             6 3 3 2 2 1 1 1 1 1 1 1 1 2 2 3 3 6;
            6 3 3 2 1 1 1 1 1 1 1 1 1 1 1 2 3 3 6;
           6 3 3 2 1 4 1 1 5 0 0 4 1 1 4 1 2 3 3 6;
          6 3 3 2 2 1 1 1 0 0 0 0 0 1 1 1 2 2 3 3 6;
         6 6 3 3 2 1 1 1 0 0 0 0 0 0 1 1 1 2 3 3 6 6;
        6 6 3 3 2 4 1 1 4 0 0 5 0 0 5 1 1 4 2 3 3 6 6;
         6 6 3 3 2 1 1 1 0 0 0 0 0 0 1 1 1 2 3 3 6 6;
          6 3 3 2 2 1 1 1 0 0 0 0 0 1 1 1 2 2 3 3 6;
           6 3 3 2 1 4 1 1 5 0 0 4 1 1 4 1 2 3 3 6;
            6 3 3 2 1 1 1 1 1 1 1 1 1 1 1 2 3 3 6;
             6 3 3 2 2 1 1 1 1 1 1 1 1 2 2 3 3 6;
              6 3 3 2 2 4 1 1 4 1 1 4 2 2 3 3 6;
               6 3 3 3 2 2 2 1 1 2 2 2 3 3 3 6;
                6 3 3 3 3 2 2 2 2 2 3 3 3 3 6;
                 6 6 3 3 3 3 3 3 3 3 3 3 6 6;
                  6 6 6 3 3 3 3 3 3 3 6 6 6;
                   6 6 6 6 6 6 6 6 6 6 6 6'
  []
  [3d_core]
    type = FancyExtruderGenerator
    input = 2d_core
    direction = '0 0 1'
    # Attempt to divide core into roughly 8 cm axial regions
    #    Fuel Rod Sections [cm]: 35.76 112.39 22.99 22.99 22.99 22.99 22.99 172.41 44.7 Sum: 480.21
    #                            Lower Structure, Lower Reflector, 5 axial fuel regions, Gas Plenum, upper structure
    #   Reflector Sections [cm]: 35.76 112.39 287.36 44.7 Sum: 480.21
    #                            Lower Structure, Lower Reflector, Radial Reflector, upper structure
    #      Shield Sections [cm]: 35.76 112.39 287.36 44.7 Sum: 480.21
    #                            Lower Structure, Lower Reflector, Shield, upper structure
    # Control Rod Sections [cm]: 35.76 112.39 114.95 119.97 97.14 Sum: 480.21
    #                            Lower Structure, Lower Reflector, Empty Duct, Control rod, empty duct
    heights =    '35.76 112.39 22.99 22.99 22.99 22.99 22.99 119.97 52.44 44.7'
    num_layers = '4     14     3     3     3     3     3     15     6     5'
    # Lower Structure  1
    # Lower Reflector  2 (also upper structure)
    # Empty Duct       3
    # Gas Plenum       4
    # Radial Reflector 5
    # Radial Shield    6
    # Absorber         7
    # Inner Fuel       11, 12, 13, 14, 15
    # Middle Fuel      21, 22, 23, 24, 25
    # Outer Fuel       31, 32, 33, 34, 35
    subdomain_swaps = '10 1  20 1  30 1  40 1  50 1  60 1  70 1;
                       10 2  20 2  30 2  40 2  50 2  60 2  70 2;
                       10 11 20 21 30 31 40 5  50 3  60 3  70 6;
                       10 12 20 22 30 32 40 5  50 3  60 3  70 6;
                       10 13 20 23 30 33 40 5  50 3  60 3  70 6;
                       10 14 20 24 30 34 40 5  50 3  60 3  70 6;
                       10 15 20 25 30 35 40 5  50 3  60 3  70 6;
                       10 4  20 4  30 4  40 5  50 7  60 7  70 6;
                       10 4  20 4  30 4  40 5  50 3  60 3  70 6;
                       10 2  20 2  30 2  40 2  50 3  60 3  70 2'
  []
  [3d_core_id]
    type = PlaneIDMeshGenerator
    input = 3d_core
    plane_coordinates = '0.0 35.76 148.15 171.14 194.13 217.12 240.11 263.10 383.07 435.51 480.21'
    num_ids_per_plane = '    1     1      1      1      1      1      1      1      1      1'
                      #      0     1      2      3      4      5      6      7      8      9
    id_name = 'plane_id'
  []
  [3d_block_id]
    type = RenameBlockGenerator
    input = 3d_core_id
    old_block = '              1               2          3          4                5             6                7   11   12   13   14   15   21   22   23   24   25   31   32   33   34   35'
    new_block = 'lower_structure lower_reflector empty_duct gas_plenum radial_reflector radial_shield control_absorber ic_1 ic_2 ic_3 ic_4 ic_5 mc_1 mc_2 mc_3 mc_4 mc_5 oc_1 oc_2 oc_3 oc_4 oc_5'
    # ic = inner core
    # oc = outer core
  []
  [3d_mat_id]
    type = SubdomainExtraElementIDGenerator
    input = 3d_block_id
                       # lower_structure lower_reflector empty_duct gas_plenum radial_reflector radial_shield control_absorber ic_1 ic_2 ic_3 ic_4 ic_5 mc_1 mc_2 mc_3 mc_4 mc_5 oc_1 oc_2 oc_3 oc_4 oc_5
    subdomains        = '              1               2          3          4                5             6                7   11   12   13   14   15   21   22   23   24   25   31   32   33   34   35'
    extra_element_ids = '              1               2          3          4                5             6                7   11   12   13   14   15   21   22   23   24   25   31   32   33   34   35'
    extra_element_id_names = 'material_id'
  []
  [3d_depl_id]
    # make as generic as possible
    type = DepletionIDGenerator
    input = 3d_mat_id
    id_name = 'plane_id assembly_id'
    exclude_id_name = 'assembly_id plane_id'
    exclude_id_value = '3 4 5 6; 0 1 7 8 9' #exclude "radial_reflector primary_control outer_core" and "top and bottom"
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
  [depletion_id]
    family = MONOMIAL
    order = CONSTANT
  []
  [material_id]
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
  [set_depletion_id]
    type = ExtraElementIDAux
    variable = depletion_id
    extra_id_name = depletion_id
  []
  [set_material_id]
    type = ExtraElementIDAux
    variable = material_id
    extra_id_name = material_id
  []
[]

[Outputs]
  exodus = true
  execute_on = timestep_end
[]
