#!/bin/bash

# =============================================================================
# Starship Installation Script
# =============================================================================
# Installs Starship prompt
# Supports Arch Linux (via pacman/yay/paru) and macOS (via brew)

set -e

if command -v starship >/dev/null 2>&1; then
    echo "✅ starship is already installed"
    echo "ℹ️  Current version: $(starship --version)"
    exit 0
fi

echo "🔄 Installing Starship..."

if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null && grep -qi "arch" /etc/os-release; then
    echo "🐧 Detected WSL Arch Linux, installing via pacman/AUR helper..."

    if command -v yay >/dev/null 2>&1; then
        yay -S starship --noconfirm
    elif command -v paru >/dev/null 2>&1; then
        paru -S starship --noconfirm
    else
        sudo pacman -S starship --noconfirm
    fi

elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🍎 Detected macOS, installing via Homebrew..."

    if ! command -v brew >/dev/null 2>&1; then
        echo "❌ Homebrew is not installed. Please install Homebrew first."
        exit 1
    fi

    brew install starship

elif grep -qi "arch" /etc/os-release; then
    echo "🐧 Detected Arch Linux, installing via pacman/AUR helper..."

    if command -v yay >/dev/null 2>&1; then
        yay -S starship --noconfirm
    elif command -v paru >/dev/null 2>&1; then
        paru -S starship --noconfirm
    else
        sudo pacman -S starship --noconfirm
    fi

else
    echo "❌ Unsupported platform for automatic installation"
    echo "ℹ️  Please install Starship manually from: https://starship.rs/"
    exit 1
fi

echo "✅ Starship installation completed successfully!"
echo "ℹ️  Installed version: $(starship --version)"
