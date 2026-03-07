@sync_vscodium_settings:
    chezmoi re-add ~/.config/VSCodium/User/settings.json

@sync: sync_vscodium_settings

@update: sync
    #!/usr/bin/env bash
    cat banner.txt
    #chezmoi update
