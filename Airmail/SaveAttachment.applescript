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
			repeat with anAttach in mail attachment of theMessage
				set aFilename to filename of anAttach
				set aFile to quoted form of POSIX path of aFilename
				do shell script "cp " & aFile & " " & DOWNLOADS
			end repeat
		end tell
	end try
end processMessage
