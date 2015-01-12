# YOU! YES, YOU!
#
# Try not to edit this file directly, for it is generated
# by corytheboyd/dotfiles.

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set the ZSH theme
ZSH_THEME="geoffgarside"

# oh-my-zsh plugins to load
plugins=(git ruby bundler osx)

# Initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Add rbenv to path and initialize on shell start
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Load custom configuration
source ~/.zshrc.local

# If you see anything after this line, it probably
# belongs in ~/.zshrc.local. Don't be lazy!
