use <partition.scad>

module screws_tray_grid(screw_names) {
    partition_width = 75;
    partition_depth = 15;
    name_area_depth = 5;
    
    for (row = [0:7]) {
        for (col = [0:2]) {
            translate([col * partition_width, 
                      row * (partition_depth + name_area_depth), 
                      0]) {
                partition(screw_names[row * 3 + col]);
            }
        }
    }
}

screws_tray_grid([
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
    "3x8St Screw",
    "6-32 Power Terminal Screw",
    ""
]);