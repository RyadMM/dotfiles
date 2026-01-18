# =============================================================================
# ZSH CONFIGURATION ENTRY POINT
# =============================================================================
# This file sources all configuration modules in dependency order.
#
# For customization, edit individual modules or create ~/.config/zsh/local.zsh
# Local overrides are loaded last and take precedence.
#
# MODULE STRUCTURE:
#   1. env.zsh        - Environment variables (PATH, EDITOR, etc.)
#   2. options.zsh    - Zsh options (history, completion, etc.)
#   3. prompt.zsh     - Starship prompt initialization
#   4. plugins/       - Third-party integrations (fzf, vi-mode, etc.)
#   5. functions/     - User-defined functions and aliases
#   6. local.zsh      - Machine-specific overrides (gitignored)
# =============================================================================

# 1. Environment (must be first - sets up PATH, etc.)
source ~/.config/zsh/env.zsh

# 2. Zsh options (depends on env for some paths)
source ~/.config/zsh/options.zsh

# 3. Prompt (starship - lightweight, fast)
source ~/.config/zsh/prompt.zsh

# 4. Plugins (fzf, vi-mode)
source ~/.config/zsh/plugins/fzf.zsh
source ~/.config/zsh/plugins/vi-mode.zsh

# 5. Functions (tm, fzf-helpers, aliases)
source ~/.config/zsh/functions/tm.zsh
source ~/.config/zsh/functions/fzf-helpers.zsh
source ~/.config/zsh/functions/aliases.zsh

# 6. Local overrides (machine-specific, loaded last)
# Create this file for personal customizations that shouldn't be shared
[ -f ~/.config/zsh/local.zsh ] && source ~/.config/zsh/local.zsh
