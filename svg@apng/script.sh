#!/bin/bash

# Converts a SVG into PNG and transforms it into the specified parameters.
# Usage: svg2apng IMAGE_COLOR BASE_SIZE ICON_INPUT_NAME ICON_OUTPUT_NAME OUTPUT_DIR
# example: svg2apng 123abc 90 cat.svg cat ~/Desktop

color=$1
base_size=$2
input_name=$3
output_name=$4
output_dir=$5
tmp_output_file="/tmp/$input_name" # Temporary location for the SVG.

if [ ! -f $input_name ]; then
	echo 'File $input_name not found'
	exit
fi

# Change the SVG color.
sed -e "s/#000000/#$color/" $input_name > $tmp_output_file

# Now we need to load the temporary SVG, and export it in three different sizes to the specified dir.
inkscape -z -e "$output_dir/$output_name.png" -w $base_size $tmp_output_file # Output original size ("@1x")
inkscape -z -e "$output_dir/$output_name@2x.png" -w $(($base_size * 2)) $tmp_output_file # @2x
inkscape -z -e "$output_dir/$output_name@3x.png" -w $(($base_size * 3)) $tmp_output_file # @3x