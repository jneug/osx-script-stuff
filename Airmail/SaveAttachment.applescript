(*
name:           Save attachments
apps:            Airmail 3
description:    Use as a script in Airmail rules to save attachments to the selected folder.
parameters:
    DOWNLOADS:      Folder to save attachments to
compile:        false
*)
property DOWNLOADS : "~/Downloads"

on processMessage(theMessage)
	try
		tell application "Airmail 3"
			repeat with anAttach in mail attachments of theMessage
				set aFilename to filename of anAttach
				set aFile to quoted form of aFilename
				set fldr to quoted form of DOWNLOADS
				
				do shell script "cp " & (aFile as text) & " " & (fldr as text) & ""
			end repeat
		end tell
	end try
end processMessage
