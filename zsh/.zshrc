# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set the ZSH theme
ZSH_THEME="geoffgarside"

# oh-my-zsh plugins to load
plugins=(git, osx)

# Initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Add rbenv to path and initialize on shell start
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

