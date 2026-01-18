local wezterm = require("wezterm")

-- Platform detect
local is_darwin  = wezterm.target_triple:find("darwin")  ~= nil
local is_windows = wezterm.target_triple:find("windows") ~= nil

-- Blur-friendly settings
local OPACITY = 0.92        -- Higher opacity for better contrast
local MAC_BLUR = 60          -- 60% blur for macOS

-- Simple shell - launch tmux manually with `tm`
local ZSH = "/bin/zsh"
local BASH = "/bin/bash"

local default_prog
if is_darwin then
  default_prog = { ZSH, "-l" }
elseif is_windows then
  local distro = os.getenv("WEZTERM_WSL_DISTRO") or "Ubuntu"
  default_prog = { "wsl.exe", "--distribution", distro, "--", BASH, "-l" }
else
  default_prog = { BASH, "-l" }
end


local M = {
  -- Look & feel
  font = wezterm.font_with_fallback({ "JetBrains Mono", "Iosevka Term", "SF Mono" }),
  font_size = 13.0,
  color_scheme = "Tokyo Night Storm",  -- Perfect for blur backgrounds
  enable_tab_bar = false,

  window_decorations = "TITLE | RESIZE",
  window_padding = { left = 6, right = 6, top = 6, bottom = 6 },
  inactive_pane_hsb = { saturation = 0.9, brightness = 0.8 },

  -- Elegant blur background (optimized for contrast)
  window_background_opacity = OPACITY,
  text_background_opacity = 1.0,  -- Keep text fully solid

  -- Session
  default_prog = default_prog,

  -- QoL
  scrollback_lines = 100000,
  check_for_updates = false,

  -- HHKB Shift+Enter multiline fix + Alt key fixes for fzf
  keys = {
    { key = "Enter", mods = "SHIFT", action = wezterm.action.SendString "\n" },
    -- Fix Alt+C for fzf directory browser (explicitly send as Meta)
    { key = "c", mods = "ALT", action = wezterm.action.SendKey { key = "c", mods = "META" } }
  },

  -- Shift+Click to open URLs in Brave Browser and files in VS Code
  mouse_bindings = {
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'SHIFT',
      action = wezterm.action_callback(function(window, pane)
        local text = window:get_selection_text_for_pane(pane)

        -- If no selection, select word under cursor
        if not text or text == "" then
          window:perform_action(wezterm.action{SelectTextAtMouseCursor = "Word"}, pane)
          text = window:get_selection_text_for_pane(pane)
          window:perform_action(wezterm.action{ClearSelection}, pane)
        end

        -- Debug: create log to see what's happening
        wezterm.run_child_process({ '/bin/sh', '-c', 'echo "SHIFT+CLICK: [' .. (text or 'nil') .. ']" >> /tmp/wezterm_test.log' })

        if text and text ~= "" then
          -- Open URLs in Brave Browser
          if text:match('^%w+://') then
            wezterm.open_with(text, 'Brave Browser')
          else
            -- Clean git status prefixes and open files in VS Code
            local clean_path = text:gsub('^[%s%?%!%M%AD%U%?]+%s+', '')
            clean_path = clean_path:gsub('^[%s%?%!%M%AD%U%?]+', '')

            -- If it looks like a file path, open in VS Code
            if clean_path:match('/') or clean_path:match('%.%w+$') or clean_path:match('[%w-]+/') then
              local cmd = 'code --goto "' .. clean_path .. '"'
              wezterm.run_child_process({ '/bin/sh', '-c', cmd })
            end
          end
        end
      end),
    },
  },
}

-- Alt/Meta behavior:
-- macOS: Left ⌥ = Meta (ESC-prefix), Right ⌥ = compose (symbols like — ± π).
-- Windows/*nix: both Alts behave as Meta (no compose key to preserve).
M.send_composed_key_when_left_alt_is_pressed  = false
M.send_composed_key_when_right_alt_is_pressed = is_darwin and true or false

-- Platform-specific blur (optimized for best contrast)
if is_darwin then
  M.macos_window_background_blur = MAC_BLUR
end
if is_windows then
  M.win32_system_backdrop = "Acrylic"
end

-- Set your perfect window size (from Rectangle positioning)
if is_darwin then
  M.initial_cols = 285  -- Your perfect Rectangle positioning
  M.initial_rows = 77   -- Your perfect Rectangle positioning
end



return M
