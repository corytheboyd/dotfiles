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

`chezmoid cd` needs to be told to use zsh. Add to `~/.config/chezmoi/chezmoi.toml`:

```shell
[cd]
command = "/usr/bin/zsh"
```

<https://www.chezmoi.io/reference/configuration-file/variables/#cd-command>

## Darwin

### Homebrew

Specify packages local to the machine in `~/.config/chezmoi/chezmoi.toml`:

```toml
[data.homebrew]
    taps = []
    brews = []
    casks = []
```

Otherwise, ad-hoc installed brews will be uninstalled, so that all software is accounted for in configuration.

## Arch

### timeshift

`timeshift` is the program creating btrfs backups. Install and use the CLI to restore as well.
