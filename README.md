# dotfiles

Files that have been prepended with a dot.

## Usage

```
cd ~
git clone git@github.com:corytheboyd/dotfiles.git
cd dotfiles
rake install
```

## ZSH

Assumes that you have installed oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh

* Replaces `~/.zshrc` with a link to the one in this repository. Do not edit this file, instead, edit `~/.zshrc.local`, which is sourced by `~/.zshrc`. This enables all systems to use this repo's `.zshrc`, with the ability to override/add configration to `.zshrc.local`
* Adds `zsh/custom/*.zsh` to `~/.oh-my-zsh/custom/`

## VIM

Assumes that you have installed dotvim: https://github.com/astrails/dotvim

* Links `~/.vimrc.before` and `~/.vimrc.after` to their respective files in this repository