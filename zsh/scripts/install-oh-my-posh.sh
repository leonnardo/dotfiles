#!/bin/bash

# =============================================================================
# Oh My Posh Installation Script
# =============================================================================
# Installs Oh My Posh prompt theme engine
# Supports Arch Linux (via yay) and macOS (via brew)

set -e  # Exit on any error

# Check if oh-my-posh is already installed
if command -v oh-my-posh >/dev/null 2>&1; then
    echo "✅ oh-my-posh is already installed"
    echo "ℹ️  Current version: $(oh-my-posh version)"
    exit 0
fi

echo "🔄 Installing Oh My Posh..."

# Detect platform and install accordingly
if grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null && grep -qi "arch" /etc/os-release; then
    # WSL Arch Linux - use yay
    echo "🐧 Detected WSL Arch Linux, installing via yay..."
    
    if ! command -v yay >/dev/null 2>&1; then
        echo "❌ yay is not installed. Please install yay first."
        exit 1
    fi
    
    yay -S oh-my-posh --noconfirm
    
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS - use brew
    echo "🍎 Detected macOS, installing via Homebrew..."
    
    if ! command -v brew >/dev/null 2>&1; then
        echo "❌ Homebrew is not installed. Please install Homebrew first."
        exit 1
    fi
    
    brew install oh-my-posh
    
elif grep -qi "arch" /etc/os-release; then
    # Native Arch Linux - use pacman/yay
    echo "🐧 Detected Arch Linux, installing via yay..."
    
    if command -v yay >/dev/null 2>&1; then
        yay -S oh-my-posh --noconfirm
    elif command -v paru >/dev/null 2>&1; then
        paru -S oh-my-posh --noconfirm
    else
        echo "❌ No AUR helper found. Please install yay or paru first."
        exit 1
    fi
    
else
    echo "❌ Unsupported platform for automatic installation"
    echo "ℹ️  Please install oh-my-posh manually from: https://ohmyposh.dev/docs/installation/"
    exit 1
fi

echo "✅ oh-my-posh installation completed successfully!"
echo "ℹ️  Installed version: $(oh-my-posh version)"