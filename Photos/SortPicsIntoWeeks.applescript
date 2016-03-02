(*
name:           Group pictures by week
apps:           Photos
description: >
                Sorts pics from a particular album into weekly albums relative
                to a target date based on the image date.

                The script will sort every media item from `SOURCE_ALBUM` album
                into child albums of the TARGET_FOLDER by calculating how many
                weeks after `TARGET_DATE` it was taken.

                The resulting folder structure will be:

                ```
                TARGET_FOLDER
                    ZERO_ALBUM
                    WEEKLY_PREFIX 1
                    WEEKLY_PREFIX 2
                    WEEKLY_PREFIX 3
                    ...
                ```
parameters:
    TARGET_DATE:    "Set to the target date."
    SOURCE_ALBUM:   "Set to the album with the unsorted pics. If it is a subfolder use a path like string."
    TARGET_FOLDER:  "Set to the target folder for the weekly albums. This folder will be the parent of the weekly albums."
    ZERO_ALBUM:     "Set to the album for pictures without a date or with a date before the target date."
    WEEKLY_PREFIX:  "Set to a prefix for the weekly albums."
    DISPLAY_DIALOG: "Set to true to display a summary dialog after everything is sorted."
compile:        false
*)

-- Set to the target date
property TARGET_DATE : date "Dienstag, 22. Juli 2014 um 02:06:00"
-- Set to the album with the unsorted pics. If it is a subfolder use a path like string.
property SOURCE_ALBUM : "#Unsortiert/Linus Neu"
-- Set to the target folder for the weekly albums. This folder will be the parent of the weekly albums.
property TARGET_FOLDER : "Growing-Up/Linus"
-- Set to the album for pictures without a date or with a date before the target date
property ZERO_ALBUM : "Woche 0"
-- Set to a prefix for the weekly albums
property WEEKLY_PREFIX : "Woche "


property DISPLAY_DIALOG : true


-- Do some startup stuff
display notification "AppleScript is busy. This might take a while." with title "SortPicsIntoWeeks" subtitle "Sorting images ..."

-- Get relevant folders
set theSrcAlbum to getAlbum(SOURCE_ALBUM)
set theTargetFolder to getAlbum(TARGET_FOLDER)
set theZeroAlbum to getAlbum(TARGET_FOLDER & "/" & ZERO_ALBUM)

tell application "Photos"
	-- Get all images
	set allMedia to media items of theSrcAlbum

	if length of allMedia is 0 then
		display notification "Source folder is empty. No pictures to sort." with title "SortPicsIntoWeeks"
		return
	end if

	-- Sort media into folders
	set n to 0
	set f to 0
	repeat with aMedium in allMedia
		-- Get media date
		set mDate to date of aMedium

		if TARGET_DATE < mDate then
			-- Get week realtive to BIRTHDAY
			set weekNo to (mDate - TARGET_DATE) div (7 * days) + 1
			set weekName to WEEKLY_PREFIX & weekNo
			-- log "Sort medium into album " & weekName

			-- Get appropriate week album or create
			try
				tell theTargetFolder to set theWeekAlbum to container weekName
			on error
				set theWeekAlbum to make new album named weekName at theTargetFolder
			end try

			-- Add medium to album
			add {aMedium} to theWeekAlbum
			-- Remove from old album
			-- ?????

			log ("Sorted medium " & (filename of aMedium) & " to album " & (name of theWeekAlbum))
		else
			-- Move to Week 0
			add aMedium to theZeroAlbum
			log ("Sorted medium " & (filename of aMedium) & " to album " & (name of theZeroAlbum))
		end if
		set n to n + 1

	end repeat

	set msg to n & " pictures sorted." & return
	if f > 0 then set msg to msg & f & " pictures with errors!" & return
	set msg to msg & "The pictures can now be deleted from album " & quote & (name of theSrcAlbum) & quote & "."
	if DISPLAY_DIALOG then
		display dialog msg as text with title "SortPicsIntoWeeks"
	else
		display notification msg as text with title "SortPicsIntoWeeks"
	end if
end tell

on getAlbum(path)
	set {astid, AppleScript's text item delimiters} to {AppleScript's text item delimiters, "/"}
	set pathItems to every text item of path
	set AppleScript's text item delimiters to astid

	tell application "Photos"
		set c to container (first item of pathItems)
		set pathItems to rest of pathItems
		repeat with p in pathItems
			tell c to set c to container p
		end repeat
	end tell

	return c
end getAlbum
