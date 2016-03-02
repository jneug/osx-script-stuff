(*
name:           Create parentheses snippets
apps:           TextExpander
description: |
                Creates a set of snippets for enclosing parentheses.

                For each pair of parentheses the script will create two snippets, one with
                the cursor (`%|`) and one with the clipboard (`%clipboard)` between the
                parentheses. Both snippets will be created `MAX_REPEAT` times, by repeating
                the opening and closing parentheses one to `MAX_REPEAT` times.

                E.g. for the pair `[`,`]` with default settings the following snippets will be created:

                ```
                ,[         [%|]
                ;[         [%clipboard]
                ,2[        [[%|]]
                ;2[        [[%clipboard]]
                ,3[        [[[%|]]]
                ;3[        [[[%clipboard]]]
                ```
parameters:
    GROUP_NAME:     "name of group the snippets will be created in, **default**: `'Parentheses'`"
    MAX_REPEAT:     "maximum depth for snippets, **default**: `3`"
    PREFIX_CHARS:   "snippet prefixes to use, **default**: `[',', ';']`\n
                    \t\t- the first list item places the cursor (`%|`) between the tags\n
                    \t\t- the second list item places the cursor (`%clipboard`) between the tags"
    PAIRS:          "parenthesis pairs, each item is a list with two items: the
                    opening and closing parenthesis

                    **default**:

                    ```
                    {[\x22\x27\x22, \x22\x27\x22], [\x22\x5c\x22\x22, \x22\x5c\x22\x22], [\x22\x60\x22, \x22\x60\x22],
                        [\x22(\x22, \x22)\x22], [\x22[\x22, \x22]\x22], [\x22{\x22, \x22}\x22], [\x22_\x22, \x22_\x22],
                        [\x22-\x22, \x22-\x22], [\x22~\x22, \x22~\x22], [\x22*\x22, \x22*\x22], [\x22<\x22, \x22>\x22],
                        [\x22=\x22, \x22=\x22]}
                    ```"
compile:        false
*)

-- name of group the snippets will be created in
property GROUP_NAME : "Parentheses"
-- maximum depth for snippets
property MAX_REPEAT : 3
-- snippet prefixes to use-- the first list item places the cursor (%|) between the parentheses-- the second list item places the cursor (%clipboard) between the parenthesesproperty PREFIX_CHARS : [",", ";"]-- parenthesis pairs, each item is a list with two items: the opening and closing parenthesis
property PAIRS : {["'", "'"], ["\"", "\""], ["`", "`"], ["(", ")"], ["[", "]"], ["{", "}"], ["_", "_"], ["-", "-"], ["~", "~"], ["*", "*"], ["<", ">"], ["=", "="]}
tell application "TextExpander"    try
        set theGroup to group GROUP_NAME
    on error
        set theGroup to make new group with properties {name:GROUP_NAME}
    end try

    set noClipChar to first item of PREFIX_CHARS
    set clipChar to last item of PREFIX_CHARS

    set cnt to 0

    tell theGroup
        repeat with i from 1 to MAX_REPEAT
            repeat with pair in PAIRS
                set openChar to first item of pair
                set closeChar to last item of pair

                -- add number to abbreviation
                if i > 1 then
                    set abbrevNoClip to noClipChar & i & openChar
                    set abbrevClip to clipChar & i & openChar
                else
                    set abbrevNoClip to noClipChar & openChar
                    set abbrevClip to clipChar & openChar
                end if

                -- make snippet text
                set snipNoClip to "%|"
                set snipClip to "%clipboard"
                repeat i times
                    set snipNoClip to openChar & snipNoClip & closeChar
                    set snipClip to openChar & snipClip & closeChar
                end repeat

                -- create the snippets if there is none with this abbreviation
                if (not (count of (every snippet whose abbreviation is abbrevNoClip)) is greater than 0) then
                    make new snippet with properties {abbreviation:abbrevNoClip, plain text expansion:snipNoClip, content type:plain_text, abbreviation mode:match case}
                    set cnt to cnt + 1
                end if
                if (not (count of (every snippet whose abbreviation is abbrevClip)) is greater than 0) then
                    make new snippet with properties {abbreviation:abbrevClip, plain text expansion:snipClip, content type:plain_text, abbreviation mode:match case}
                    set cnt to cnt + 1
                end if
            end repeat
        end repeat

        display notification (cnt & " parentheses snippets created in group " & GROUP_NAME as rich text) with title "CreateParenthesesSnippets"
    end tell
end tell
