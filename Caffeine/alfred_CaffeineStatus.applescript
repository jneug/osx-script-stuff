(*
name:           Show Caffeine state
apps:           Caffeine, Alfred
description:    Use in Alfred script filter to show Ceffeins state (active or inactive).
parameters:
compile:        false
*)
set theState to "inactive."
tell application "Caffeine"
	if active is true then
		set theState to "active."
	end if
end tell

"<?xml version=\"1.0\"?><items><item uid=\"caffeine_state\"><title>Toggle Caffeine</title><subtitle>Caffeine is "&theState&"</subtitle><icon></icon></item></items>" & ""
