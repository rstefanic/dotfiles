mkdir -p ~/.config/nvim

ln -s $PWD/.scripts ~/.scripts
ln -s $PWD/nvim/init.lua ~/.config/nvim/
ln -s $PWD/nvim/lua/ ~/.config/nvim/
ln -s $PWD/nvim/after/ ~/.config/nvim/
ln -s $PWD/tmux/.tmux.conf ~/.tmux.conf
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/.gitconfig ~/.gitconfig

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

while [ $# -ne 0 ]
do
    arg="$1"
    case "$arg" in
        --ghostty)
            ln -s $PWD/ghostty ~/.config/ghostty
            ;;
        *)
            ;;
    esac
    shift
done

