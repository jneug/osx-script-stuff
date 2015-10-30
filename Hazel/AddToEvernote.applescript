set AppleScript's text item delimiters to ","
set theTags to do shell script "/usr/local/bin/tag -N " & (quoted form of POSIX path of theFile)
set theTags to theTags's text items

tell application "Evernote"
	--activate
	create note from file theFile tags theTags
	delay 2
end tell
