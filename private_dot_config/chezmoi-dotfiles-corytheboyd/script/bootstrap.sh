#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

function install_oh_my_zsh() {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_oh_my_zsh
