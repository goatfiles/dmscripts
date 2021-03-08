# Dmenu Scripts (dmscripts)

![Screenshot of my desktop](https://gitlab.com/dwt1/dotfiles/raw/master/.screenshots/dotfiles04.png) 
This is a collection of dmenu scripts that I have found useful in my day-to-day activities as a desktop Linux user.  These are scripts that I personally use but this repository is open to the community.  If you would like to contribute your own scripts or improve any existing scripts, I would be happy to review your merge requests.  All scripts should be written in Bash and should use "/usr/share/env bash" as the shebang line rather than "/bin/sh" which is annoying for non-POSIX shell users like me (I use Fish).

The scripts included in this repo are:
+ dman - Search for a manpage of get a random one.
+ dmconf - Choose from a list of configuration files to edit.
+ dmkill - Search for a process to kill.
+ dmpower - Logout, shutdown, reboot or lock screen.
+ dmsearch - Search various search engines (inspired by surfraw).


# Dependencies
+ libxft
+ ttf-hack
+ ttf-joypixels
+ st
+ dmenu
+ tabbed

Also, you will need to add the following from the AUR:
+ nerd-fonts-complete (optional)
+ https://aur.archlinux.org/packages/libxft-bgra/ (needed for colored fonts and emojis)

Also, if you are building this on an Ubuntu-based system, you need to install libx11-dev and xorg-dev.

# Installing dwm-distrotube on Arch Linux

All you need to do is download the PKGBUILD from this repository.  Then run the following command:

	makepkg -cf
	
This will create a file that ends in .pkg.tar.xz (for example, dwm-distrotube-git-6.2-1-x86_64.pkg.tar.xz).  Then run:

	sudo pacman -U *.pkg.tar.xz 
	
Alternately, you could also install dwm-distrotube-git from the AUR using an AUR helper such as yay:

	yay dwm-distrotube-git
	
NOTE: Installing dwm-distrotube-git conflicts with the standard dwm package.  If you already have dwm installed, you will be asked if you want to remove dwm and install dwm-distrotube-git instead. 
	
