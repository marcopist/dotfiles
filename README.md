# Dotfiles Repository

This repository tracks my home directory configuration files using a bare git repository.

## Installation on a new machine

1. Clone the repository and run the bootstrap script:
   ```bash
   git clone https://github.com/marcopist/dotfiles.git /tmp/dotfiles && /tmp/dotfiles/bootstrap.sh
   ```

3. The script will:
   - Clone your repository to `$HOME/.dotfiles`.
   - Configure the repository to ignore untracked files in your home directory.
   - Checkout your configuration files into your `$HOME`.

*WARNING: The `config checkout` command in the bootstrap script will overwrite existing files with the same names in your home directory.*
