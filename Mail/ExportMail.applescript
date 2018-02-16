(*
name:           Export mail as text to a folder
apps:           Mail
description:    Use as a script in Mail.app rules to export the mail as a text file 
				to the selected folder.
parameters:
    DOWNLOADS:      Folder to save attachments to
    TRASH_AFTER:    Set to true to trash the mail after saving the attachments
  NO_SUBJECT:	Used if the mails subject is empty
compile:        false
*)
property DOWNLOADS : "~/Downloads"
property TRASH_AFTER : false
property NO_SUBJECT : "(no subject)"

using terms from application "Mail"
	on perform mail action with messages theMails for rule theRule
		tell application "Mail"
			repeat with aMail in theMails
				set theSource to source of aMail
				
				set theSubject to subject of aMail
				if theSubject is equal to "" then
					set theSubject to NO_SUBJECT
				else
					set theSubject to my escape(theSubject)
				end if
				
				try
					set theFilename to DOWNLOADS & "/" & theSubject & ".eml"
					do shell script "touch \"" & theFilename & "\""
					
					set theFile to open for access theFilename with write permission
					write theSource to theFile
					close access theFile
					
					if TRASH_AFTER then delete aMail
				on error
					do shell script "rm -f \"" & theFilename & "\""
				end try
			end repeat
		end tell
	end perform mail action with messages
end using terms from

on escape(t)
	set {tid, text item delimiters} to {text item delimiters, "/"}
	set t to text items of t
	set text item delimiters to "-"
	set t to t as text
	set text item delimiters to tid
	return t
end escape