#!/bin/bash

FILE="$1"

# Get ID3 tags
IFS='
'
TAGS=($(/usr/local/bin/exiftool -s3 -f -Artist -Band -Album -Title -Track -PartOfSet -Compilation "$FILE"))

# Build new filename
TITLE=${TAGS[3]}
TRACK=${TAGS[4]/\/*/}
if [ "$TRACK" != "-" ] ; then
    # if number of cds is set, check if > 1
    if [[ ${TAGS[5]} == *"/"* ]] ; then
        TOTAL="${TAGS[5]/*\//}"
        if [ ${TOTAL} -gt 1 ] ; then
            TRACK="${TAGS[5]/\/*/}-$TRACK"
        fi
    fi
else
    TRACK=""
fi
NAME="$TRACK $TITLE.${FILE##*.}"

# Build new path
ARTIST="Unknown"
ALBUM="Unknown"
if [ ${TAGS[1]} != "-" ] ; then
    ARTIST=${TAGS[1]}
else
    if [ ${TAGS[6]} == "Yes" -o ${TAGS[6]} == "1" ] ; then
        ARTIST="Compilation"
    else
        if [ ${TAGS[0]} != "-" ] ; then
            ARTIST=${TAGS[0]}
        fi
    fi
fi
if [ ${TAGS[2]} != "-" ] ; then
    ALBUM=${TAGS[2]}
fi

FL=${ARTIST//[^A-Za-z0-9]/}
FL=${FL/#The/}
FL=${FL:0:1}
if [ -z $FL ] ; then
    FL="_"
fi

PATH="$(dirname $FILE)/$FL/$ARTIST/$ALBUM"
/bin/mkdir -p "$PATH"
/bin/mv -f "$FILE" "$PATH/$NAME"
