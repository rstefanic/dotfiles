#!/bin/sh

echo "Setting up environment..."

# Make zsh default shell
chsh -s $(which zsh)

mkdir ~/dotfile-backup
mv ~/.zshrc ~/dotfile-backup
cp .zshrc ~/

# If xmonad is installed, then set up xmonad settings
if test ! $(which xmonad); then
    mv -rf ~/.xmonad ~/dotfile-backup
    rm -rf ~/.xmonad
    cp .xmonad ~/

    mv ~/.xmobarrc ~/dotfile-backup
    rm ~/.xmobarrc
    cp .xmobarrc ~/
fi

# If emacs is installed, setup emacs files
if test ! $(which emacs); then
    mv ~/.emacs ~/dotfile-backup
    rm ~/.emacs
    cp .emacs ~/

    mv ~/.emacs.d ~/dotfile-backup
    rm ~/.emacs.d
    cp .emacs.d ~/
fi
