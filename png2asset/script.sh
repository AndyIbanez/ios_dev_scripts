##########################################################################
# Takes a 1024x1024 PNG image and generates an icon image asset for Xcode.
# It can take an additional right-to-left icon for localization purposes.
# If this parameter is ignored, all assets will be generated based on the
# only provided image.
#
# USAGE:
#
#	png2asset OUTPUT_DIR ASSET_NAME SOURCE_PNG [RIGHT_TO_LEFT]
#
# Author: Andrés Ibañez
# License: Apache 2
#
# ---------------------
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

output_dir=$1
asset_name=$2
asset_name="$asset_name.appiconset"
original_file=$3
original_file_rtl=$4

tmpPath=$output_dir/$asset_name/.temp
tmpPathRtl=$output_dir/$asset_name/.temp_rtl
assetPath=$output_dir/$asset_name
jsonContentsPath="$assetPath/Contents.json"

mkdir $assetPath
mkdir $tmpPath
mkdir $tmpPathRtl

if [ ! -f $original_file ]; then
	echo 'File $original_file not found'
	exit
fi

#Array of all required sizes
declare -a sizes=("20"
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
  convert $original_file -resize $size'x'$size "$tmpPath/$size"
done

if [ ! -z "$original_file_rtl" ]; then
	# We have a RTL icon.
	for size in ${sizes[@]}
	do
		convert $original_file_rtl -resize $size'x'$size "$tmpPathRtl/$size"
	done
fi

# I'm a JSON master.
# Yes, I'm building it by hand :)
touch $jsonContentsPath

# Loop and build the images here
# You know what, screw it. I was going to think of clever loops to do this, but there's no sane way to do it considering:
# The different sizes (would be easy if it was just this)
# Different scales
# Different idioms
# Different language directions (and those icons that don't have it for whatever reason)
#
# Not to mention I have no idea if the order of the JSON matters or not.
#
# So I'm just gonna write the nastiest code of my life, copy and paste like a retard, and apologize later.

# Please forgive me lord for the sin I'm about to commit.

cp $tmpPath/40 $assetPath/Icon-40.png
cp $tmpPath/40 $assetPath/Icon-41.png
cp $tmpPath/60 $assetPath/Icon-80.png
cp $tmpPath/60 $assetPath/Icon-81.png
cp $tmpPath/29 $assetPath/Icon-32.png
cp $tmpPath/29 $assetPath/Icon-33.png
cp $tmpPath/58 $assetPath/Icon-58.png
cp $tmpPath/58 $assetPath/Icon-59.png
cp $tmpPath/87 $assetPath/Icon-87.png
cp $tmpPath/87 $assetPath/Icon-88.png
cp $tmpPath/80 $assetPath/Icon-83.png
cp $tmpPath/80 $assetPath/Icon-84.png
cp $tmpPath/120 $assetPath/Icon-120.png
cp $tmpPath/120 $assetPath/Icon-121.png
cp $tmpPath/57 $assetPath/Icon-57.png
cp $tmpPath/114 $assetPath/Icon-114.png
cp $tmpPath/120 $assetPath/Icon-123.png
cp $tmpPath/120 $assetPath/Icon-124.png
cp $tmpPath/180 $assetPath/Icon-180.png
cp $tmpPath/180 $assetPath/Icon-181.png
cp $tmpPath/20 $assetPath/Icon-16.png
cp $tmpPath/20 $assetPath/Icon-17.png
cp $tmpPath/40 $assetPath/Icon-43.png
cp $tmpPath/40 $assetPath/Icon-44.png
cp $tmpPath/29 $assetPath/Icon-29.png
cp $tmpPath/29 $assetPath/Icon-30.png
cp $tmpPath/58 $assetPath/Icon-61.png
cp $tmpPath/58 $assetPath/Icon-62.png
cp $tmpPath/40 $assetPath/Icon-46.png
cp $tmpPath/40 $assetPath/Icon-47.png
cp $tmpPath/80 $assetPath/Icon-86.png
cp $tmpPath/80 $assetPath/Icon-90.png
cp $tmpPath/50 $assetPath/Icon-50.png
cp $tmpPath/100 $assetPath/Icon-100.png
cp $tmpPath/72 $assetPath/Icon-72.png
cp $tmpPath/144 $assetPath/Icon-144.png
cp $tmpPath/76 $assetPath/Icon-76.png
cp $tmpPath/76 $assetPath/Icon-77.png
cp $tmpPath/152 $assetPath/Icon-152.png
cp $tmpPath/152 $assetPath/Icon-153.png
cp $tmpPath/167 $assetPath/Icon-169.png
cp $tmpPath/167 $assetPath/Icon-167.png
cp $tmpPath/1024 $assetPath/Icon-1024.png

if [ ! -z "$original_file_rtl" ]; then
	cp $tmpPathRtl/40 $assetPath/Icon-42.png
	cp $tmpPathRtl/60 $assetPath/Icon-82.png
	cp $tmpPathRtl/29 $assetPath/Icon-33.png
	cp $tmpPathRtl/58 $assetPath/Icon-60.png
	cp $tmpPathRtl/87 $assetPath/Icon-89.png
	cp $tmpPathRtl/80 $assetPath/Icon-85.png
	cp $tmpPathRtl/120 $assetPath/Icon-122.png
	cp $tmpPathRtl/57 $assetPath/Icon-64.png
	cp $tmpPathRtl/114 $assetPath/Icon-115.png
	cp $tmpPathRtl/120 $assetPath/Icon-125.png
	cp $tmpPathRtl/180 $assetPath/Icon-182.png
	cp $tmpPathRtl/20 $assetPath/Icon-18.png
	cp $tmpPathRtl/40 $assetPath/Icon-45.png
	cp $tmpPathRtl/29 $assetPath/Icon-31.png
	cp $tmpPathRtl/58 $assetPath/Icon-63.png
	cp $tmpPathRtl/40 $assetPath/Icon-48.png
	cp $tmpPathRtl/80 $assetPath/Icon-91.png
	cp $tmpPathRtl/50 $assetPath/Icon-51.png
	cp $tmpPathRtl/100 $assetPath/Icon-101.png
	cp $tmpPathRtl/72 $assetPath/Icon-73.png
	cp $tmpPathRtl/144 $assetPath/Icon-145.png
	cp $tmpPathRtl/76 $assetPath/Icon-78.png
	cp $tmpPathRtl/152 $assetPath/Icon-154.png
	cp $tmpPathRtl/167 $assetPath/Icon-168.png
else
	cp $tmpPath/40 $assetPath/Icon-42.png
	cp $tmpPath/60 $assetPath/Icon-82.png
	cp $tmpPath/29 $assetPath/Icon-33.png
	cp $tmpPath/58 $assetPath/Icon-60.png
	cp $tmpPath/87 $assetPath/Icon-89.png
	cp $tmpPath/80 $assetPath/Icon-85.png
	cp $tmpPath/120 $assetPath/Icon-122.png
	cp $tmpPath/57 $assetPath/Icon-64.png
	cp $tmpPath/114 $assetPath/Icon-115.png
	cp $tmpPath/120 $assetPath/Icon-125.png
	cp $tmpPath/180 $assetPath/Icon-182.png
	cp $tmpPath/20 $assetPath/Icon-18.png
	cp $tmpPath/40 $assetPath/Icon-45.png
	cp $tmpPath/29 $assetPath/Icon-31.png
	cp $tmpPath/58 $assetPath/Icon-63.png
	cp $tmpPath/40 $assetPath/Icon-48.png
	cp $tmpPath/80 $assetPath/Icon-91.png
	cp $tmpPath/50 $assetPath/Icon-51.png
	cp $tmpPath/100 $assetPath/Icon-101.png
	cp $tmpPath/72 $assetPath/Icon-73.png
	cp $tmpPath/144 $assetPath/Icon-145.png
	cp $tmpPath/76 $assetPath/Icon-78.png
	cp $tmpPath/152 $assetPath/Icon-154.png
	cp $tmpPath/167 $assetPath/Icon-168.png
fi

rm -rf $tmpPath
rm -rf $tmpPathRtl

cat << EOF > $jsonContentsPath
{
  "images" : [
    {
      "size" : "20x20",
      "idiom" : "iphone",
      "filename" : "Icon-40.png",
      "scale" : "2x"
    },
    {
      "size" : "20x20",
      "idiom" : "iphone",
      "filename" : "Icon-41.png",
      "language-direction" : "left-to-right",
      "scale" : "2x"
    },
    {
      "size" : "20x20",
      "idiom" : "iphone",
      "filename" : "Icon-42.png",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "size" : "20x20",
      "idiom" : "iphone",
      "filename" : "Icon-80.png",
      "scale" : "3x"
    },
    {
      "size" : "20x20",
      "idiom" : "iphone",
      "filename" : "Icon-81.png",
      "language-direction" : "left-to-right",
      "scale" : "3x"
    },
    {
      "size" : "20x20",
      "idiom" : "iphone",
      "filename" : "Icon-82.png",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-32.png",
      "language-direction" : "left-to-right",
      "scale" : "1x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-33.png",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-58.png",
      "scale" : "2x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-59.png",
      "language-direction" : "left-to-right",
      "scale" : "2x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-60.png",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-87.png",
      "scale" : "3x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-88.png",
      "language-direction" : "left-to-right",
      "scale" : "3x"
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "Icon-89.png",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "Icon-83.png",
      "scale" : "2x"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "Icon-84.png",
      "language-direction" : "left-to-right",
      "scale" : "2x"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "Icon-85.png",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "Icon-120.png",
      "scale" : "3x"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "Icon-121.png",
      "language-direction" : "left-to-right",
      "scale" : "3x"
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "Icon-122.png",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "size" : "57x57",
      "idiom" : "iphone",
      "filename" : "Icon-57.png",
      "language-direction" : "left-to-right",
      "scale" : "1x"
    },
    {
      "size" : "57x57",
      "idiom" : "iphone",
      "filename" : "Icon-64.png",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "size" : "57x57",
      "idiom" : "iphone",
      "filename" : "Icon-114.png",
      "language-direction" : "left-to-right",
      "scale" : "2x"
    },
    {
      "size" : "57x57",
      "idiom" : "iphone",
      "filename" : "Icon-115.png",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "Icon-123.png",
      "scale" : "2x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "Icon-124.png",
      "language-direction" : "left-to-right",
      "scale" : "2x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "Icon-125.png",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "Icon-180.png",
      "scale" : "3x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "Icon-181.png",
      "language-direction" : "left-to-right",
      "scale" : "3x"
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "Icon-182.png",
      "language-direction" : "right-to-left",
      "scale" : "3x"
    },
    {
      "size" : "20x20",
      "idiom" : "ipad",
      "filename" : "Icon-16.png",
      "scale" : "1x"
    },
    {
      "size" : "20x20",
      "idiom" : "ipad",
      "filename" : "Icon-17.png",
      "language-direction" : "left-to-right",
      "scale" : "1x"
    },
    {
      "size" : "20x20",
      "idiom" : "ipad",
      "filename" : "Icon-18.png",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "size" : "20x20",
      "idiom" : "ipad",
      "filename" : "Icon-43.png",
      "scale" : "2x"
    },
    {
      "size" : "20x20",
      "idiom" : "ipad",
      "filename" : "Icon-44.png",
      "language-direction" : "left-to-right",
      "scale" : "2x"
    },
    {
      "size" : "20x20",
      "idiom" : "ipad",
      "filename" : "Icon-45.png",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "Icon-29.png",
      "scale" : "1x"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "Icon-30.png",
      "language-direction" : "left-to-right",
      "scale" : "1x"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "Icon-31.png",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "Icon-61.png",
      "scale" : "2x"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "Icon-62.png",
      "language-direction" : "left-to-right",
      "scale" : "2x"
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "Icon-63.png",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "Icon-46.png",
      "scale" : "1x"
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "Icon-47.png",
      "language-direction" : "left-to-right",
      "scale" : "1x"
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "Icon-48.png",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "Icon-86.png",
      "scale" : "2x"
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "Icon-90.png",
      "language-direction" : "left-to-right",
      "scale" : "2x"
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "Icon-91.png",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "size" : "50x50",
      "idiom" : "ipad",
      "filename" : "Icon-50.png",
      "language-direction" : "left-to-right",
      "scale" : "1x"
    },
    {
      "size" : "50x50",
      "idiom" : "ipad",
      "filename" : "Icon-51.png",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "size" : "50x50",
      "idiom" : "ipad",
      "filename" : "Icon-100.png",
      "language-direction" : "left-to-right",
      "scale" : "2x"
    },
    {
      "size" : "50x50",
      "idiom" : "ipad",
      "filename" : "Icon-101.png",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "size" : "72x72",
      "idiom" : "ipad",
      "filename" : "Icon-72.png",
      "language-direction" : "left-to-right",
      "scale" : "1x"
    },
    {
      "size" : "72x72",
      "idiom" : "ipad",
      "filename" : "Icon-73.png",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "size" : "72x72",
      "idiom" : "ipad",
      "filename" : "Icon-144.png",
      "language-direction" : "left-to-right",
      "scale" : "2x"
    },
    {
      "size" : "72x72",
      "idiom" : "ipad",
      "filename" : "Icon-145.png",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "Icon-76.png",
      "scale" : "1x"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "Icon-77.png",
      "language-direction" : "left-to-right",
      "scale" : "1x"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "Icon-78.png",
      "language-direction" : "right-to-left",
      "scale" : "1x"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "Icon-152.png",
      "scale" : "2x"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "Icon-153.png",
      "language-direction" : "left-to-right",
      "scale" : "2x"
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "Icon-154.png",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "size" : "83.5x83.5",
      "idiom" : "ipad",
      "filename" : "Icon-169.png",
      "scale" : "2x"
    },
    {
      "size" : "83.5x83.5",
      "idiom" : "ipad",
      "filename" : "Icon-167.png",
      "language-direction" : "left-to-right",
      "scale" : "2x"
    },
    {
      "size" : "83.5x83.5",
      "idiom" : "ipad",
      "filename" : "Icon-168.png",
      "language-direction" : "right-to-left",
      "scale" : "2x"
    },
    {
      "size" : "1024x1024",
      "idiom" : "ios-marketing",
      "filename" : "Icon-1024.png",
      "scale" : "1x"
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode"
  }
}
EOF