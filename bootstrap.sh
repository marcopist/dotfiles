#!/usr/bin/env bash

# Bootstrap script to setup dotfiles
git_dir="$HOME/.dotfiles"

# Define the alias for this session
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Clone the repository as a bare repo if not already cloned
if [ ! -d "$git_dir" ]; then
    echo "Cloning dotfiles repository..."
    git clone --bare git@github.com:YOUR_USERNAME/dotfiles.git "$git_dir"
fi

# Configure the local repository to ignore untracked files
config config --local status.showUntrackedFiles no

# Checkout the configuration files (WARNING: will overwrite existing files)
echo "Checking out dotfiles..."
config checkout

echo "Dotfiles setup complete. Please restart your shell."
