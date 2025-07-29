module screw_partition(screw_name = "set name here") {
    partition_width = 75;
    partition_depth = 15;
    partition_height = 65;
    name_area_depth = 5;
    base_height = 1;
    wall_thickness = 1;
    text_size = 4;
    text_depth = 1;
    
    union() {
        difference() {
        difference() {
            // base
            cube([partition_width, partition_depth + name_area_depth, base_height + partition_height]);

            // dimple for rim around partition
            translate([wall_thickness/2, wall_thickness/2, partition_height]) {
                cube([partition_width - wall_thickness, 
                      partition_depth + name_area_depth - wall_thickness, 
                      text_depth*3]);
            }
        }
            
            // partition hole
            translate([wall_thickness, wall_thickness, base_height]) {
                cube([partition_width - 2*wall_thickness, 
                      partition_depth - 2*wall_thickness, 
                      partition_height + 2]);
            }
        }
        
        
        // screw name
        translate([partition_width/2, partition_depth + name_area_depth/2, partition_height]) {
            linear_extrude(height = text_depth) {
                text(screw_name, 
                     size = text_size, 
                     halign = "center", 
                     valign = "center",
                     font = "Liberation Sans:style=Bold");
            }
        }
    }
}

// screw_partition();

module screw_tray_grid(screw_names) {
    partition_width = 75;
    partition_depth = 15;
    name_area_depth = 5;
    text_depth = 1;
    
    
    for (row = [0:8]) {
        for (col = [0:2]) {
            translate([col * partition_width, 
                      row * (partition_depth + name_area_depth), 
                      0]) {
                screw_partition(screw_names[row * 3 + col]);
            }
        }
    }

}

screw_tray_grid(
     [
      "M2x8 Screw",
      "M2.5x10 screw",
      "M3x4T screw",
      "M3x4r screw",
      "M3x4 screw",
      "M3x4bT countersunk screw",
      "M3x4T grub screw",
      "M3x5T screw",
      "M3x6 screw",
      "M3x8 screw",
      "M3x8rT screw",
      "M3x10 screw",
      "M3x10rT screw",
      "M3x12 screw",
      "M3x12bT / M3x12cT",
      "M3x18 screw",
      "M3x20rT screw",
      "M3x25 screw",
      "M3x30 screw",
      "M3x35 screw",
      "M4x6r screw",
      "M3nS nut",
      "M3n nut",
      "M3nN nut",
      "M3w washer",
      "3x8St Screw",
      "6-32 Power Terminal Screw"
    ]);
