(*
	Adds a contact with the name q to the list of contacts in Things.
	If q is empty or the keyword "clean", all contacts without assigned tasks 
	are removed from Things.
*)
on alfred_script(q)
	if q is "clean" or q is "" then
		tell application "Things"
			set theContacts to contacts
			repeat with aContact in theContacts
				set theTodos to (every to do of aContact whose status is open)
				if (count of theTodos) is 0 then
					delete aContact
				end if
			end repeat
		end tell
		return "Contacts cleaned"
	else
		tell application "Things" to set newContact to add contact named q
		if newContact is missing value then
			return "Error: No contact named " & q & " found"
		else
			return "Contact " & q & " added"
		end if
	end if
end alfred_script