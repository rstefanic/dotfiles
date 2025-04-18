EDITOR="nvim"
setopt AUTO_CD

# History file
export HISTFILE=$HOME/.zsh/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Load plugins
autoload -Uz compinit && compinit
autoload -Uz vcs_info

# Set zstyle for VCS expansion
zstyle ':vcs_info:git:*' formats '%F{red}%b%f'

precmd() { vcs_info } # get VCS info before each cmd is ran
setopt PROMPT_SUBST # subject the prompt strings to parameter expansion
PROMPT='%B%F{yellow}%m%f %B%F{blue}%~%f ${vcs_info_msg_0_} %(?.%F{green}●%f.%F{red}●%f)%b '
RPROMPT='%F{245}%*%f'

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search

alias sa="source ~/.zshrc; echo 'ZSH sourced.'"
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

eval "$(direnv hook zsh)"
