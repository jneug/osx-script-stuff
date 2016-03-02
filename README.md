# osx-script-stuff

A collection of scripts to automate stuff on Max OS X systems.


## Table of contents

1. [Scripts](#scripts)
	- [Add new task from selected mail to 2Do](#add-new-task-from-selected-mail-to-2do)
	- [Compose mail](#compose-mail)
	- [Save attachments](#save-attachments)
	- [Compile CommonMark](#compile-commonmark)
	- [Copy content](#copy-content)
	- [List files](#list-files)
	- [Copy files](#copy-files)
	- [Compile CommonMark to RTF](#compile-commonmark-to-rtf)
	- [Move files](#move-files)
	- [Prepend with creation date](#prepend-with-creation-date)
	- [Prepend with modification date](#prepend-with-modification-date)
	- [Get Icon](#get-icon)
	- [Set Caffeine state](#set-caffeine-state)
	- [Show Caffeine state](#show-caffeine-state)
	- [Randomize filenames](#randomize-filenames)
	- [Compose mail](#compose-mail2)
	- [Save attachments](#save-attachments2)
	- [Vacuum Mail.app index](#vacuum-mailapp-index)
	- [Export favorites](#export-favorites)
	- [Group pictures by week](#group-pictures-by-week)
	- [Create HTML snippets](#create-html-snippets)
	- [Create parentheses snippets](#create-parentheses-snippets)
	- [Create markdown list of current Safari session](#create-markdown-list-of-current-safari-session)
	- [Reindex tags of selected songs in iTunes](#reindex-tags-of-selected-songs-in-itunes)
2. [App Index](#app-index)
3. [Script Index](#script-index)

## Scripts

### Add new task from selected mail to 2Do
Creates a new task in 2Dos default list with a link to the selected message in Mail.


- Apps: 2Do, [Mail](https://www.apple.com/support/mac-apps/mail/)
- File: [_2Do/AddTaskFromMail.applescript_](./2Do/AddTaskFromMail.applescript)
- Parameters:
	- **TODO_TAGS**: Tags for the newly created task, **default**: `"Mail"`
	- **TASK_PREFIX**: Prefix for the mail subject to use in the tasks title, **default**: `"Read: "`
	- **INBOX_NAME**: Name of the list to add the task to, **default**: `"Inbox"`
- Binary: [_2Do/AddTaskFromMail.scpt_](./2Do/AddTaskFromMail.scpt)


### Compose mail
Quickly compose an email in Airmail 2

- Apps: [Airmail 2](http://airmailapp.com)
- File: [_Airmail/ComposeMail.applescript_](./Airmail/ComposeMail.applescript)
- Parameters:
	- **RECEIPIENTS**: List of recipient mails
	- **SENDR**: Sending account to use
	- **SUBJ**: Subject line
	- **TESNIP**: Abbreviation of a TextExpander snippet to use as content
	- **BCC**: List of bcc mails
	- **CC**: List of cc mails


### Save attachments
Use as a script in Airmail rules to save attachments to the selected folder.

- Apps: [Airmail 2](http://airmailapp.com)
- File: [_Airmail/SaveAttachment.applescript_](./Airmail/SaveAttachment.applescript)
- Parameters:
	- **DOWNLOADS**: Folder to save attachments to


### Compile CommonMark
Converts any markdown file to html using CommonMark (http://commonmark.org) and copies all tags with tag (https://github.com/jdberry/tag/).


- Apps: [Alfred](http://alfredapp.com), [CommonMark](http://commonmark.org), [Markdown](https://daringfireball.net/projects/markdown/), [Tag](https://github.com/jdberry/tag/)
- File: [_Alfred/CompileCommonMark.sh_](./Alfred/CompileCommonMark.sh)


### Copy content
Copies the content of the selected file to the clipboard.


- Apps: [Alfred](http://alfredapp.com)
- File: [_Alfred/CopyContentToClipboard.sh_](./Alfred/CopyContentToClipboard.sh)


### List files
Copies a list of all files in the selected folder to the clipboard.


- Apps: [Alfred](http://alfredapp.com)
- File: [_Alfred/CopyFileListToClipboard.sh_](./Alfred/CopyFileListToClipboard.sh)


### Copy files
Copies the passed in files to `folder`

- Apps: [Alfred](http://alfredapp.com)
- File: [_Alfred/CopyFiles.sh_](./Alfred/CopyFiles.sh)
- Parameters:
	- **folder**: The folder the files will be copied to, **default**: `~/Downloads`


### Compile CommonMark to RTF
Converts any markdown file to rich text using CommonMark (http://commonmark.org) and copies all tags with tag (https://github.com/jdberry/tag/).


- Apps: [Alfred](http://alfredapp.com), [CommonMark](http://commonmark.org), [Markdown](https://daringfireball.net/projects/markdown/), [Tag](https://github.com/jdberry/tag/)
- File: [_Alfred/Markdown2Richtext.sh_](./Alfred/Markdown2Richtext.sh)


### Move files
Moves the passed in files to `folder`

- Apps: [Alfred](http://alfredapp.com)
- File: [_Alfred/MoveFiles.sh_](./Alfred/MoveFiles.sh)
- Parameters:
	- **folder**: The folder the files will be moved to, **default**: `~/Downloads`


### Prepend with creation date
Prepends the selected filename with the creation date.


- Apps: [Alfred](http://alfredapp.com)
- File: [_Alfred/PrependCreationDate.sh_](./Alfred/PrependCreationDate.sh)


### Prepend with modification date
Prepends the selected filename with the date of the last modification.


- Apps: [Alfred](http://alfredapp.com)
- File: [_Alfred/PrependModificationDate.sh_](./Alfred/PrependModificationDate.sh)


### Get Icon
Shows an icon for the current page. Requires jQuery.

- Apps: Safari, Chrome
- File: [_Bookmarklets/geticon.js_](./Bookmarklets/geticon.js)


### Set Caffeine state
Use as Alfred action to activate/deactivate Caffein or toggle the state. Pass 'activate', 'deactivate' or 'toggle' to the action.


- Apps: Caffeine, [Alfred](http://alfredapp.com)
- File: [_Caffeine/ToggleCaffeine.applescript_](./Caffeine/ToggleCaffeine.applescript)


### Show Caffeine state
Use in Alfred script filter to show Caffeins state (active or inactive) in the action item.


- Apps: Caffeine, [Alfred](http://alfredapp.com)
- File: [_Caffeine/alfred_CaffeineStatus.applescript_](./Caffeine/alfred_CaffeineStatus.applescript)


### Randomize filenames
Lets you choose a folder and randomizes the order of all files in it by renaming them with NAME_PREFIX and a number.


- Apps: Finder
- File: [_Finder/RandomizeFolder.applescript_](./Finder/RandomizeFolder.applescript)
- Parameters:
	- **NUMBER_PADDING**: By how many zeros should the number be padded, **default**: `4`
	- **NAME_PREFIX**: A prefix to append an increasing number to, **default**: `'photo-'`
	- **TYPES**: A list of file extensions (without the dot) to randomize, **default**: `{'jpg', 'jpeg', 'png'}`
- Binary: [_Finder/RandomizeFolder.scpt_](./Finder/RandomizeFolder.scpt)


### Compose mail
Quickly compose an email in Mail.app

- Apps: [Mail](https://www.apple.com/support/mac-apps/mail/)
- File: [_Mail/ComposeMail.applescript_](./Mail/ComposeMail.applescript)
- Parameters:
	- **RECEIPIENTS**: List of recipient mails
	- **SENDR**: Sending account to use
	- **SUBJ**: Subject line
	- **TESNIP**: Abbreviation of a TextExpander snippet to use as content
	- **BCC**: List of bcc mails
	- **CC**: List of cc mails


### Save attachments
Use as a script in Mail.app rules to save attachments to the selected folder.

- Apps: [Mail](https://www.apple.com/support/mac-apps/mail/)
- File: [_Mail/SaveAttachment.applescript_](./Mail/SaveAttachment.applescript)
- Parameters:
	- **TRASH_AFTER**: Set to true to trash the mail after saving the attachments
	- **DOWNLOADS**: Folder to save attachments to


### Vacuum Mail.app index
Speed up Mail.app by vacuuming the Envelope Index

- Apps: [Mail](https://www.apple.com/support/mac-apps/mail/)
- File: [_Mail/VacuumIndex.applescript_](./Mail/VacuumIndex.applescript)
- Binary: [_Mail/VacuumIndex.scpt_](./Mail/VacuumIndex.scpt)


### Export favorites
Export all media marked as favorites in Photos

- Apps: Photos
- File: [_Photos/ExportFavorites.applescript_](./Photos/ExportFavorites.applescript)
- Parameters:
	- **TARGET**: Set to the target folder.


### Group pictures by week
Sorts pics from a particular album into weekly albums relative to a target date based on the image date.
The script will sort every media item from `SOURCE_ALBUM` album into child albums of the TARGET_FOLDER by calculating how many weeks after `TARGET_DATE` it was taken.
The resulting folder structure will be:
``` TARGET_FOLDER
    ZERO_ALBUM
    WEEKLY_PREFIX 1
    WEEKLY_PREFIX 2
    WEEKLY_PREFIX 3
    ...
```


- Apps: Photos
- File: [_Photos/SortPicsIntoWeeks.applescript_](./Photos/SortPicsIntoWeeks.applescript)
- Parameters:
	- **WEEKLY_PREFIX**: Set to a prefix for the weekly albums.
	- **TARGET_FOLDER**: Set to the target folder for the weekly albums. This folder will be the parent of the weekly albums.
	- **TARGET_DATE**: Set to the target date.
	- **DISPLAY_DIALOG**: Set to true to display a summary dialog after everything is sorted.
	- **SOURCE_ALBUM**: Set to the album with the unsorted pics. If it is a subfolder use a path like string.
	- **ZERO_ALBUM**: Set to the album for pictures without a date or with a date before the target date.


### Create HTML snippets
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


- Apps: [TextExpander](https://smilesoftware.com/TextExpander/index.html)
- File: [_TextExpander/CreateHTMLSnippets.applescript_](./TextExpander/CreateHTMLSnippets.applescript)
- Parameters:
	- **TAGS_INLINE**: inline tags to create snippets for, **default**: `['del', 'code', 'strong', 'em']`
	- **TAGS_BLOCK**: block level tags to create snippets for, **default**: `['pre', 'blockquote']`
	- **PREFIX_CHARS**: snippet prefixes to use, **default**: `[',', ';', ',/']`
 		- the first list item places the cursor (`%|`) between the tags
 		- the second list item places the cursor (`%clipboard`) between the tags
 		- the third is used for empty blocks (e.g. `<hr/>`)
	- **GROUP_NAME**: name of group the snippets will be created in, **default**: `'HTML'`
	- **PREFIX_LENGTH**: number of chars to take from the tag name for the abbreviation, **default**: `5`
	- **TAGS_EMPTY**: empty tags to create snippets for, **default**: `['br', 'hr']`


### Create parentheses snippets
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


- Apps: [TextExpander](https://smilesoftware.com/TextExpander/index.html)
- File: [_TextExpander/CreateParenthesesSnippets.applescript_](./TextExpander/CreateParenthesesSnippets.applescript)
- Parameters:
	- **MAX_REPEAT**: maximum depth for snippets, **default**: `3`
	- **PAIRS**: parenthesis pairs, each item is a list with two items: the opening and closing parenthesis
**default**:
``` {["'", "'"], ["\"", "\""], ["`", "`"], ["(", ")"], ["[", "]"], ["{", "}"], ["_", "_"], ["-", "-"], ["~", "~"], ["*", "*"], ["<", ">"], ["=", "="]} ```
	- **PREFIX_CHARS**: snippet prefixes to use, **default**: `[',', ';']`
 		- the first list item places the cursor (`%|`) between the tags
 		- the second list item places the cursor (`%clipboard`) between the tags
	- **GROUP_NAME**: name of group the snippets will be created in, **default**: `'Parentheses'`


### Create markdown list of current Safari session
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


- Apps: [TextExpander](https://smilesoftware.com/TextExpander/index.html), Safari
- File: [_TextExpander/SafariSessionMd.applescript_](./TextExpander/SafariSessionMd.applescript)
- Parameters:
	- **PINNED**: number of pinned tabs to ignore, **default**: `4`


### Reindex tags of selected songs in iTunes
Reindex the songs currently selected in iTunes. For easy use put into `~/Library/iTunes/Scripts/`.


- Apps: [iTunes](https://www.apple.com/support/mac-apps/iTunes/)
- File: [_iTunes/RefreshSelection.applescript_](./iTunes/RefreshSelection.applescript)
- Binary: [_iTunes/RefreshSelection.scpt_](./iTunes/RefreshSelection.scpt)


## App Index

- **2Do**  
	[Add new task from selected mail to 2Do](#add-new-task-from-selected-mail-to-2do)
- **Airmail 2**  
	[Compose mail](#compose-mail), [Save attachments](#save-attachments)
- **Alfred**  
	[Compile CommonMark](#compile-commonmark), [Copy content](#copy-content), [List files](#list-files), [Copy files](#copy-files), [Compile CommonMark to RTF](#compile-commonmark-to-rtf), [Move files](#move-files), [Prepend with creation date](#prepend-with-creation-date), [Prepend with modification date](#prepend-with-modification-date), [Set Caffeine state](#set-caffeine-state), [Show Caffeine state](#show-caffeine-state)
- **Caffeine**  
	[Set Caffeine state](#set-caffeine-state), [Show Caffeine state](#show-caffeine-state)
- **Chrome**  
	[Get Icon](#get-icon)
- **CommonMark**  
	[Compile CommonMark](#compile-commonmark), [Compile CommonMark to RTF](#compile-commonmark-to-rtf)
- **Finder**  
	[Randomize filenames](#randomize-filenames)
- **Mail**  
	[Add new task from selected mail to 2Do](#add-new-task-from-selected-mail-to-2do), [Compose mail](#compose-mail2), [Save attachments](#save-attachments2), [Vacuum Mail.app index](#vacuum-mailapp-index)
- **Markdown**  
	[Compile CommonMark](#compile-commonmark), [Compile CommonMark to RTF](#compile-commonmark-to-rtf)
- **Photos**  
	[Export favorites](#export-favorites), [Group pictures by week](#group-pictures-by-week)
- **Safari**  
	[Get Icon](#get-icon), [Create markdown list of current Safari session](#create-markdown-list-of-current-safari-session)
- **Tag**  
	[Compile CommonMark](#compile-commonmark), [Compile CommonMark to RTF](#compile-commonmark-to-rtf)
- **TextExpander**  
	[Create HTML snippets](#create-html-snippets), [Create parentheses snippets](#create-parentheses-snippets), [Create markdown list of current Safari session](#create-markdown-list-of-current-safari-session)
- **iTunes**  
	[Reindex tags of selected songs in iTunes](#reindex-tags-of-selected-songs-in-itunes)

## Script Index


- **A**  
	[Add new task from selected mail to 2Do](#add-new-task-from-selected-mail-to-2do)
- **C**  
	[Compile CommonMark](#compile-commonmark), [Compile CommonMark to RTF](#compile-commonmark-to-rtf), [Compose mail](#compose-mail2), [Compose mail](#compose-mail), [Copy content](#copy-content), [Copy files](#copy-files), [Create HTML snippets](#create-html-snippets), [Create markdown list of current Safari session](#create-markdown-list-of-current-safari-session), [Create parentheses snippets](#create-parentheses-snippets)
- **E**  
	[Export favorites](#export-favorites)
- **G**  
	[Get Icon](#get-icon), [Group pictures by week](#group-pictures-by-week)
- **L**  
	[List files](#list-files)
- **M**  
	[Move files](#move-files)
- **P**  
	[Prepend with creation date](#prepend-with-creation-date), [Prepend with modification date](#prepend-with-modification-date)
- **R**  
	[Randomize filenames](#randomize-filenames), [Reindex tags of selected songs in iTunes](#reindex-tags-of-selected-songs-in-itunes)
- **S**  
	[Save attachments](#save-attachments), [Save attachments](#save-attachments2), [Set Caffeine state](#set-caffeine-state), [Show Caffeine state](#show-caffeine-state)
- **V**  
	[Vacuum Mail.app index](#vacuum-mailapp-index)
