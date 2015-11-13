-- Subject line
property SUBJ : ""
-- Sending account to use. Needs to be in the format "Name <Mail>" and
-- exactly match the name and mail in the account settings. Leave blank to
-- use the default account.
property SENDR : ""
-- Recipients (normal, cc and bcc) for the mail. Just enter mail adresses.
property RECEIPIENTS : {""}
property CC : {}
property BCC : {}
-- an optional TextExpander snippet to set as the content
property TESNIP : ""


tell application "Mail"
	set SNIP to ""
	if TESNIP is not "" then
		tell application "TextExpander"
			set allSNIPs to (every snippet in every group whose abbreviation is TESNIP)
			repeat with GRP in allSNIPs
				if (count of GRP) > 0 then set SNIP to rich text expansion of first item of GRP
			end repeat
		end tell
	end if
	
	set newMail to make new outgoing message with properties {subject:SUBJ, sender:SENDR, content:SNIP, visible:true}
	repeat with R in RECEIPIENTS
		make new to recipient at end of newMail's to recipients with properties {name:"", address:R}
	end repeat
	repeat with C in CC
		make new cc recipient at end of newMail's cc recipients with properties {name:"", address:C}
	end repeat
	repeat with B in BCC
		make new bcc recipient at end of newMail's bcc recipients with properties {name:"", address:B}
	end repeat
	
	activate
end tell