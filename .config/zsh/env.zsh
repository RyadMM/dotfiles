# Environment variables

# Homebrew first (other PATH entries depend on it)
eval "$(/opt/homebrew/bin/brew shellenv)"

# XDG Base Directory
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Editor
export EDITOR="nvim"

# PATH (priority: antigravity > bun > local > opencode > pnpm > claude)
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"
export PATH="$HOME/.claude/local:$PATH"

export PNPM_HOME="/Users/ryad/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# History (XDG-compliant location, shared across sessions)
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# ZAI Claude provider (requires ZSH_ZAI_API_KEY)
export ZSH_ZAI_API_KEY="${ZSH_ZAI_API_KEY:-}"

# Dotfiles management (use 'config' like 'git')
alias config='/usr/bin/git --git-dir=$HOME/.local/share/dotfiles-repo/ --work-tree=$HOME'
