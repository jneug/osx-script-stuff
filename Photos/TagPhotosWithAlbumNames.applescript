-- tag items with album:albumname
tell application "Photos"
	set theAlbums to albums
	repeat with aAlbum in theAlbums
		--log "Tagging items in album " & (name of aAlbum as text)
		tell aAlbum
			set albumTag to "album:" & (name of aAlbum as text)
			set theItems to media items
			repeat with aItem in theItems
				set theKeywords to (keywords of aItem)
				if theKeywords is missing value then
					set keywords of aItem to albumTag
				else if theKeywords does not contain albumTag then
					set the end of theKeywords to albumTag
					set keywords of aItem to theKeywords
				end if
			end repeat
		end tell
	end repeat
end tell