# Neovim Configuration

Neovim configuration derived from kickstart.nvim.

## Configuration

- **Entry point**: `~/.config/nvim/init.lua`
- **Plugin manager**: lazy.nvim
- **LSP servers**: ts_ls, eslint, lua_ls, pyright, gopls
- **Completion**: blink.cmp (nvim-cmp replacement)
- **Fuzzy finder**: Telescope (fzf-lua integration)

## Architecture

Configuration split into:
- `init.lua` - Core configuration, keymaps, autocommands
- `lua/kickstart/plugins/` - Plugin specifications
- `lua/custom/plugins/` - User-specific plugins

## Dependencies

- Neovim 0.10+ or nightly
- ripgrep ( Telescope file search )
- fd ( Telescope file browser )
- Nerd Font (optional, for icons)

## Usage

```sh
nvim
```

Plugins install automatically on first launch. Use `:Lazy` to manage plugins and `:Mason` to install LSP servers/formatters.

## Keymaps

### Quality of Life

- `<leader>p` - Paste over selection without yanking replaced text
- `<leader>d` - Delete without yanking to register
- `Y` - Yank to end of line
- `n`/`N` - Keep search results centered
- `J` - Join lines without cursor jump
- `<C-d>`/`<C-u>` - Half-page jumps stay centered

### LSP

- `gd` - Go to definition
- `gr` - Go to references
- `gI` - Go to implementation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>D` - Type definition
- `K` - Hover documentation

## Plugin Configuration

- **telescope.nvim**: `<leader><leader>` for fuzzy search, `<leader>sf`/`<leader>sg`/`<leader><CR>` for files/grep/commands
- **gitsigns.nvim`: Inline git status in gutter
- **neo-tree.nvim**: File explorer at `<leader>e`
- **conform.nvim**: Auto-format on save
- **nvim-treesitter**: Syntax highlighting
- **indent-blankline.nvim**: Indent guides
- **nvim-autopairs**: Auto-close brackets/quotes
- **debug**: nvim-dap for debugging
