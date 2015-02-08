bindkey -v

source $ZSH_CUSTOM/plugins/opp.zsh/opp.zsh
source $ZSH_CUSTOM/plugins/opp.zsh/opp/*.zsh

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey -a u undo
bindkey -a '^R' redo
export KEYTIMEOUT=1

precmd() {
  RPROMPT=""
}
zle-keymap-select() {
  RPROMPT=""
  [[ $KEYMAP = vicmd ]] && RPROMPT="[ CMD ]"
  () { return $__prompt_status }
  zle reset-prompt
}
zle-line-init() {
  typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init
