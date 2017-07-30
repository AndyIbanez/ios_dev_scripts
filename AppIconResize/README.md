# Description

Small script to generate all app icon sizes for iOS app icons based on a source 1024x1024.

This script is an old version of png2asset, and it's just being published for completion sake. It doesn't generate all sizes and doesn't support icons for different orientation languages.

# Requirements

You need to have `ImageMagic` for this script to work. You can install it with [Homebrew](https://brew.sh).

```
brew cask install imagemagick
```

# Usage

Save the script somewhere safe, `chmod +x` it, and add it as an alias on your `.bash_profile` file (`vim .bash_profile`), add at the end:

`alias air="/Users/andyibanez/Dropbox/Documents/Scripts/AppIconResize/script.sh"`

And reload your `.bash_profile`:

`source ~/.bash_profile`

In order to use this script, the source PNG file **should** be 1024x1024 or bigger. Giving it a smaller image will cause obvious distortions to the image.

To use it, call this function:

`air ORIGINAL_FILE OUTPUT_DIRECTORY`

Where the parameters:

**ORIGINAL_FILE**: File to the original PNG you want to resize. For example, `/Users/Eve/Desktop/App.png`. It also accepts relative paths with `~` and `.`.
**OUTPUT_DIRECTORY**: Directory where all the icons will be output to. The directory should already exist. For example, `/Users/Eve/Desktop`, but you can pass it relative directories with `~` and `.` as well.

#### Full Example

`air appicon.png .`

# Sources
* [How to resize a PNG file from the command line?](https://unix.stackexchange.com/questions/139335/how-to-resize-a-png-file-from-the-command-line)
