(*
name:           Create HTML snippets
apps:           TextExpander
description: |
                Creates a set of snippets for common HTML tags.

                For each tag in TAGS_INLINE and TAGS_BLOCK the script will
                create two snippets, one with the cursor (`%|`) and one with the
                clipboard (`%clipboard`) between the opening and closing tags.
                For the `TAGS_EMPTY` empty tags (e.g. `<hr/>`) are created.

                As abbreviations the first `PREFIX_LENGTH` chars of the tag name
                are used.

                E.g. for the inline/block tags `em`/`blockquote` with default
                settings the following snippets will be created:

                ```
                ,em		<em>%|</em>
                ;em		<em>%clipboard</em>
                ,block	<blockquote>
                		%|
                		</blockquote>
                ;block	<blockquote>
                		%clipboard
                		</blockquote>
                ```
parameters:
    GROUP_NAME:     "name of group the snippets will be created in, **default**: `'HTML'`"
    PREFIX_LENGTH:  "number of chars to take from the tag name for the abbreviation, **default**: `5`"
    PREFIX_CHARS:   "snippet prefixes to use, **default**: `[',', ';', ',/']`\n
                    \t\t- the first list item places the cursor (`%|`) between the tags\n
                    \t\t- the second list item places the cursor (`%clipboard`) between the tags\n
                    \t\t- the third is used for empty blocks (e.g. `<hr/>`)"
    TAGS_INLINE:    "inline tags to create snippets for, **default**: `['del', 'code', 'strong', 'em']`"
    TAGS_BLOCK:     "block level tags to create snippets for, **default**: `['pre', 'blockquote']`"
    TAGS_EMPTY:     "empty tags to create snippets for, **default**: `['br', 'hr']`"
compile:        false
*)

-- name of group the snippets will be created in
property GROUP_NAME : "HTML"
-- number of chars to take from the tag name for the abbreviation
property PREFIX_LENGTH : 5
-- snippet prefixes to use
-- the first list item places the cursor (%|) between the tags-- the second list item places the cursor (%clipboard) between the tags-- the third is used for empty blocks (e.g. "<hr/>")property PREFIX_CHARS : [",", ";", ",/"]-- inline tags to create snippets forproperty TAGS_INLINE : ["del", "code", "strong", "em"]-- block level tags to create snippets forproperty TAGS_BLOCK : ["pre", "blockquote"]-- empty tags to create snippets forproperty TAGS_EMPTY : ["br", "hr"]tell application "TextExpander"	try		set theGroup to group GROUP_NAME	on error		set theGroup to make new group with properties {name:GROUP_NAME}	end try	set noClipChar to first item of PREFIX_CHARS	set clipChar to second item of PREFIX_CHARS	set emptyChar to last item of PREFIX_CHARS	set cnt to 0	tell theGroup		-- create inline tags		repeat with tag in TAGS_INLINE			-- create abbreviation			set charCount to length of tag			if charCount < PREFIX_LENGTH then				set abbrev to rich text 1 through charCount of tag			else				set abbrev to rich text 1 through PREFIX_LENGTH of tag			end if			-- create snippet text			set snipNoClip to "<" & tag & ">%|</" & tag & ">"			set snipClip to "<" & tag & ">%clipboard</" & tag & ">"			-- create the snippets if there is none with this abbreviation			if (not (count of (every snippet whose abbreviation is noClipChar & abbrev)) is greater than 0) then				make new snippet with properties {abbreviation:noClipChar & abbrev, plain text expansion:snipNoClip, content type:plain_text, abbreviation mode:match case, label:"AS Tag: " & noClipChar & abbrev}				set cnt to cnt + 1			end if			if (not (count of (every snippet whose abbreviation is clipChar & abbrev)) is greater than 0) then				make new snippet with properties {abbreviation:clipChar & abbrev, plain text expansion:snipClip, content type:plain_text, abbreviation mode:match case, label:"AS Tag: " & clipChar & abbrev}				set cnt to cnt + 1			end if		end repeat		-- create block level tags		repeat with tag in TAGS_BLOCK			-- create abbreviation			set charCount to length of tag			if charCount < PREFIX_LENGTH then				set abbrev to rich text 1 through charCount of tag			else				set abbrev to rich text 1 through PREFIX_LENGTH of tag			end if			-- create snippet text			set snipNoClip to "<" & tag & ">" & return & "%|" & return & "</" & tag & ">"			set snipClip to "<" & tag & ">" & return & "%clipboard" & return & "</" & tag & ">"			-- create the snippets if there is none with this abbreviation			if (not (count of (every snippet whose abbreviation is noClipChar & abbrev)) is greater than 0) then				make new snippet with properties {abbreviation:noClipChar & abbrev, plain text expansion:snipNoClip, content type:plain_text, abbreviation mode:match case, label:"AS Tag: " & noClipChar & abbrev}				set cnt to cnt + 1			end if			if (not (count of (every snippet whose abbreviation is clipChar & abbrev)) is greater than 0) then				make new snippet with properties {abbreviation:clipChar & abbrev, plain text expansion:snipClip, content type:plain_text, abbreviation mode:match case, label:"AS Tag: " & clipChar & abbrev}				set cnt to cnt + 1			end if		end repeat		-- create emtpy tags		repeat with tag in TAGS_EMPTY			-- create abbreviation			set charCount to length of tag			if charCount < PREFIX_LENGTH then				set abbrev to rich text 1 through charCount of tag			else				set abbrev to rich text 1 through PREFIX_LENGTH of tag			end if			-- create snippet text			set snip to "<" & tag & "/>"			-- create the snippets if there is none with this abbreviation			if (not (count of (every snippet whose abbreviation is emptyChar & abbrev)) is greater than 0) then				make new snippet with properties {abbreviation:emptyChar & abbrev, plain text expansion:snip, content type:plain_text, abbreviation mode:match case, label:"AS Tag: " & emptyChar & abbrev}				set cnt to cnt + 1			end if		end repeat		display notification (cnt & " HTML snippets created in group " & GROUP_NAME as rich text) with title "CreateHTMLSnippets"	end tellend tell