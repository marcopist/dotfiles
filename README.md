# Dotfiles Repository

This repository tracks my home directory configuration files using a bare git repository.

## Installation on a new machine

Run the following command to automatically install your dotfiles:

```bash
curl -L  https://raw.githubusercontent.com/marcopist/dotfiles/refs/heads/master/bootstrap.sh| bash
```

*WARNING: This will clone your dotfiles repository to `$HOME/.dotfiles` and overwrite existing configuration files in your `$HOME` directory.*
