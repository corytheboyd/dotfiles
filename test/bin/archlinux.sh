#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

docker compose run -it --rm --build --remove-orphans archlinux \
    sh -c "$(curl -fsLS get.chezmoi.io)" -- init --source /chezmoi-source --apply
