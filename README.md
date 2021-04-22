# Dmenu Scripts (dmscripts)

![Screenshot of dmenu](https://gitlab.com/dwt1/dotfiles/raw/master/.screenshots/dmenu-distrotube01.png)

This is a collection of dmenu scripts that I have found useful in my day-to-day activities as a desktop Linux user.  These are scripts that I personally use but this repository is open to the community.  If you would like to contribute your own scripts or improve any existing scripts, I would be happy to review your merge requests.  All scripts should be written in Bash and should use "/usr/bin/env bash" as the shebang line rather than "/bin/sh" which is annoying for non-POSIX shell users like me (I use Fish).

The scripts included in this repo are:
+ dm-setup - Downloads dependencies and makes the scripts executable.
+ dmhub - A hub from where you can run all the scripts from.
+ dman - Search for a manpage or get a random one.
+ dmconf - Choose from a list of configuration files to edit.
+ dmlogout - Logout, shutdown, reboot or lock screen.
+ dmkill - Search for a process to kill.
+ dmqute - Search your qutebrowser bookmarks, quickmarks and history urls.
+ dmred - Dmenu as a reddit viewer using reddio. *STILL A WORK IN PROGRESS*
+ dmsearch - Search various search engines (inspired by surfraw).
+ dmcolors - Copy a color's hex value to your clipboard
+ dmwall - A wallpaper setting utility using dmenu, xwallpaper and sxiv

# Dependencies
Of course, dmenu is a dependency for all of these scripts.  To see the dependencies of each individual script, check the top commented block of text in each script.

# Installation

## Installation on Arch

If you are using Arch, clone the repository then go through the manual build process to install the scripts. Run the following commands:

	git clone https://gitlab.com/dwt1/dmscripts.git
	cd dmscripts
	makepkg -cf
	sudo pacman -U *.pkg.tar.zst

Alternatively, you could install dmscripts from the AUR using an AUR helper such as yay:

	yay -S dmscripts-git

Once installed, the scripts should behave like any other command and can be run by typing the script's name.

## Installation on Other Linux Distributions

All you need to do is clone this repository and run setup. Run the following commands:

	git clone https://gitlab.com/dwt1/dmscripts.git
	cd dmscripts
	bash dm-setup

You can run all the scripts from the hub:

	bash dmhub

To run a script without using the hub:

	bash /path/to/script

Or:

	./path/to/script
