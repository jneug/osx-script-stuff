(*
	Adds a new task to Things. (For use with Alfredapp: alfredapp.com and Arimail: airmail.com)
*)
property TODO_TAGS : "Import,Mail"
property ADD_CONTACT : true
property TASK_PREFIX : "Act on: "

on alfred_script(q)
	tell application "Mail"
		set theMail to first item of (get selection)
		set theSubject to subject of theMail
		set theMessage to "message://<" & (message id of theMail as rich text) & ">"
		set theSender to sender of theMail
	end tell
	
	(*if ADD_CONTACT then
		tell application "Contacts"
			set theNames to name of (people whose value of emails contains theSender)
			if (count theNames) is 0 then
				set theSender to null
			else
				set theSender to first item of theNames
			end if
		end tell
	else
		set theSender to null
	end if*)
	
	tell application "Things"
		set theTodo to make new to do with properties {name:TASK_PREFIX & theSubject, notes:theMessage & return, status:open, tag names:TODO_TAGS} at end of list "Inbox"
		
		(*if theSender is not null then
			set theContact to add contact named theSender
			move theTodo to theContact
		end if*)
	end tell
	
	return TASK_PREFIX & theSubject
end alfred_script