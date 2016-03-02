(*
name:           Set Caffeine state
apps:           Caffeine, Alfred
description: >
                Use as Alfred action to activate/deactivate
                Caffein or toggle the state. Pass 'activate',
                'deactivate' or 'toggle' to the action.
parameters:
compile:        false
*)
on alfred_script(q)
	if q is not in {"toggle", "deactivate", "activate"} then
		set q to "toggle"
	end if

	tell application "Caffeine"
		set status to "not been changed."
		if active and q is in {"toggle", "deactivate"} then
			turn off
			set status to "been deactivated."
		else if not active and q is in {"toggle", "activate"} then
			turn on
			set status to "been activated."
		end if

		set output to "Caffeine has " & status

		return output
	end tell
end alfred_script
