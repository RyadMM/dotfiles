# FZF Helper Functions

# fcp - Copy file path to clipboard (fzf + fd)
fcp() {
  local file
  file=$(fd --type f --hidden --exclude .git --absolute-path | fzf --query="$1")
  if [ -n "$file" ]; then
    echo -n "$file" | pbcopy
    echo ">> COPIED: $file"
  fi
}

# fx - Interactive file browser (view, edit, copy)
# Enter: view | Ctrl-Y: copy path | Ctrl-X: copy content | Ctrl-O: copy @ref | Ctrl-E: edit
fx() {
  local file key out
  local viewer="cat"

  command -v bat >/dev/null && viewer="bat --style=numbers --color=always"

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
      ctrl-y) echo -n "$file" | pbcopy; echo ">> COPIED PATH: $file" ;;
      ctrl-x) cat "$file" | pbcopy; echo ">> COPIED CONTENT: $file" ;;
      ctrl-o) echo -n "@$file" | pbcopy; echo ">> COPIED REF: @$file" ;;
      ctrl-e) $EDITOR "$file" ;;
      *) eval "$viewer '$file'" ;;
    esac
  fi
}

# zai - Claude API provider switch (z.ai)
# Requires: ZSH_ZAI_API_KEY env var
zai() {
  (
    export ANTHROPIC_BASE_URL=https://api.z.ai/api/anthropic
    export ANTHROPIC_AUTH_TOKEN=$ZSH_ZAI_API_KEY
    claude "$@"
  )
}
