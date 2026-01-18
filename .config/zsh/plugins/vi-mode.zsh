# =============================================================================
# VI MODE CONFIGURATION
# =============================================================================
# Enables vi-style command line editing in zsh. Provides Vim-like navigation
# and editing capabilities at the command line.
#
# NOTE: Must be loaded AFTER zsh-autosuggestions and zsh-syntax-highlighting
# so those plugins work correctly with vi mode.
# =============================================================================

# ------------------------------------------------------------------------------
# ZSH PLUGINS (order matters: autosuggestions → highlighting → vi mode)
# ------------------------------------------------------------------------------
# WHY: This order ensures plugins work correctly with vi mode.
#   - zsh-autosuggestions: Provides auto-completion suggestions based on history
#   - zsh-syntax-highlighting: Syntax highlighting for commands as you type
#   - vi mode: Must be last to avoid conflicts
# ------------------------------------------------------------------------------
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ------------------------------------------------------------------------------
# Vi Mode Activation
# ------------------------------------------------------------------------------
# WHY: Vi mode provides powerful command line editing with Vim-like navigation.
# Use Ctrl+[ (same as Esc) to switch from insert to normal mode.
# With KEYTIMEOUT=5, mode switching feels instant.
# ------------------------------------------------------------------------------
bindkey -v

# ------------------------------------------------------------------------------
# Starship Vi Mode Indicator Fix
# ------------------------------------------------------------------------------
# WHY: Starship's vimcmd_symbol needs to update when switching vi modes.
# This widget triggers a prompt redraw on mode change.
#
# Without this, the prompt character (❯ vs ❮) won't update when you press
# Esc to enter normal mode or i to enter insert mode.
# ------------------------------------------------------------------------------
function zle-keymap-select {
  zle reset-prompt
  zle -R
}
zle -N zle-keymap-select

# Also update prompt on line editor init
function zle-line-init {
  zle reset-prompt
  zle -R
}
zle -N zle-line-init

# ------------------------------------------------------------------------------
# Hybrid Keybindings (Best of Both Worlds)
# ------------------------------------------------------------------------------
# WHY: Pure vi mode lacks some convenience keys. These additions make it more
# practical without leaving vi mode.
#
#   Ctrl-A: Beginning of line (emacs-style, faster than vi 0)
#   Ctrl-E: End of line (emacs-style, faster than vi $)
#   Ctrl-K: Kill to end of line (emacs-style, faster than vi D)
# ------------------------------------------------------------------------------
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' kill-line
