#!/bin/bash

# Fonction pour vérifier et installer Homebrew sur macOS
installer_homebrew() {
    echo "Vérification de Homebrew..."
    if test ! $(which brew); then
        echo "Installation de Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew est déjà installé."
    fi
    brew update
    brew upgrade
}

# Fonction pour installer les outils via Homebrew
installer_outils() {
    echo "Installation des outils..."
    brew install git gh tmux pandoc tree cheat npm pdfgrep ripgrep fd sioyek
    brew install koekeishiya/formulae/skhd
    brew install koekeishiya/formulae/yabai
    echo "Outils installés."
}

# Installation de Neovim
installer_neovim() {
    echo "Installation de Neovim..."
    brew install neovim
    echo "Neovim installé."
}

# Configuration de tmux et tpm
configurer_tmux() {
    echo "Configuration de tmux et TPM..."
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    else
        echo "TPM est déjà configuré."
    fi
}

# Vérification du système d'exploitation
if [ "$(uname)" == "Darwin" ]; then
    echo "Ce script est exécuté sur macOS."
    installer_homebrew
    installer_outils
    installer_neovim
    configurer_tmux
else
    echo "Ce script est conçu pour macOS. Votre système d'exploitation n'est pas pris en charge."
fi

echo "Script d'installation terminé."
