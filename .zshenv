# ~/.config/zsh/.zshenv

# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

# ---------- Pager ----------
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="batcat -l man -p"
fi

# ---------- GPG ----------
export GPG_TTY=$(tty)

# ---------- Starship ----------
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship.toml"

# ---------- PATH ----------
# Personal binaries/scripts
export PATH="$HOME/.local/bin:$HOME/.opencode/bin:$PATH"

if [ -e /home/marcopist/.nix-profile/etc/profile.d/nix.sh ]; then . /home/marcopist/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# ---------- SSH tmux ----------
# Give interactive SSH logins a persistent workspace. `-A` attaches to the
# existing session or creates it when it is not present.
if [[ -o interactive && -n "$SSH_TTY" && -z "$TMUX" ]] && command -v tmux >/dev/null 2>&1; then
  exec tmux new-session -A -s base
fi
