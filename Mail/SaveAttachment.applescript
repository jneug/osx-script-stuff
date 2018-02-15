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
property DOWNLOADS : "~/Downloads"
property TRASH_AFTER : false

using terms from application "Mail"
	on perform mail action with messages theMessages for rule theRule
		tell application "Mail"
			repeat with theMessage in theMessages
				repeat with theAttachment in mail attachments of theMessage
					try
						set theFile to DOWNLOADS & "/" & (name of theAttachment)
						tell theAttachment to save in theFile
					end try
				end repeat
				
				if TRASH_AFTER then delete aMail
			end repeat
		end tell
	end perform mail action with messages
end using terms from