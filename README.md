# Dmenu Scripts (dmscripts)

![Screenshot of dmenu](https://gitlab.com/dwt1/dotfiles/raw/master/.screenshots/dmenu-distrotube01.png) 

This is a collection of dmenu scripts that I have found useful in my day-to-day activities as a desktop Linux user.  These are scripts that I personally use but this repository is open to the community.  If you would like to contribute your own scripts or improve any existing scripts, I would be happy to review your merge requests.  All scripts should be written in Bash and should use "/usr/share/env bash" as the shebang line rather than "/bin/sh" which is annoying for non-POSIX shell users like me (I use Fish).

The scripts included in this repo are:
+ dman - Search for a manpage or get a random one.
+ dmconf - Choose from a list of configuration files to edit.
+ dmlogout - Logout, shutdown, reboot or lock screen.
+ dmkill - Search for a process to kill.
+ dmqute - Search your qutebrowser bookmarks, quickmarks and history urls.
+ dmred - Dmenu as a reddit viewer using reddio. *STILL A WORK IN PROGRESS
+ dmsearch - Search various search engines (inspired by surfraw).
+ dcolors - copy hex value of a color to your clipboard

# Dependencies
Of course, dmenu is a dependency for all of these scripts.  To see the dependencies of each individual script, check the top commented block of text in each script.

# Installation

All you need to do is clone this repository and run them.  Run the following command:

	git clone https://gitlab.com/dwt1/dmscripts.git
	
To make the scripts executable:

	cd dmscripts
	chmod -R 755 .

And to run a script:

	 bash /path/to/script

Or:

	./path/to/script
