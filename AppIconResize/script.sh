#!/bin/bash

# Takes a 1024x1024 app icon and produces all app icon sizes based on it.
# Requires imagemagick to work.
# USAGE: air ORIGINAL_FILE PATH_TO_OUTPUT_DIR
# Example: air icon.png .
# Author: Andrés Ibañez
# License: Apache 2
#
# ----------------------
#
# Copyright 2017 Andrés Ibañez Kautsch
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

original_file=$1
output_dir=$2

if [ ! -f $original_file ]; then
	echo 'File $original_file not found'
	exit
fi

#Array of all required sizes
declare -a sizes=("16"
                  "20"
                  "29"
                  "32"
                  "40"
                  "48"
                  "50"
                  "55"
                  "57"
                  "58"
                  "60"
                  "64"
                  "72"
                  "76"
                  "80"
                  "87"
                  "88"
                  "100"
                  "114"
                  "120"
                  "128"
                  "144"
                  "152"
                  "167"
                  "172"
                  "180"
                  "196"
                  "256"
                  "512"
                  "1024")

for size in ${sizes[@]}
do
  convert $original_file -resize $size'x'$size "$output_dir/Icon-$size.png"
done
