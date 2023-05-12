mkdir -p ~/.config/nvim

ln -s $PWD/nvim/init.lua ~/.config/nvim/
ln -s $PWD/nvim/lua/ ~/.config/nvim/
ln -s $PWD/nvim/after/ ~/.config/nvim/
ln -s $PWD/tmux/.tmux.conf ~/.tmux.conf
ln -s $PWD/kitty/ ~/.config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
