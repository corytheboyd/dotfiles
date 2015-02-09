# YOU! YES, YOU!
#
# Try not to edit this file directly, for it is generated
# by corytheboyd/dotfiles.

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set the ZSH theme
ZSH_THEME="geoffgarside"

# oh-my-zsh plugins to load
plugins=(git ruby bundler osx opp alias-tips zsh-syntax-highlighting)

# Initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

export EDITOR=`which vim`
export VISUAL=$EDITOR

# Add sweet, sweet colors to man pages
export MANPAGER="/bin/sh -c \"col -b | vim -c 'nnoremap <space> <C-F>| nnoremap q :q<cr>| set ft=man ts=8 nomod nolist nonu noma' -\""

# Alright Tim Pope, I'll listen to you. Moved from /etc/zshenv
# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

# Load rbenv automatically
eval "$(rbenv init -)"

# Load custom configuration
source ~/.zshrc.local

# If you see anything after this line, it probably
# belongs in ~/.zshrc.local. Don't be lazy!
