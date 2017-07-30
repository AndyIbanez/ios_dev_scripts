# Description

This script takes a SVG image (I tend to download them from [www.iconapp.io](http://www.iconapp.io/)) and generates all 1x, 2x, and 3x sizes of the image in PNG format. You pass in the base size in points and the script generates all three sizes based on it. You can also pass the hexadecimal color code to use in your images.

Use this to resize images for `UITabBarItem`s, `UIBarButtonItem`s, and others.

# Requirements for macOS.

You can install the requirements with [Homebrew](https://brew.sh).

1. Xquartz: `brew cask install xquartz`
2. Inkscape: `brew cask install inkscape`

If you don't have both, you can install them both with one line:

`brew cask install xquartz && brew cask install inkscape`

NOTE: You may need to add the Inkscape path to your `$PATH`. This was not needed for me on macOS Sierra 10.12.3.

# Usage

Save the script somewhere, `chmod +x` it, and add it as an alias on your `.bash_profile` file (`vim .bash_profile`):

`alias svg2apng="/Users/andyibanez/Dropbox/Documents/Scripts/svg@apng/script.sh"`

And reload your `.bash_profile`:

`source ~/.bash_profile`

In order to use this script, **the svg must be colored in black (#000000)**. Additionally, the SVG should be squared with the dimensions in width and height. To use it, call the function:

`svg2apng ICON_COLOR ICON_BASE_SIZE INPUT_FILE OUTPUT_FILE_NAME OUTPUT_FILE_DIR`

Where the parameters:

**ICON_COLOR**: Hexadecimal color of the icon. It should not contain the leading "#". For example, 000fff.
**ICON_BASE_SIZE**: The smallest size the icon can be. This is equivalent to the size of an icon in a non-retina display. The script will automatically generate all three required sizes for you. For example, 90.
**INPUT_FILE**: The `.svg` file that will be converted to PNG. For example, icon-2.svg.
**OUTPUT_FILE_NAME**: The name of the output files. It **should not** have an extension, as the script will add it and it will ensure that the file name does not collide with the other generated files. For example, dog.
**OUTPUT_FILE_DIR**: The directory where the generated files will be placed. Should not have a "/" at the end. For example, `~/Desktop`.

#### Full Example

`svg2apng 000fff 90 icon-2.svg dog ~/Desktop`
