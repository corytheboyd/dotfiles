# Git

## .gitconfig

Global `git` configuration.

If you want to override the global configuraiton on a single machine, you should do so in `~/.zshrc.local`:

```
# Override global git config with my work email address
git config --global user.email corytheboyd@company-name.com
```

## .gitignore

Globally ignored files, which is sourced by `~/.gitconfig`.
