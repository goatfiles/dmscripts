# Dmenu Scripts (dmscripts)

The scripts included in this repo are:

+ dm-bookman - Search your qutebrowser bookmarks, quickmarks and history urls.
+ dm-colpick - Copy a color's hex value to your clipboard
+ dm-confedit - Choose from a list of configuration files to edit.
+ dm-currencies - Convert prices between currencies.
+ dm-hub - A hub from where you can run all the scripts from.
+ dm-ip - Get IP of interface or external IP
+ dm-kill - Search for a process to kill.
+ dm-logout - Logout, shutdown, reboot or lock screen.
+ dm-maim - A GUI to maim using dmenu.
+ dm-man - Search for a manpage or get a random one.
+ dm-music - Dmenu as your music player
+ dm-note - Store multiple one-line texts or codes and copy one of them when needed.
+ dm-radio - Choose between online radio stations with dmenu.
+ dm-record - Records audio, video and webcam.
+ dm-reddit - Dmenu as a reddit viewer using reddio. *STILL A WORK IN PROGRESS*
+ dm-setbg - A wallpaper setting utility using dmenu, xwallpaper and sxiv
+ dm-sounds - Choose an ambient background to play.
+ dm-translate - Translate using Google Translate (through Lingva Translate)
+ dm-usbmount - mount/unmount usb drives using dmenu. No fancy daemon required
+ dm-weather - Simple graphical weather app
+ dm-websearch - Search various search engines (inspired by surfraw).
+ dm-wifi - Connect to wifi using dmenu.
+ dm-youtube - Youtube subscriptions without an account or the API tying you down.
+ \_dm-helper.sh Helper scripts adding functionality to other scripts

![Screenshot of dmenu](https://gitlab.com/dwt1/dotfiles/raw/master/.screenshots/dmenu-distrotube01.png)

# Table of Contents

1. [Contributing](#contributing)	
2. [Issues](#issues)	
3. [Dependencies](#dependencies)
4. [Installation](#installation)
5. [Configuration](#configuration)
	
# IMPORTANT!

When we write scripts, we test with a default dmenu configuration (or DT's config). This means 
potential issues with other patches or dmenu alternatives may be missed by us. Please feel free to
patch the program yourself or see if you can figure out why the patch/program is incompatible and
either take it upstream or fix your version.

That being said, we are making an effort to improve compatibility with new software and technology
like Wayland and dmenu alternatives however we need testers. Please write issues about Wayland
support and support for dmenu alternatives or comment on existing issues releated. 

## Patches to avoid:

+ Case insensitive 

Case insensitive is a patch that removes the -i flag and makes insensitive casing the default
behaviour, this needs to be reverted if you wish to use dmscripts in the default configuration.

## Programs to avoid:

Currently, none.

# Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

# Issues

See [ISSUES.md](ISSUES.md)

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

## Installation on Gentoo

```bash
$ eselect repository add misc-overlay git https://gitlab.com/0ae/misc-overlay
$ emaint sync -r misc-overlay
$ emerge app-misc/dmscripts
```

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
