# =============================================================================
# ENVIRONMENT VARIABLES
# =============================================================================
# Sets up PATH, editor, and other shell environment variables.
# Loaded first by init.zsh - other modules may depend on these values.
# =============================================================================

# ------------------------------------------------------------------------------
# Homebrew (must be first for PATH)
# ------------------------------------------------------------------------------
# Homebrew needs to be initialized before other PATH modifications because
# many tools depend on binaries installed via brew.
# ------------------------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

# ------------------------------------------------------------------------------
# XDG Base Directory Specification
# ------------------------------------------------------------------------------
# Standardizes location of user data files. See:
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# ------------------------------------------------------------------------------
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# ------------------------------------------------------------------------------
# Editor
# ------------------------------------------------------------------------------
# Neovim as default editor - used by git, other CLI tools that respect $EDITOR
# ------------------------------------------------------------------------------
export EDITOR="nvim"

# ------------------------------------------------------------------------------
# PATH (single source of truth)
# ------------------------------------------------------------------------------
# Priority order (highest to lowest priority):
# 1. antigravity (user's custom tools)
# 2. bun (JavaScript runtime/package manager)
# 3. local bin (user scripts)
# 4. opencode (workspace tool)
# 5. pnpm (Node package manager)
# 6. local claude (AI CLI tool)
#
# NOTE: Duplicate entries removed for efficiency. Add new paths here only.
# ------------------------------------------------------------------------------
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"
export PATH="$HOME/.claude/local:$PATH"

# pnpm (managed by pnpm itself, added here for shell initialization)
export PNPM_HOME="/Users/ryad/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ------------------------------------------------------------------------------
# History
# ------------------------------------------------------------------------------
# WHY: These settings create a shared, efficient command history across all
# shell sessions. Commands are saved immediately and shared between sessions.
#
# HISTFILE: Custom location avoids conflicts with default zsh history
# HISTSIZE/SAVEHIST: 10,000 lines provides good balance of utility vs memory
# ------------------------------------------------------------------------------
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# ------------------------------------------------------------------------------
# ZAI (Claude provider switch)
# ------------------------------------------------------------------------------
# API key for z.ai Claude provider wrapper
# Allows switching between Anthropic and z.ai providers
# ------------------------------------------------------------------------------
export ZSH_ZAI_API_KEY="${ZSH_ZAI_API_KEY:-}"

# ------------------------------------------------------------------------------
# Dotfiles Management (Bare Repo)
# ------------------------------------------------------------------------------
# Use 'config' like 'git' to manage dotfiles in place.
# Example: config status, config add .vimrc, config commit -m "message"
# ------------------------------------------------------------------------------
alias config='/usr/bin/git --git-dir=$HOME/.local/share/dotfiles-repo/ --work-tree=$HOME'
