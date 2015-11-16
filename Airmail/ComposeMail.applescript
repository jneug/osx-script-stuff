(*
name:           Compose mail
apps:           Airmail 2
description:    Quickly compose an email in Airmail 2
parameters:
    SUBJ:           Subject line
    SENDR:          Sending account to use
    RECEIPIENTS:    List of recipient mails
    CC:             List of cc mails
    BCC:            List of bcc mails
    TESNIP:         Abbreviation of a TextExpander snippet to use as content
compile:        false
*)

property SUBJ : ""
property SENDR : ""
property RECEIPIENTS : {""}
property CC : {""}
property BCC : {""}
property TESNIP : ""


tell application "Airmail 2"
	set newMail to make new outgoing message with properties {subject:SUBJ, sender:SENDR}
	repeat with R in RECEIPIENTS
		make new to recipient at end of newMail's to recipients with properties {name:"", address:R}
	end repeat
	repeat with C in CC
		make new cc recipient at end of newMail's cc recipients with properties {name:"", address:C}
	end repeat
	repeat with B in BCC
		make new bcc recipient at end of newMail's bcc recipients with properties {name:"", address:B}
	end repeat

	compose newMail
	activate

	if TESNIP is not "" then
		delay 1
		tell application "TextExpander" to expand abbreviation TESNIP
	end if
end tell
