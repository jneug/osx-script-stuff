(*
name:           Randomize filenames
apps:           Finder
description: >
                Lets you choose a folder and randomizes the order
                of all files in it by renaming them with NAME_PREFIX
                and a number.
parameters:
    NAME_PREFIX:    "A prefix to append an increasing number to, **default**: `'photo-'`"
    NUMBER_PADDING: "By how many zeros should the number be padded, **default**: `4`"
    TYPES:          "A list of file extensions (without the dot) to randomize, **default**: `{'jpg', 'jpeg', 'png'}`"
compile:        true
*)
property NAME_PREFIX : "photo-"
property NUMBER_PADDING : 4
property TYPES : {"jpg", "jpeg", "png"}


-- get the folder to check
set f to choose folder

-- notice the use of "entire contents" to also go through subfolders of f
-- use a "whose" filter to find only the video files
tell application "Finder"
    set allFiles to (files of entire contents of f whose name extension is in TYPES) as alias list

    set theNo to 1
    repeat while allFiles is not {}
        set fileCount to the count of allFiles
        tell current application to set pick to random number from 1 to fileCount
        set theFile to item pick of allFiles -- as alias

        -- remove theFile from list
        if fileCount is 1 then
            set allFiles to {}
        else if pick is 1 then
            set allFiles to items 2 thru fileCount of allFiles
        else if pick is fileCount then
            set allFiles to items 1 thru (fileCount - 1) of allFiles
        else
            set allFiles to (items 1 thru (pick - 1) of allFiles) & (items (pick + 1) thru fileCount of allFiles)
        end if

        set fileNumber to "0000000000" & (fileCount as string)
        set fileNumber to characters ((length of fileNumber) - NUMBER_PADDING + 1) thru -1 of fileNumber as string

        -- rename theFile
        set the name of file theFile to (NAME_PREFIX & fileNumber) & "." & name extension of theFile
    end repeat
end tell
