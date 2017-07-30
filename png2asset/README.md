# Description

This script takes an original, unmodified 1024x1024 iOS app icon and generates an Xcode asset that can simply imported into an existing asset catalog.
Optionally, you can specify a right-to-left icon. If left blank, it will generate all assets based on the only provided icon (left-to-right).

# Requirements

You can install the requirements with [Homebrew](https://brew.sh).

1. ImageMagick: `brew cask install imagemagick`

# Usage

Save the script somewhere safe, `chmod +x` it, and add it as an alias on your `.bash_profile` file (`vim .bash_profile`), add at the end:

`alias png2asset="/Users/andyibanez/Dropbox/Documents/Scripts/png2asset/script.php"`

And reload your `.bash_profile`:

`source ~/.bash_profile`

To use this script, the source PNG fine should be 1024x1024.

To use it, call it as so:

`png2asset OUTPUT_DIR ASSET_NAME SOURCE_PNG [RIGHT_TO_LEFT_SOURCE]`

Where the parameters:

**OUTPUT_DIR**: Where the asset will be stored.
**ASSET_NAME**: Name of the asset that will be displayed on Xcode. Don't use spaces. You do not need to append the `.appiconset` to the name, the script will do it for you.
**SOURCE_PNG**: Original source image. This image will be used as the app icon when no language direction is specified and for left-to-right languages.
**RIGHT_TO_LEFT_SOURCE**: Optional parameter to specify a different icon for right-to-left languages. If omitted, RTL icons will have the same icon as `SOURCE_PNG`.

Example:

`png2asset . White_On_Pink v1_pink.png`

This will generate an icon set without using RTL icons.

`png2asset . test_asset test_icon.png test_icon_rtl.png`

This will generate an icon set using RTL icons.

When the script is done executing, a directory ending with `.appiconset` will appear in your specified `OUTPUT_DIR`. You can then simply drag it and drop it into your asset catalog in Xcode.
