use <partition.scad>

module nut_tray_grid(nut_names) {
    partition_width = 75;
    partition_depth = 15;
    name_area_depth = 5;
    
    for (row = [0:1]) {
        for (col = [0:1]) {
            translate([col * partition_width, 
                      row * (partition_depth + name_area_depth), 
                      0]) {
                partition(nut_names[row * 2 + col]);
            }
        }
    }
}

nut_tray_grid([
    "M3nS nut",
    "M3n nut", 
    "M3nN nut",
    "M3w washer"
]);