-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)


--[[ This is where you actually apply your config choices ]]

config.window_background_opacity = 1
-- set an image as the background
-- this one on silverblue
-- config.window_background_image = "/home/thadryan/Documents/HomeVault/Areas/Art/Backgrounds/rapture.jpg"
-- this one on work partition backup
-- config.window_background_image = "/home/thadryan/Documents/rapture.jpg"
-- set the image as partially transparent
config.window_background_image_hsb = {
  brightness = 0.03,
  saturation = 0.2,
}

-- cursor
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 750
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- set the font
-- config.font = wezterm.font("FiraMono Nerd Font")
-- config.font = wezterm.font("Liberation Mono")
-- config.font = wezterm.font("Ubuntu Mono")
config.font_size = 17.0

-- For example, changing the color scheme:
config.color_scheme = "rose-pine"
config.window_background_opacity = 1

-- set the image as partially transparent
config.window_background_image_hsb = {
  brightness = 0.05,
  saturation = 0.05,
}
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 750
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- config.color_scheme = "AlienBlood"
-- config.color_scheme = 'Dark Ocean (terminal.sexy)'
config.color_scheme = 'Embers (base16)' -- !!!
-- config.color_scheme = 'ForestBlue'
-- config.color_scheme = 'iceberg-dark'
-- config.color_scheme = 'Insignificato (terminal.sexy)' -- !!!
-- config.color_scheme = 'JWR dark (terminal.sexy)'
-- config.color_scheme = 'Kanagawa (Gogh)' -- !!!
-- config.color_scheme = 'kanagawabones'
-- config.color_scheme = 'Kasugano (terminal.sexy)'
-- config.color_scheme = 'Seafoam Pastel (Gogh)'
-- config.color_scheme = 'Wryan'
-- config.color_scheme = 'Apprentice (base16)'
-- config.color_scheme = 'Ashes (dark) (terminal.sexy)'
-- config.color_scheme = 'Atelier Savanna (base16)'
-- config.color_scheme = 'Azu (Gogh)'
-- config.color_scheme = 'Bitmute (terminal.sexy)'
-- config.color_scheme = 'Black Metal (base16)'
-- config.color_scheme = 'Black Metal (Venom) (base16)'
-- config.color_scheme = 'Cloud (terminal.sexy)'

-- I can't get these to do anything even though they're copy-pasted from the docs
-- They dont' work with Color or Ansci, with or without opacity tweaks
config.colors = {
  copy_mode_active_highlight_bg = { Color = '#52ad70' },
  -- use `AnsiColor` to specify one of the ansi color palette values
  -- (index 0-15) using one of the names "Black", "Maroon", "Green",
  --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
  -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
  copy_mode_active_highlight_fg = { Color = '#52ad70' },
  copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
  copy_mode_inactive_highlight_fg = { Color = '#52ad70' },
  cursor_fg = "black",
  cursor_bg = "d3d3d3"

}


-- warn about missing glyphs
config.warn_about_missing_glyphs = false

-- don't show the tab bar unless there is more than one tab
config.hide_tab_bar_if_only_one_tab = true

-- allow mouse copy and paste
-- copy with ctrl+c
config.keys = {
  {key="c", mods="CTRL", action=wezterm.action{CopyTo="Clipboard"}},
  {key="v", mods="CTRL", action=wezterm.action{PasteFrom="Clipboard"}},
  -- turning this off because it conflicts with fzf
  --  {key="t", mods="CTRL", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
  -- make ctrl s do nothing so I can use it in vim
  --{key="s", mods="CTRL", action=wezterm.action{SendString=""}},

}
-- -- and finally, return the configuration to wezterm
return config

