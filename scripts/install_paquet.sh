#!/usr/bin/env bash

set -euo pipefail

need_cmd() { command -v "$1" >/dev/null 2>&1; }

install_pkg()
{
    local pkg="$1"
    if dpkg -s "$pkg" >/dev/null 2>&1; then
        echo "✅ $pkg is install."
    else
       echo "⬇️  Install $pkg..."
        sudo apt-get update -y
        sudo apt-get install -y "$pkg"
    fi
}

install_pkg git zsh
install_pkg zsh
install_pkg curl

# Installer Oh My Zsh pour l'utilisateur actuel
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "✅Installation de Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh déjà installé"
fi

# Changer le shell par défaut
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changement du shell par défaut vers Zsh..."
    chsh -s "$(which zsh)"
fi