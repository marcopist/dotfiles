#!/usr/bin/env bash

# Bootstrap script to setup dotfiles
git_dir="$HOME/.dotfiles"

# Define the alias function for this session
dotfiles() {
    /usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME" "$@"
}

# Clone the repository as a bare repo if not already cloned
if [ ! -d "$git_dir" ]; then
    echo "Cloning dotfiles repository..."
    # Replace the URL below with your actual repository URL
    git clone --bare https://github.com/marcopist/dotfiles.git "$git_dir"
fi

# Configure the local repository to ignore untracked files
dotfiles config --local status.showUntrackedFiles no

# Checkout the configuration files (WARNING: will overwrite existing files)
echo "Checking out dotfiles..."
dotfiles checkout -f

if [ $? -eq 0 ]; then
    echo "Dotfiles setup complete. Please restart your shell."
else
    echo "Error: Failed to checkout dotfiles. You may have existing files that conflict."
    echo "Try backing up any existing configuration files that might conflict."
fi
