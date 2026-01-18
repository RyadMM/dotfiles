# Dotfiles

Configuration files managed via bare git repository with XDG-compliant directory structure.

## Architecture

Uses bare repository pattern: git directory at `$HOME/.local/share/dotfiles-repo/`, worktree at `$HOME/`. Separates git metadata from tracked files, maintaining dotfiles in their native locations.

## Setup

```sh
# Clone bare repository
git clone --bare https://github.com/RyadMM/dotfiles.git $HOME/.local/share/dotfiles-repo

# Configure git to ignore untracked files
git --git-dir=$HOME/.local/share/dotfiles-repo/ --work-tree=$HOME config status.showUntrackedFiles no

# Add shell alias
echo "alias config='/usr/bin/git --git-dir=\$HOME/.local/share/dotfiles-repo/ --work-tree=\$HOME'" >> ~/.config/zsh/aliases.zsh

# Checkout files
config checkout
```

## Structure

```
.config/
├── zsh/          # Zsh shell configuration
│   ├── init.zsh  # Entry point
│   ├── env.zsh   # Environment variables
│   ├── options.zsh
│   ├── prompt.zsh
│   ├── aliases.zsh
│   └── functions/ # Modular functions
├── nvim/         # Neovim configuration
├── tmux.conf     # Tmux configuration
└── starship.toml # Starship prompt
```

## Usage

```sh
config status                      # Check status
config add <file>                  # Stage changes
config commit -m "message"         # Commit changes
config push                        # Push to remote
config pull                        # Pull from remote
config ls-files                    # List tracked files
config diff                        # Show uncommitted changes
config log --oneline -10           # View history
config show HEAD:.zshrc           # View file content from HEAD
config grep "search"               # Search tracked files
```

## Dependencies

### macOS

```sh
# Core dependencies
brew install neovim git ripgrep fd fzf tmux starship

# Optional: Nerd Font for icons
brew install font-hack-nerd-font
```

## Git Ignore

Root `.gitignore` configured with default-deny pattern (`*`) and explicit allowlist for tracked files and directories. Prevents accidental tracking of home directory contents.
