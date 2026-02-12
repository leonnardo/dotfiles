#!/bin/bash

# =============================================================================
# YAY AUR Helper Installation Script
# =============================================================================
# Installs yay (Yet Another Yaourt) AUR helper on Arch Linux WSL
# Only runs on WSL Arch Linux systems when yay is not already installed

set -e  # Exit on any error

# Check if yay is already installed
if command -v yay >/dev/null 2>&1; then
    echo "✅ yay is already installed"
    exit 0
fi

# Check if we're on WSL Arch Linux
if ! grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null; then
    echo "❌ Not running on WSL, skipping yay installation"
    exit 0
fi

if ! grep -qi "arch" /etc/os-release; then
    echo "❌ Not running on Arch Linux, skipping yay installation"
    exit 0
fi

echo "🔄 Installing yay AUR helper..."

# Create temporary directory for installation
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Clone yay-bin from AUR
echo "📥 Cloning yay-bin repository..."
git clone https://aur.archlinux.org/yay-bin.git

cd yay-bin

# Build and install yay
echo "🔨 Building and installing yay..."
makepkg -si --noconfirm

# Configure yay
echo "⚙️  Configuring yay..."
yay -Y --gendb
yay -Y --devel --save

# Cleanup
cd "$HOME"
rm -rf "$TEMP_DIR"

echo "✅ yay installation completed successfully!"