local paths = require('core.paths')

local palette = {
  red = '#f38ba8',
  green = '#a6e3a1',
  cyan = '#89dceb',
  yellow = '#f9e2af',
  magenta = '#b48ead',
  pink1 = '#eebebe',
  pink2 = '#f5e0dc',

  bg0 = '#0f111a',
  bg1 = '#313244',
  bg2 = '#1e1e2e',
}

return {
  font = 'Victor Mono 13',
  palette = palette,
  wallpapers = { paths.get_theme_path('oceanic') .. '/assets/wallpapers/1.png' },
  tags = { '', '', '', '' },
  bg_normal = palette.bg0,
  bg_systray = palette.bg2,
  useless_gap = 4,
  border_width = 1,
  border_focus = '#4c566a',
  accent = '#ff4151',
  fg_focus = '#4c566a',
  taglist_fg_focus = '#4c566a',
  taglist_fg_empty = palette.bg2,
  taglist_fg_occupied = palette.bg1,
  bar = require('custom.themes.oceanic.bar'),
}
