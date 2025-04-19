EDITOR="nvim"
setopt AUTO_CD

# History file
export HISTFILE=$HOME/.zsh/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Load plugins
autoload -Uz compinit && compinit
autoload -Uz vcs_info

vcs_status_arrow=""
precmd() {
    vcs_info
    if [[ -z "${vcs_info_msg_0_}" ]] {
        vcs_status_arrow="%F{default}▶%f"
    } elif [[ -n "$(git diff --cached --name-status 2>/dev/null)" ]] {
        vcs_status_arrow="%F{yellow}▶%f"
    } elif [[ -n "$(git diff --name-status 2>/dev/null)" ]] {
        vcs_status_arrow="%F{red}▶%f"
    } else {
        vcs_status_arrow="%F{green}▶%f"
    }
}

setopt PROMPT_SUBST # subject the prompt strings to parameter expansion
PROMPT='%B%F{yellow}%m%f %B%F{blue}%~%f %(?.%F{green}●%f.%F{red}●%f)%b ${vcs_status_arrow} '
RPROMPT='%F{245}%*%f'

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey '^[[3~' delete-char

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
