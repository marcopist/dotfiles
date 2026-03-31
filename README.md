# Dotfiles Repository

This repository tracks my home directory configuration files using a bare git repository.

## Installation on a new machine

1. Create the alias for your shell:
   `alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

2. Clone the repository as a bare repo:
   `git clone --bare <your-repo-url> $HOME/.dotfiles`

3. Configure the local repository to ignore untracked files:
   `config config --local status.showUntrackedFiles no`

4. Checkout the configuration files (this will overwrite existing files):
   `config checkout`
