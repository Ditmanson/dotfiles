#!/usr/bin/env bash
# Bootstrap this dotfiles repo onto a new machine.
#
#   git clone https://github.com/Ditmanson/dotfiles.git ~/dotfiles
#   ~/dotfiles/install.sh
#
# Installs Homebrew (if missing), then stow/neovim/tmux/fzf/ripgrep/fd/
# tree-sitter-cli via brew, backs up any existing ~/.bashlib, ~/.tmux.conf,
# ~/.config/nvim, wires the bashrc loader line, and runs `stow` for all
# three packages. Safe to re-run — every step is idempotent.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/dotfiles-deploy-backup-$(date +%Y%m%d-%H%M%S)"
NEEDED_BACKUP=0

echo "==> Using dotfiles repo at $REPO_DIR"

# --- Homebrew ---
if ! command -v brew >/dev/null 2>&1; then
    echo "==> Installing Homebrew"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    elif [ -x /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "==> Homebrew already installed"
fi

# --- Packages ---
echo "==> Installing stow, neovim, tmux, fzf, ripgrep, fd, tree-sitter-cli"
brew install stow neovim tmux fzf ripgrep fd tree-sitter-cli

# --- Back up anything already in the way (real files/dirs, not our own symlinks) ---
backup_if_real() {
    local path="$1"
    if [ -e "$path" ] && [ ! -L "$path" ]; then
        mkdir -p "$BACKUP_DIR"
        NEEDED_BACKUP=1
        echo "==> Backing up existing $path -> $BACKUP_DIR/"
        mv "$path" "$BACKUP_DIR/$(basename "$path")"
    fi
}

backup_if_real "$HOME/.bashlib"
backup_if_real "$HOME/.tmux.conf"
backup_if_real "$HOME/.config/nvim"

if [ "$NEEDED_BACKUP" = "1" ]; then
    echo "==> Existing configs backed up to $BACKUP_DIR"
fi

# --- Deploy via stow ---
echo "==> Running stow"
mkdir -p "$HOME/.config"
(cd "$REPO_DIR" && stow -v bashlib nvim tmux)

# --- Wire the bashrc loader (idempotent) ---
if [ -f "$HOME/.bashrc" ] && ! grep -q 'source ~/.bashlib/loader.sh' "$HOME/.bashrc"; then
    echo "==> Adding loader line to ~/.bashrc"
    printf '\nsource ~/.bashlib/loader.sh\n' >> "$HOME/.bashrc"
else
    echo "==> ~/.bashrc already sources the loader (or doesn't exist yet)"
fi

echo "==> Done. Open a new shell, or run: source ~/.bashrc"
