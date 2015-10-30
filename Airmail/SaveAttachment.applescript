(*
	Use as a script in Airmail rules to save attachments to
	folder DOWNLOADS.
*)
property DOWNLOADS : "/Volumes/Hyrrokkin/Downloads"

on processMessage(theMessage)
	try
		tell application "Airmail 2"
			set theAttach to filename of first mail attachment of theMessage
			set thePDF to quoted form of POSIX path of theAttach
			do shell script "cp " & thePDF & " " & DOWNLOADS
		end tell
	end try
end processMessage