# Neovim Configuration

Neovim configuration based on kickstart.nvim.

## Configuration

- **Config file**: `init.lua`
- **Plugin manager**: lazy.nvim
- **Language servers**: ts_ls, eslint, lua_ls
- **Key features**: LSP, Telescope, gitsigns, auto-format, Treesitter, blink.cmp completion

## Dependencies

- Neovim 0.10+ or nightly
- ripgrep, fd
- Nerd Font (optional, for icons)

## Usage

```sh
nvim
```

Plugins install automatically on first launch. Use `:Lazy` to manage plugins.

## Keymaps

### Quality of Life

- `<leader>p` - Paste over selection without yanking replaced text
- `<leader>d` - Delete without yanking to register
- `Y` - Yank to end of line
- `n`/`N` - Keep search results centered
- `J` - Join lines without cursor jump
- `<C-d>`/`<C-u>` - Half-page jumps stay centered
