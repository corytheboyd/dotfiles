@bootstrap:
    ./script/bootstrap.sh

@update:
    chezmoi update
    brew bundle

@sync_vscodium_settings:
    chezmoi re-add ~/.config/VSCodium/User/settings.json

@sync: sync_vscodium_settings
