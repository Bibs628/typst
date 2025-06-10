#!/bin/bash

# Check for package manager and install Typst dependencies
if command -v apt &> /dev/null; then
    echo "📦 Using apt package manager."
    sudo apt update
    sudo apt install -y typst
elif command -v pacman &> /dev/null; then
    echo "📦 Using pacman package manager."
    sudo pacman -Syu typst
elif command -v dnf &> /dev/null; then
    echo "📦 Using dnf package manager."
    sudo dnf install -y typst
else
    echo "❌ Kein unterstützter Paketmanager gefunden. Bitte installiere Typst manuell."
    exit 1
fi

echo "✅ Typst wurde erfolgreich installiert."