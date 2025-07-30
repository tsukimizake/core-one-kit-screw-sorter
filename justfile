set shell := ["nu", "-c"]

default: compile-all

compile-all: compile-all-tray compile-screws-tray compile-nut-tray

compile-all-tray:
    print "Compiling all_tray.scad..."
    openscad -o all_tray.stl all_tray.scad

compile-screws-tray:
    print "Compiling screws_tray.scad..."
    openscad -o screws_tray.stl screws_tray.scad

compile-nut-tray:
    print "Compiling nut_tray.scad..."
    openscad -o nut_tray.stl nut_tray.scad

list-stl:
    ls *.stl

clean:
    rm -f *.stl
