# General TODO 
- [ ] Fix any spelling or grammatical mistakes in files
- [x] Sane configuration
	- [x] Global config file
	- [x] $USER-local config file
- [x] Documentation 
	- [x] Write man page
	- [x] Improve README.md
- [ ] Release a stable tar
	- [x] Write a Changelog
	- [ ] Establish a Roadmap
	- [ ] Fix the issues mentioned here
	- [ ] Fix bugs in the scripts
	- [ ] Indentify and fix any other issues
# Bugs and Script Specific Stuff
- [ ] various
	- [ ] Refrence: NA

	A lot of scripts return 0 when failing or quitting, they should return 1 as 0 indicates success.

- [x] \_dm-helper.sh
	- [x] Refrence: [Merge Request 52](https://gitlab.com/dwt1/dmscripts/-/merge_requests/52). 
	
	Error in AUR build, unclear if it is just an AUR issue, a makefile issue or an issue with the helper script altogether. More clarity and testing needed.

	From my understanding, this was patched.

- [ ] dm-bookman
	- [ ] Refrence: NA

	Important variables like ```_bookmark_file``` are not included in the config file. This also means that qutebrowser remains a hardcoded dependency. See lines 23-31 for an example.

- [ ] dm-pacman
	- [ ] Refrence: NA

	dm-pacman has bad fail-saves, this could lead the user to remove packages they don't want to or installing packages they don't want to. See lines 41 onward for examples.

- [ ] dm-sounds
	- [ ] Refrence: NA

	If find fails, the program doesn't immediately crash, which could result in further issues.

- [x] dm-websearch
	- [x] Refrence: [Issue 20](https://gitlab.com/dwt1/dmscripts/-/issues/20). 
	
	Typing queries with spaces (seemingly) while using Chromium based browsers causes the script to behave incorrectly. This bug has not been reproduced by anyone so far, DT tried it in Brave and it didn't work.

	This was marked resolved as the issue could not be replicated upon further testing, if you can replicate it using Brave or another Chromium based browser, please correct this.

## Template
- [ ] Script name
	- [ ] Issue number plus brief description of the issue
