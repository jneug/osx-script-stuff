# osx-script-stuff

A collection of scripts to automate stuff on Max OS X systems.


## Table of contents

1. [Scripts](#scripts)
	- [Compose mail](#compose-mail)
	- [Save attachments](#save-attachments)
	- [Set Caffeine state](#set-caffeine-state)
	- [Show Caffeine state](#show-caffeine-state)
	- [Compose mail](#compose-mail-1)
	- [Save attachments](#save-attachments-1)
	- [Vacuum Mail.app index](#vacuum-mailapp-index)
1. [App Index](#app-index)

## Scripts

### Compose mail
- File: [_Airmail/ComposeMail.applescript_](./Airmail/ComposeMail.applescript)
- Apps: [Airmail 2](http://airmailapp.com)

> Quickly compose an email in Airmail 2


- Parameters:

	- **CC**: List of cc mails
	- **TESNIP**: Abbreviation of a TextExpander snippet to use as content
	- **BCC**: List of bcc mails
	- **SENDR**: Sending account to use
	- **SUBJ**: Subject line
	- **RECEIPIENTS**: List of recipient mails


### Save attachments
- File: [_Airmail/SaveAttachment.applescript_](./Airmail/SaveAttachment.applescript)
- Apps: [Airmail 2](http://airmailapp.com)

> Use as a script in Airmail rules to save attachments to the selected folder.


- Parameters:

	- **DOWNLOADS**: Folder to save attachments to


### Set Caffeine state
- File: [_Caffeine/ToggleCaffeine.applescript_](./Caffeine/ToggleCaffeine.applescript)
- Apps: Caffeine, [Alfred](http://alfredapp.com)

> Use as Alfred action to activate/deactibvate Caffeins or toggle the state.



### Show Caffeine state
- File: [_Caffeine/alfred_CaffeineStatus.applescript_](./Caffeine/alfred_CaffeineStatus.applescript)
- Apps: Caffeine, [Alfred](http://alfredapp.com)

> Use in Alfred script filter to show Ceffeins state (active or inactive).



### Compose mail
- File: [_Mail/ComposeMail.applescript_](./Mail/ComposeMail.applescript)
- Apps: Mail

> Quickly compose an email in Mail.app


- Parameters:

	- **CC**: List of cc mails
	- **TESNIP**: Abbreviation of a TextExpander snippet to use as content
	- **BCC**: List of bcc mails
	- **SENDR**: Sending account to use
	- **SUBJ**: Subject line
	- **RECEIPIENTS**: List of recipient mails


### Save attachments
- File: [_Mail/SaveAttachment.applescript_](./Mail/SaveAttachment.applescript)
- Apps: Mail

> Use as a script in Mail.app rules to save attachments to the selected folder.


- Parameters:

	- **DOWNLOADS**: Folder to save attachments to
	- **TRASH_AFTER**: Set to true to trash the mail after saving the attachments


### Vacuum Mail.app index
- File: [_Mail/VacuumIndex.applescript_](./Mail/VacuumIndex.applescript)
- Apps: Mail

> Speed up Mail.app by vacuuming the Envelope Index




## App Index

- **Airmail 2**  
	[Compose mail](#compose-mail), [Save attachments](#save-attachments)
- **Alfred**  
	[Set Caffeine state](#set-caffeine-state), [Show Caffeine state](#show-caffeine-state)
- **Caffeine**  
	[Set Caffeine state](#set-caffeine-state), [Show Caffeine state](#show-caffeine-state)
- **Mail**  
	[Compose mail](#compose-mail-1), [Save attachments](#save-attachments-1), [Vacuum Mail.app index](#vacuum-mailapp-index)
