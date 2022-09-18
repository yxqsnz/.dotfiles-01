local paths = require('core.paths')

local palette = {
  red = '#f38ba8',
  green = '#a6e3a1',
  cyan = '#89dceb',
  bg2 = '#1e1e2e',
  yellow = '#f9e2af',
}

return {
  font = 'Iosevka SS14 13',
  palette = palette,
  wallpapers = { paths.get_theme_path('oceanic') .. '/assets/wallpapers/1.png' },
  tags = { '', '', '', '' },
  bg_normal = '#0f111a',
  bg_systray = palette.bg2,
  useless_gap = 4,
  border_width = 1,
  border_focus = '#4c566a',
  accent = '#ff4151',
  fg_focus = '#4c566a',
  taglist_fg_focus = palette.cyan,
  bar = require('custom.themes.oceanic.bar'),
}
