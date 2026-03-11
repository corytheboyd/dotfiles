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

## Syncing local changes back to chezmoi

For example, VSCode settings changed in IDE, but are tracked by chezmoi.

The chezmoi command is:

```shell
chezmoi re-add $FILE
```

I have standardized it to `mise run sync` though in the `~/.config/chezmoi-corytheboyd` directory. See [private_dot_config/chezmoi-corytheboyd/mise.toml](private_dot_config/chezmoi-corytheboyd/mise.toml) for example.
