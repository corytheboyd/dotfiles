bindkey -v

source $ZSH_CUSTOM/plugins/opp.zsh/opp.zsh
source $ZSH_CUSTOM/plugins/opp.zsh/opp/*.zsh

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
export KEYTIMEOUT=1
