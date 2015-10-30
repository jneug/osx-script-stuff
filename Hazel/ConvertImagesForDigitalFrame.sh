# Resize image to picture frame size with ImageMagick
convert $1'[800x600]' $1
# Shrink filesize with jhead and ImageOptim
jhead -ft "$1"
/Applications/ImageOptim.app/Contents/MacOS/ImageOptim "$1"
# Randomize filename with a 8 character long string
RAND=$(date +%s | sha256sum | base64 | head -c 8)
mv "$1" "$RAND.${1##*.}"
