#!/bin/sh

echo "Setting up environment..."

BACKUP="~/dotfiles-backup"

# Make zsh default shell
chsh -s $(which zsh)

if [ ! -d "$BACKUP" ]; then
   mkdir "$BACKUP"
fi

if [ -e x "~/.zshrc" ]; then 
   mv ~/.zshrc ~/dotfile-backup
fi
   
cp .zshrc "$HOME"

# If xmonad is installed, then set up xmonad settings
if test ! $(which xmonad); then
    if [ -d "~/.xmonad" ]; then
	mv -rf ~/.xmonad "$BACKUP"
	rm -rf ~/.xmonad
    fi

    if [ -e x ~/.xmobarrc ]; then
	mv ~/.xmobarrc "$BACKUP"
	rm ~/.xmobarrc
    fi
    
    cp .xmonad ~/
    cp .xmobarrc ~/
fi

# If emacs is installed, setup emacs files
if test ! $(which emacs); then
    if [ -e x ~/.emacs ]; then
	mv ~/.emacs "$BACKUP"
	rm ~/.emacs
    fi

    if [ -d "~/.emacs.d" ]; then
	mv ~/.emacs.d "$BACKUP"
	rm ~/.emacs.d
    fi
    
    cp .emacs ~/
    cp .emacs.d ~/
fi
