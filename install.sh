#!/bin/sh

echo "Setting up environment..."

# Make zsh default shell
chsh -s $(which zsh)

mkdir ~/dotfile-backup
mv ~/.zshrc ~/dotfile-backup
mv .zshrc ~/

# If xmonad is installed, then set up xmonad settings
if test ! $(which xmonad); then
    mv -rf ~/.xmonad ~/dotfile-backup
    rm -rf ~/.xmonad
    mv .xmonad ~/

    mv ~/.xmobarrc ~/dotfile-backup
    rm ~/.xmobarrc
    mv .xmobarrc ~/
fi

# If emacs is installed, setup emacs files
if test ! $(which emacs); then
    mv ~/.emacs ~/dotfile-backup
    rm ~/.emacs
    mv .emacs ~/

    mv ~/.emacs.d ~/dotfile-backup
    rm ~/.emacs.d
    mv .emacs.d ~/
fi
