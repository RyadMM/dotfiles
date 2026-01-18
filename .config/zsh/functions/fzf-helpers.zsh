# =============================================================================
# FZF-HELPER FUNCTIONS
# =============================================================================
# Productivity functions that use fzf for fuzzy file finding and operations.
# =============================================================================

# ------------------------------------------------------------------------------
# fcp - Fuzzy Copy Path
# ------------------------------------------------------------------------------
# Find a file using fzf and copy its absolute path to clipboard.
#
# USAGE: fcp [initial-query]
#   - Optional: provide initial search query
#   - Uses fd (fast du) for file finding
#   - Copies path to system clipboard (pbcopy on macOS)
#
# EXAMPLES:
#   fcp          # Interactive file search
#   fcp README   # Pre-fill search with "README"
# ------------------------------------------------------------------------------
fcp() {
  local file
  file=$(fd --type f --hidden --exclude .git --absolute-path | fzf --query="$1")

  if [ -n "$file" ]; then
    echo -n "$file" | pbcopy
    echo ">> COPIED: $file"
  fi
}

# ------------------------------------------------------------------------------
# fx - Fuzzy Execute (Interactive File Browser)
# ------------------------------------------------------------------------------
# Find a file using fzf and take action on it. Supports viewing, editing,
# copying path/content, etc.
#
# USAGE: fx [initial-query]
#   - Opens fzf file browser with preview
#   - Press Enter to view file (bat/cat)
#   - Press Ctrl-Y to copy file path to clipboard
#   - Press Ctrl-X to copy file content to clipboard
#   - Press Ctrl-O to copy @file reference (for Obsidian/Claude-style refs)
#   - Press Ctrl-E to edit file in $EDITOR (nvim)
#
# DEPENDENCIES: fd (file finder), bat (syntax highlighting), fzf
# ------------------------------------------------------------------------------
fx() {
  local file key out
  local viewer="cat"

  # Use bat for syntax highlighting if available
  if command -v bat >/dev/null; then
    viewer="bat --style=numbers --color=always"
  fi

  out=$(fd --type f --hidden --exclude .git | fzf \
    --query="$1" \
    --expect=ctrl-y,ctrl-x,ctrl-e,ctrl-o \
    --preview 'echo "Lines: $(wc -l < {})" && bat --style=numbers --color=always {}' \
    --preview-window=right:60% \
    --header="CTRL-Y: copy path | CTRL-X: copy content | CTRL-O: copy @file ref | CTRL-E: edit | ENTER: view")

  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)

  if [ -n "$file" ]; then
    case $key in
      ctrl-y)
        echo -n "$file" | pbcopy
        echo ">> COPIED PATH: $file"
        ;;
      ctrl-x)
        cat "$file" | pbcopy
        echo ">> COPIED CONTENT: $file"
        ;;
      ctrl-o)
        # Obsidian/Claude-style reference: @/absolute/path/to/file
        echo -n "@$file" | pbcopy
        echo ">> COPIED REF: @$file"
        ;;
      ctrl-e)
        $EDITOR "$file"
        ;;
      *)
        eval "$viewer '$file'"
        ;;
    esac
  fi
}

# ------------------------------------------------------------------------------
# zai - Claude Provider Switch
# ------------------------------------------------------------------------------
# Switch Claude API calls to use z.ai provider instead of Anthropic directly.
# Useful for accessing different models or routing through alternative provider.
#
# USAGE: zai [claude-args...]
#   - Forwards all arguments to claude CLI
#   - Uses ZSH_ZAI_API_KEY environment variable for authentication
#
# ENV VAR: Set ZSH_ZAI_API_KEY in ~/.config/zsh/env.zsh or shell
# ------------------------------------------------------------------------------
zai() {
  (
    export ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic
    export ANTHROPIC_AUTH_TOKEN=$ZSH_ZAI_API_KEY
    claude "$@"
  )
}
