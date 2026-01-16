#!/usr/bin/env bash
# 20-shell-zsh.sh - Configuration de Zsh et Oh My Zsh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIB_DIR="$(dirname "$SCRIPT_DIR")/lib"

# Charger les fonctions communes
source "$LIB_DIR/common.sh"
source "$LIB_DIR/apt.sh"

log_info "Configuration de Zsh..."

# Installer Zsh
apt_install zsh git curl

# Installer Oh My Zsh pour l'utilisateur actuel
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log_info "Installation de Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    log_info "Oh My Zsh déjà installé"
fi

# Changer le shell par défaut
if [ "$SHELL" != "$(which zsh)" ]; then
    log_info "Changement du shell par défaut vers Zsh..."
    chsh -s "$(which zsh)"
fi

log_success "Configuration de Zsh terminée!"
