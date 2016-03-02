(*
description: >
                Adds a new task to Things. (For use with Alfredapp:
                alfredapp.com and Arimail: airmail.com)

name:           Add new task from selected mail to 2Do
apps:           2Do,Mail
description: >
                Creates a new task in 2Dos default list with a link to the selected
                message in Mail.
parameters:
    TODO_TAGS:    "Tags for the newly created task, **default**: `\"Mail\"`"
    TASK_PREFIX:  "Prefix for the mail subject to use in the tasks title, **default**: `\"Read: \"`"
    INBOX_NAME:   "Name of the list to add the task to, **default**: `\"Inbox\"`"
compile:        true
*)
property TODO_TAGS : "Mail"
property TASK_PREFIX : "Lesen: "
property INBOX_NAME : "Eingang"

on alfred_script(q)
	tell application "Mail"
		set theMail to first item of (get selection)
		set theSubject to subject of theMail
		set theMessage to "message://<" & (message id of theMail as rich text) & ">"
		set theSender to sender of theMail
		set theContent to content of theMail
	end tell

	tell application "Safari"
		set theURL to "twodo://x-callback-url/add?task=" & TASK_PREFIX & theSubject & "&action=url:" & theMessage & "&note=" & theContent & "&tags=" & TODO_TAGS
		open location theURL
		-- delay 1
		close current tab of window 1
	end tell

	return theURL
end alfred_script
