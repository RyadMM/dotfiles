# Zsh options & completion

# History (shared across sessions, immediate save, timestamps)
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# Vi mode timeout (50ms for instant Esc/Ctrl+[ response)
KEYTIMEOUT=5

# Completion system (fuzzy matching: "fobar" → "foobar")
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Completions path (XDG-compliant)
fpath=($HOME/.local/share/zsh/completions $fpath)
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
