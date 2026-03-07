# dotfiles

"Pretty good" declarative configuration for computers using `chezmoi`.

First time install:

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply corytheboyd
```

Once installed, update:

```shell
chezmoi_corytheboyd_update
```

## Manual Steps

### Alfred

Set Alfred preferences directory to `~/.local/share/alfred`:

![Alfred settings](alfred-settings.png)

## chezmoi

Override default template delimiters in shell scripts so that we can execute shellcheck against them.

```shell
# chezmoi:template:left-delimiter="#{{" right-delimiter=}}
```

<https://www.chezmoi.io/reference/templates/directives/#delimiters>
