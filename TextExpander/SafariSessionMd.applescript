(*
name:           Create markdown list of current Safari session
apps:           TextExpander, Safari
description: |
                Creates a markdown document from the URLs currently open in
                Safaris frontmost window.

                ```
                # Safari links from 2016-02-02 10:01:02

                ## Tabs

                - [Quelltext der Seite Vorlage:OptionalProperty – Informatik-Box](http://informatik-box.de/index.php?title=Vorlage:OptionalProperty&action=edit)
                - [Kategorie:BibTeX Attribut – Informatik-Box](http://informatik-box.de/wiki/Kategorie:BibTeX_Attribut)
                - [Nicht kategorisierte Seiten – Informatik-Box](http://informatik-box.de/wiki/Spezial:Nicht_kategorisierte_Seiten)
                - [Nicht kategorisierte Vorlagen – Informatik-Box](http://informatik-box.de/wiki/Spezial:Nicht_kategorisierte_Vorlagen)
                - [InfoBox:Urheberrechte – Informatik-Box](http://informatik-box.de/wiki/InfoBox:Urheberrechte)
                - [Vorlage:Rating – Informatik-Box](http://informatik-box.de/wiki/Vorlage:Rating)
                - [Anmelden – Informatik-Box](http://informatik-box.de/index.php?title=Spezial:Anmelden&returnto=Spezial%3ABeobachtungsliste&returntoquery=&warning=watchlistanontext)
                - [Category:Developer documentation – semantic-mediawiki.org](https://www.semantic-mediawiki.org/wiki/Category:Developer_documentation)
                - [EduTech Wiki](http://edutechwiki.unige.ch/en/Main_Page)
                - [Extension:EditImage - MediaWiki](https://www.mediawiki.org/wiki/Extension:EditImage)
                ```
parameters:
    PINNED:     "number of pinned tabs to ignore, **default**: `4`"
compile:        false
*)
property PINNED : 4
property NL : "
"

tell application "Safari"
	--	set theURLs to URL of tabs of first window
	set theTabs to tabs of first window

	set theNote to "# Safari links from " & (current date) as text
	set theNote to theNote & NL & NL & "## Tabs" & NL

	set i to 0
	repeat with aTab in theTabs
		if i ≥ PINNED then
			try
				set aURL to URL of aTab
				set aTitle to name of aTab
				set theNote to theNote & NL & "- [" & aTitle & "](" & aURL & ")"
			end try
		end if

		set i to i + 1
	end repeat
	return theNote
end tell
