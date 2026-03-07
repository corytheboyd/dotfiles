# dotfiles

"Pretty good" declarative configuration for computers using `chezmoi`.

## Bootstrap

1. Install [homebrew](https://brew.sh/)
1. Run `brew bundle`
1. Run `just bootstrap`

From there, it's [`chezmoi`](https://www.chezmoi.io/).

## Manual Steps

### Alfred

Set Alfred preferences directory to `~/.local/share/alfred`:

![Alfred settings](alfred-settings.png)

## Sync

Changes to files managed by chezmoi need to be synced back manually.

For that, added a `sync` command to `justfile`.

## chezmoi

Override default template delimiters in shell scripts so that we can execute shellcheck against them.

```shell
# shellcheck disable=SC2148
# use custom chezmoi delimiters that are shell script syntax compatible
# chezmoi:template:left-delimiter="#### {{" right-delimiter=}}
```

<https://www.chezmoi.io/reference/templates/directives/#delimiters>
