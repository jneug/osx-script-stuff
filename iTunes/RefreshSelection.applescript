(*
name:           Reindex tags of selected songs in iTunes
apps:           iTunes
description: >
                Reindex the songs currently selected in iTunes. For easy
                use put into `~/Library/iTunes/Scripts/`.
parameters:
compile:        true
*)
tell application "iTunes"
	set aList to selection
	set numberOfItems to count of aList
	
	display notification "Refreshing " & numberOfItems & " items. This may take a while.." with title "iTunes refresh Selection"
	refresh selection
	display notification "Done refreshing " & numberOfItems & " items." with title "iTunes refresh Selection"
end tell
