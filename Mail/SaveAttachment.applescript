(*
name:           Save attachments
apps:           Mail
description:    Use as a script in Mail.app rules to save attachments to the selected folder.
parameters:
    DOWNLOADS:      Folder to save attachments to
    TRASH_AFTER:    Set to true to trash the mail after saving the attachments
compile:        false
*)

(*
	Saves the mail attachments to DOWNLOADS.
*)
property DOWNLOADS : "/Volumes/Hyrrokkin/Downloads"
property TRASH_AFTER : false

using terms from application "Mail"
	on perform mail action with messages theMails for rule theRule
		tell application "Mail"
			repeat with aMail in theMails
				try
					set theStuff to every mail attachment of aMail
					repeat with aStuff in theStuff
						save aStuff in POSIX file (DOWNLOADS & "/" & name of aStuff)
					end repeat

					if TRASH_AFTER then delete aMail
				end try
			end repeat
		end tell
	end perform mail action with messages
end using terms from
