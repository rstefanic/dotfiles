#!/bin/sh

echo "Setting up environment..."

# Make zsh default shell
chsh -s $(which zsh)
mv .zshrc ~/

# If xmonad is installed, then set up xmonad settings
if test ! $(which xmonad); then
    mv .xmonad ~/
    mv .xmobarrc ~/
fi

# If emacs is installed, setup emacs files
if test ! $(which emacs); then
    mv .emacs ~/
    mv .emacs.d ~/
fi




