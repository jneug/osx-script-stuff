property TARGET : "/Volumes/Hyrrokkin/Uploads/Photorahmen"


tell application "Photos"
	set favs to every media item in favorites album
	export favs to POSIX file TARGET
end tell