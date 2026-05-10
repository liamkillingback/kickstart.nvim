#!/usr/bin/env bash
set -euo pipefail

NVIM_CONFIG_DIR="$HOME/.config/nvim"

echo "Installing kickstart.nvim to $NVIM_CONFIG_DIR"

mkdir -p "$HOME/.config"

if [ -e "$NVIM_CONFIG_DIR" ] || [ -L "$NVIM_CONFIG_DIR" ]; then
  rm -rf "$NVIM_CONFIG_DIR"
fi

ln -s "$(pwd)" "$NVIM_CONFIG_DIR"

echo "kickstart.nvim installed."
