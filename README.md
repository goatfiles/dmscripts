# Dmenu Scripts (dmscripts)

![Screenshot of dmenu](https://gitlab.com/dwt1/dotfiles/raw/master/.screenshots/dmenu-distrotube01.png)

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
+ dm-pacman - A software store using dmenu
+ dm-usbmount - mount/unmount usb drives using dmenu. No fancy daemon required
+ dm-music - Dmenu as your music player

# Contributing
This is a collection of dmenu scripts that I have found useful in my day-to-day activities as a desktop Linux user.  Although initially this was just for my personal scripts, this project is now open to the community.  If you would like to contribute your own scripts or improve any existing scripts, I would be happy to review your merge requests.  All scripts submitted should meet the following guidelines:

Scripts should be written in Bash and use the following shebang line:

    #!/usr/bin/env bash
    
To avoid unintended errors, scripts should include the line: 

    set -euo pipefail

Before submitting, please run your script through shellcheck to check for potential errors.  Sometimes, you may get a shellcheck warning that you cannot fix because the "fix" would actually break the script.  If so, leave a comment in the script that will disable the shellcheck warning in the future.

For example, to disable the SC2154 warning about referencing http_proxy:

    # shellcheck disable=SC2154
    echo "proxy=$http_proxy" | ...

Also, please use consistent indentation, preferably TWO spaces rather than tabs.  

Contributors are asked to look at our [TODO list](TODO.md) as we would like to ensure all scripts are stable and secure.

# Dependencies

Of course, dmenu is a dependency for all of these scripts.  To see the dependencies of each individual script, check the top commented block of text in each script.

# Installation

Note: No current install method supports the sample config files, please see the configuration guide below if you wish to use a custom config file.

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

# Configuration

Currently, configuration can be done in a few ways:
+ Via the proper config files (recommended)
+ Via /etc/profile
+ Via editing the source code (not recommended)

## Config files

Currently the config files are not installed by default so in order to correctly install them, you need to move or copy them to the appropriate directory. Run the following commands:

	git clone https://gitlab.com/dwt1/dmscripts.git
	cd dmscripts
	cp -riv config/ "$HOME"/.config/dmscripts

The config files are bash scripts however they are very simple to understand and several comments are left which explains what everything in the config files do. If you are still confused, a general word of advice that you should just copy one of the lines in the config and modify it to see what it does.

## /etc/profile

By editing the file /etc/profile, you can add environment variables which will work accross the dmscripts. A few examples include:

	: "${TERMINAL:=st}"
	: "${DMTERM:=${TERMINAL} -e}"
	: "${DMBROWSER=qutebrowser}"
	: "${DMEDITOR="emacsclient -c -a emacs}"

You can, of course, replace the variables with whatever you prefer. It's also worth noting that editing /etc/profile requires root permission, so you will need to elevate yourself if you wish to configure the scripts in this manner.

## Editing the Source Code

Being a free/libre software project, you may make modifications to the source code to fit your needs. If you need a reference, look at the config files and variables in /etc/profile for a general idea on what to look for in the source code. Please submit patches and merge requests if you see any bugs or improve the source code while you are there.
