(*
	Adds a new task to Things. (For use with Alfredapp: alfredapp.com and Arimail: airmail.com)
*)
property TODO_TAGS : "Mail"
property TASK_PREFIX : "Act on: "

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

    return TASK_PREFIX & theSubject
end alfred_script
