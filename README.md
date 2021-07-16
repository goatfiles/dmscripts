# Dmenu Scripts (dmscripts)

The scripts included in this repo are:

+ dm-bookman - Search your qutebrowser bookmarks, quickmarks and history urls.
+ dm-colpick - Copy a color's hex value to your clipboard
+ dm-confedit - Choose from a list of configuration files to edit.
+ dm-hub - A hub from where you can run all the scripts from.
+ dm-ip - Get IP of interface or external IP
+ dm-kill - Search for a process to kill.
+ dm-logout - Logout, shutdown, reboot or lock screen.
+ dm-maim - A GUI to maim using dmenu.
+ dm-man - Search for a manpage or get a random one.
+ dm-music - Dmenu as your music player
+ dm-record - Records audio, video and webcam.
+ dm-reddit - Dmenu as a reddit viewer using reddio. *STILL A WORK IN PROGRESS*
+ dm-setbg - A wallpaper setting utility using dmenu, xwallpaper and sxiv
+ dm-sounds - Choose an ambient background to play.
+ dm-translate - Translate using Google Translate (through Lingva Translate)
+ dm-usbmount - mount/unmount usb drives using dmenu. No fancy daemon required
+ dm-websearch - Search various search engines (inspired by surfraw).
+ dm-wifi - Connect to wifi using dmenu.
+ dm-youtube - Youtube subscriptions without an account or the API tying you down.
+ \_dm-helper.sh Helper scripts adding functionality to other scripts

![Screenshot of dmenu](https://gitlab.com/dwt1/dotfiles/raw/master/.screenshots/dmenu-distrotube01.png)

# Table of Contents

1. [Contributing](#contributing)	
2. [Dependencies](#dependencies)
3. [Installation](#installation)
4. [Configuration](#configuration)
	

# Contributing

This is a collection of dmenu scripts that I have found useful in my day-to-day activities as a desktop Linux user.  Although initially this was just for my personal scripts, this project is now open to the community.  If you would like to contribute your own scripts or improve any existing scripts, I would be happy to review your merge requests.  All scripts submitted should meet the following guidelines:

Scripts should be named in the format `dm-[scriptname]`

Scripts should be written in Bash and use the following shebang line:

```bash
#!/usr/bin/env bash
```    

To avoid unintended errors, scripts should include the line: 

```bash
set -euo pipefail
```

Before submitting, please run your script through shellcheck to check for potential errors.  Sometimes, you may get a shellcheck warning that you cannot fix because the "fix" would actually break the script.  If so, leave a comment in the script that will disable the shellcheck warning in the future.

For example, to disable the SC2154 warning about referencing http_proxy:

```bash
# shellcheck disable=SC2154
echo "proxy=$http_proxy" | ...
```

Please use consistent indentation, preferably TWO spaces rather than tabs.  

Please update the manual pages, documentation and README.md to include your script if you know how to. **Scripts are sorted in alphabetical order**

Finally, contributors are asked to look at our [TODO list](TODO.md) as well as the [issues page](https://gitlab.com/dwt1/dmscripts/-/issues) since we would like to ensure all scripts are stable and secure.

## Additional advice

Even though you do not have to do this to contribute, we recommend setting up a mirror repository of this repo if you wish to frequently contribute. New scripts are added almost daily, documentation is also frequently updated so there could be conflicts if your repo is left unmaintained for long periods of time. We recommend you follow the [Gitlab documentation](https://docs.gitlab.com/ee/user/project/repository/repository_mirroring.html) for **pulling** from a remote repository.

# Dependencies

Of course, dmenu is a dependency for all of these scripts.  To see the dependencies of each individual script, check the top commented block of text in each script. For installing you will need pandoc and, of course, git.

# Installation

## Installation on Arch

If you are using Arch, clone the repository then go through the manual build process to install the scripts. Run the following commands:

```bash
$ git clone https://gitlab.com/dwt1/dmscripts.git
$ cd dmscripts
$ makepkg -cf
$ sudo pacman -U *.pkg.tar.zst
```

Alternatively, you could install dmscripts from the AUR using an AUR helper such as yay:

```bash
$ yay -S dmscripts-git
```

Once installed, the scripts should behave like any other command and can be run by typing the script's name.

NOTE: When installing dmscripts-git, you will see a list of Haskell dependencies that will be installed. This is because one of the make dependencies, pandoc, is written in Haskell. Simply enter "y" on the prompt "Remove make dependencies after install" and those programs should go away. Alternatively, [this AUR package](https://aur.archlinux.org/packages/pandoc-bin/) can be downloaded and used as a drop-in replacement if you wish to use the program afterwards.

## Installation on Other Linux Distributions

All you need to do is clone this repository and run setup. Run the following commands:

```bash
$ git clone https://gitlab.com/dwt1/dmscripts.git
$ cd dmscripts
$ sudo make clean build
$ sudo make install
```

Once installed, the scripts should behave like any other command and can be run by typing the script's name. It is important to note however that the dependencies are not installed by default, that is up to YOU to do before installing.

NOTE: Some distributions require the Haskell programming language to be installed as pandoc is a Haskell program. If you wish to use the software without installing Haskell, we recommend [downloading a static build](https://github.com/jgm/pandoc/releases). A guide for installation can be found [on the pandoc github](https://github.com/jgm/pandoc/blob/2.14.0.3/INSTALL.md).

## Non-installation

If you wish to try the scripts without installing, you can use dm-hub:
for the scripts to work you need to have the config-file in one of three locations:
+ /etc/dmscripts/config
+ ../config/config (path relative to scripts in git-repo)
+ ~/.config/dmscripts/config

```bash
$ bash /path/to/dm-hub
```

To run a script without using the hub:

```bash
$ bash /path/to/script
```

Or:

```bash
$ ./path/to/script
```

# Configuration

Currently, configuration can be done in a few ways:
+ copying config (from repo ./config/config or /etc/dmscripts/config if installed) to ~/.config/dmscripts/config (Recommended)
+ Via the global config file `/etc/dmscripts/config` (will cause diff when updating)
	+ Maintenance
+ Via editing the source code (not recommended)
	+ Changing the Config Location

## The Global Config

Currently only a "global" config is installed to `/etc/dmscripts/config`.
To install a user-specific version of the config run the following command:

```bash
$ cp -riv config/ "$HOME"/.config/dmscripts
```

The config file is a bash script however it is very simple to understand and several comments are left which explains what everything in the config file does. If you are still confused, a general word of advice that you should just copy one of the lines in the config and modify it to see what it does.

### Maintenance

As we are currently adding a lot of scripts to the repository and making patches very regularly, the advice is to check up on the repo's sample config every few days and make the appropriate changes. This is especially true if you are also installing new scripts as they get added.

## Editing the Source Code

Being a free/libre software project, you may make modifications to the source code to fit your needs. If you need a reference, look at the config files and variables in /etc/profile for a general idea on what to look for in the source code. Please submit patches and merge requests if you see any bugs or improve the source code while you are there.

### Changing the Config Location

If you could like to change config location you can add custom search path into the array in function `get_config` in `_dm-helper.sh`

```bash
config_dirs+=(
"/path/to/custom/config-file"
"${HOME}/.config/dmscripts/config"
"/etc/dmscripts/config"
)
```
