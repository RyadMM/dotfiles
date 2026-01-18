# =============================================================================
# COMMAND ALIASES
# =============================================================================
# Convenient shortcuts for common commands.
# =============================================================================

# ------------------------------------------------------------------------------
# File Listing
# ------------------------------------------------------------------------------
# WHY: eza (formerly exa) is a modern replacement for ls with better colors,
# git integration, and performance. Falls back to ls if eza not installed.
# ------------------------------------------------------------------------------
alias 'ls'='eza'

# ------------------------------------------------------------------------------
# Clipboard
# ------------------------------------------------------------------------------
# WHY: Shorter alias for pbcopy (macOS clipboard command). More intuitive than
# remembering "pbcopy" which stands for "paste board copy".
# ------------------------------------------------------------------------------
alias 'clip'='pbcopy'

# ------------------------------------------------------------------------------
# Shell Management
# ------------------------------------------------------------------------------
# WHY: Quick aliases for common shell operations.
#   r  = Reload shell config (faster than closing/opening terminal)
#   cl = Clear screen (shorter than "clear")
# ------------------------------------------------------------------------------
alias 'r'='source ~/.config/zsh/init.zsh'
alias 'cl'='clear'
