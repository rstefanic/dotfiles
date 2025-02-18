export PATH=~/.composer/vendor/bin:$PATH

ZSH_THEME="agnoster"
ZSH_DISABLE_COMPFIX="true"

plugins=(git)

alias pu="clear && ./vendor/bin/phpunit"
alias pf="clear && ./vendor/bin/phpunit --filter"
alias pd="clear && ./vendor/bin/phpunit --testdox"
alias gt="git log --graph --abbrev-commit --decorate --oneline"
alias gl="git l"
alias gla="git la"
alias glr="git lr"
alias glra="git lra"
alias glg="git lg"
alias nah="git restore -- ."

source ~/.scripts/docker-psql
