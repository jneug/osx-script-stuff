(*
	Exports a mail to the DOWNLOADS folder.
*)
property DOWNLOADS : "/Volumes/Hyrrokkin/Downloads"
property TRASH_AFTER : false


using terms from application "Mail"
	on perform mail action with messages theMails for rule theRule
		tell application "Mail"
			repeat with aMail in theMails
				set theSource to source of aMail
				
				try
					set theFilename to DOWNLOADS & "/" & subject of aMail & ".eml"
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