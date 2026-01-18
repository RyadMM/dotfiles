# Vi mode (load autosuggestions → highlighting → vi mode in order)
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey -v

# Starship vi mode indicator (updates prompt on mode change)
function zle-keymap-select { zle reset-prompt; zle -R }
function zle-line-init { zle reset-prompt; zle -R }
zle -N zle-keymap-select
zle -N zle-line-init

# Emacs-style convenience keys (Ctrl-A: home, Ctrl-E: end, Ctrl-K: kill line)
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' kill-line
