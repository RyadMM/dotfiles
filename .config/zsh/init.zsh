# Zsh configuration entry point

source ~/.config/zsh/env.zsh
source ~/.config/zsh/options.zsh
source ~/.config/zsh/prompt.zsh
source ~/.config/zsh/plugins/fzf.zsh
source ~/.config/zsh/plugins/vi-mode.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions/fzf.zsh
source ~/.config/zsh/functions/tmux.zsh
source ~/.config/zsh/functions/diff.zsh

[ -f ~/.config/zsh/local.zsh ] && source ~/.config/zsh/local.zsh
