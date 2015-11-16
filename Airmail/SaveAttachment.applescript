(*
name:           Save attachments
apps:           Airmail 2
description:    Use as a script in Airmail rules to save attachments to the selected folder.
parameters:
    DOWNLOADS:      Folder to save attachments to
compile:        false
*)
property DOWNLOADS : "~/Downloads"

on processMessage(theMessage)
	try
		tell application "Airmail 2"
			set theAttach to filename of first mail attachment of theMessage
			set thePDF to quoted form of POSIX path of theAttach
			do shell script "cp " & thePDF & " " & DOWNLOADS
		end tell
	end try
end processMessage
