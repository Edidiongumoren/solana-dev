#!/bin/bash

# ===== COMPLETE SOLANA DEVELOPMENT ENVIRONMENT =====
set -e  # Exit on error

# 1. Install System Dependencies
echo "🔵 Installing system dependencies..."
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev pkg-config

# 2. Install Node.js (v18)
echo "📦 Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# 3. Install Rust
echo "🦀 Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
rustup component add rust-sbf rustfmt clippy

# 4. Install Solana CLI
echo "🔗 Installing Solana CLI..."
sh -c "$(curl -sSfL https://release.solana.com/v1.18.0/install)"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
echo 'export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"' >> ~/.bashrc

# 5. Install Anchor
echo "⚓ Installing Anchor..."
cargo install --git https://github.com
