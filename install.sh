#!/bin/sh

echo "Setting up environment..."

dir=~/dotfiles
dir_backup=~/dotfiles-backup

xmonad_config() {
    # If xmonad is installed, then set up xmonad settings
    if test ! $(which xmonad); then
	if [ -d "~/.xmonad" ]; then
	    mv -rf ~/.xmonad $dir_backup
	    rm -rf ~/.xmonad
	fi

	if [ -e ~/.xmobarrc ]; then
	    mv ~/.xmobarrc $dir_backup
	    rm ~/.xmobarrc
	fi

	cp .xmonad ~/
	cp .xmobarrc ~/
    fi
}

vim_config() {
   if [ -e ~/.vimrc ]; then
        mv ~/.vimrc $dir_backup
   fi
   
   cp .vimrc ~/ 
}

emacs_config() {
    # If emacs is installed, setup emacs files
    if test ! $(which emacs); then
	if [ -e ~/.emacs ]; then
	    mv ~/.emacs $dir_backup
	    rm ~/.emacs
	fi

	if [ -d "~/.emacs.d" ]; then
	    mv ~/.emacs.d $dir_backup
	    rm ~/.emacs.d
	fi

	cp .emacs ~/
	cp .emacs.d ~/
    fi
}

create_backup_dotfiles() {
    if [ ! -d $dir_backup ]; then
       mkdir -p $dir_backup
    fi
}

install_zsh() {
    # Check if zsh is installed
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
	if [ ! -d $dir/oh-my-zsh/ ]; then
	    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi

	# Set zsh as the default shell
	if [ ! $(echo $SHELL) = $(which zsh) ]; then
	    sudo chsh -s $(which zsh)
	fi

	if [ -f ~/.zshrc ]; then
	    mv -f ~/.zshrc $dir_backup
	fi
	
	cp -f .zshrc ~/.zshrc
    else
	if [ -f /etc/debian_version ]; then
	    sudo apt-get install zsh
	    install_zsh
	else
	    echo "Cannot install zsh -- Cannot use apt-get to install zsh"
	fi
    fi
}

create_backup_dotfiles
install_zsh
xmonad_config
emacs_config
