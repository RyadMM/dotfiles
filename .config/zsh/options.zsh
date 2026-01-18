# =============================================================================
# ZSH OPTIONS & COMPLETION
# =============================================================================
# Configures zsh behavior, history settings, and completion system.
# Loaded after env.zsh - some completion paths may depend on PATH.
# =============================================================================

# ------------------------------------------------------------------------------
# History Options
# ------------------------------------------------------------------------------
# WHY: These settings create a shared, efficient command history across all
# shell sessions. Commands are saved immediately with timestamps.
#
# EXTENDED_HISTORY: Save timestamp and elapsed time for each command
# INC_APPEND_HISTORY: Append to history immediately (not on shell exit)
# SHARE_HISTORY: Share history across all zsh sessions
# HIST_IGNORE_DUPS: Don't save duplicate consecutive commands
# HIST_IGNORE_SPACE: Commands starting with space aren't saved (for sensitive cmds)
# HIST_REDUCE_BLANKS: Remove extra blanks before saving
# ------------------------------------------------------------------------------
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# ------------------------------------------------------------------------------
# Vi Mode Key Timeout
# ------------------------------------------------------------------------------
# WHY: Reduces delay after pressing Esc/Ctrl+[ before switching to normal mode.
# Default is 40 (400ms delay - very noticeable). Setting to 5 (50ms) makes
# mode switching feel instant.
#
# Use Ctrl+[ (or Esc) to switch from insert to normal mode.
# ------------------------------------------------------------------------------
KEYTIMEOUT=5

# ------------------------------------------------------------------------------
# Completion System
# ------------------------------------------------------------------------------
# WHY: zsh completion is powerful but needs initialization. compinit loads
# the completion system and must be sourced before any completion plugins.
#
# The matcher-list enables fuzzy completion - type "fobar" to match "foobar"
# ------------------------------------------------------------------------------
autoload -Uz compinit && compinit

# Case-insensitive, partial-word, substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# ------------------------------------------------------------------------------
# Completion Paths
# ------------------------------------------------------------------------------
# WHY: Add third-party completion directories to fpath so zsh can find them.
# Uses XDG Base Directory specification for portability.
#
# XDG_COMPLETIONS: Standard path for third-party completions (~/.local/share/zsh/completions/)
# Docker: CLI completions for docker commands
# Bun: JavaScript runtime completions
# ------------------------------------------------------------------------------
fpath=($HOME/.local/share/zsh/completions $fpath)

# Bun completions (if installed)
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
