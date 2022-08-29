local wezterm = require "wezterm"

return {
  font_size = 9.5,
  font = wezterm.font_with_fallback {
    'Victor Mono SemiBold',
    'Symbols Nerd Font'
  },
  font_hinting = "Full",
  color_scheme = "Catppuccin Macchiato",
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  max_fps = 255,
  hide_tab_bar_if_only_one_tab = true
}
