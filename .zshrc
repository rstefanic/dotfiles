export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
ZSH_DISABLE_COMPFIX="true"

plugins=(
    git
    direnv
)

source $ZSH/oh-my-zsh.sh

alias pu="clear && ./vendor/bin/phpunit"
alias pf="clear && ./vendor/bin/phpunit --filter"
alias pd="clear && ./vendor/bin/phpunit --testdox"
alias gs="git status"
alias co="git checkout"
alias gaa="git add -A"
alias gd="git diff"
alias gdc="git diff -cached"
alias gt="git log --graph --abbrev-commit --decorate --oneline"
alias gl="git l"
alias gla="git la"
alias glr="git lr"
alias glra="git lra"
alias glg="git lg"
alias nah="git restore -- ."
alias vim=nvim
