// Prusaプリンターキット用ネジ整理トレー - パーティションモジュール

module screw_partition(screw_name = "set name here") {
    // パラメータ
    partition_width = 75;     // パーティション部分の幅
    partition_depth = 20;     // パーティション部分の奥行き
    partition_height = 65;     // 高さ
    name_area_depth = 10;     // 名前表示欄の奥行き
    base_height = 1;          // ベースの高さ
    wall_thickness = 1;       // 壁の厚さ
    text_size = 4;           // テキストサイズ
    text_depth = 1;        // テキストの深さ
    
    union() {
        // ベース部分（パーティション + 名前表示欄）
        cube([partition_width, partition_depth + name_area_depth, base_height]);
        
        // パーティション壁
        difference() {
            // 外側の壁
            cube([partition_width, partition_depth, base_height + partition_height]);
            
            // 内側のくぼみ
            translate([wall_thickness, wall_thickness, base_height-1]) {
                cube([partition_width - 2*wall_thickness, 
                      partition_depth - 2*wall_thickness, 
                      partition_height + 2]);
            }
        }
        
        // 名前表示欄の壁
        translate([0, partition_depth, 0]) {
            cube([partition_width, name_area_depth, base_height + partition_height]);
        }
        
        // ネジ名前のテキスト（浮き彫り）
        translate([partition_width/2, partition_depth + name_area_depth/2, base_height + partition_height]) {
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


module screw_tray_grid() {
    partition_width = 75;
    partition_depth = 20;
    name_area_depth = 10;
    
    // ネジ名のリスト（24個分）
    screw_names = [
        "M2x8", "M2x10", "M2x16",
        "M3x8", "M3x10", "M3x16",
        "M4x8", "M4x10", "M4x16",
        "M5x8", "M5x10", "M5x16",
        "M6x8", "M6x10", "M6x16",
        "M8x16", "M8x20", "M8x25",
        "予備1", "予備2", "予備3", "予備4"
    ];
    
    for (row = [0:5]) {
        for (col = [0:2]) {
            translate([col * partition_width, 
                      row * (partition_depth + name_area_depth), 
                      0]) {
                screw_partition(screw_names[row * 4 + col]);
            }
        }
    }
}

// グリッドを表示
screw_tray_grid();