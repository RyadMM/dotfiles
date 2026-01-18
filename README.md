# Dotfiles

Configuration files managed via bare git repository.

## Structure

```
.config/
├── zsh/          # Zsh shell configuration
├── nvim/         # Neovim configuration
├── tmux.conf     # Tmux configuration
└── starship.toml # Starship prompt
```

## Setup

```sh
# Clone bare repository
git clone --bare https://github.com/RyadMM/dotfiles.git $HOME/.local/share/dotfiles-repo

# Add alias to shell
echo "alias config='/usr/bin/git --git-dir=\$HOME/.local/share/dotfiles-repo/ --work-tree=\$HOME'" >> ~/.config/zsh/local.zsh
source ~/.config/zsh/init.zsh

# Checkout files
config checkout
```

## Dependencies

### macOS

```sh
# Core dependencies
brew install neovim git ripgrep fd

# Optional: Nerd Font for icons
brew install font-hack-nerd-font
```

## Usage

```sh
config status     # Check status
config add <file> # Stage changes
config commit -m "message"
```
