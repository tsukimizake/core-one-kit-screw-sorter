module partition(screw_name = "set name here") {
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
            // hole under name to enable bridge on print
            translate([wall_thickness, partition_depth, -1]) {
                cube([partition_width - 2*wall_thickness, 
                      name_area_depth - wall_thickness, 
                      partition_height-2]);
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

partition("");
