mkdir -p ~/.config/nvim

ln -s $PWD/.scripts ~/.scripts
ln -s $PWD/nvim/init.lua ~/.config/nvim/
ln -s $PWD/nvim/lua/ ~/.config/nvim/
ln -s $PWD/nvim/after/ ~/.config/nvim/
ln -s $PWD/tmux/.tmux.conf ~/.tmux.conf
ln -s $PWD/ghostty ~/.config/ghostty
ln -s $PWD/wezterm/.wezterm.lua ~/.wezterm.lua
ln -s $PWD/.zshrc ~/.zshrc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
