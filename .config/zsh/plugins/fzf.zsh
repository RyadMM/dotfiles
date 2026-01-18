# FZF configuration

# Default options (40% height, reverse layout, vim navigation)
export FZF_DEFAULT_OPTS='
  --height 40%
  --layout=reverse
  --bind=ctrl-j:down
  --bind=ctrl-k:up
  --bind=ctrl-d:half-page-down
  --bind=ctrl-u:half-page-up
'

# Shell integration (Ctrl-T: files, Ctrl-R: history, Alt-C: dirs)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alt+H: Fuzzy file search INCLUDING hidden files
# Complement to Ctrl+T which only shows non-hidden files
__fzf_hidden_files__() {
  local file
  file=$(fd --type f --hidden --exclude .git | fzf --prompt '(hidden)> ')
  [[ -n "$file" ]] && print -z "$file"
}

zle     -N   __fzf_hidden_files__
bindkey '^[h' __fzf_hidden_files__  # Alt+H
