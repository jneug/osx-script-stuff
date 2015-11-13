(*
	Finds a snippet with the abbreviation ABRV in TextExpander

*)
-- abbreviation of the snippet
property ABRV : ",ipsum1"

tell application "TextExpander"
	set allSNIPs to (every snippet in every group whose abbreviation is ABRV)
	repeat with GRP in allSNIPs
		if (count of GRP) > 0 then set SNIP to rich text expansion of first item of GRP
	end repeat
end tell