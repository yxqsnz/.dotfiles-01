local paths = require('core.paths')
return {
  font = 'Fira Sans Compressed 13',
  wallpapers = { paths.get_theme_path('oceanic') .. '/assets/wallpapers/1.png' },
  tags = { 'Editor', 'Web', 'Discord', 'Other' },
  bg_normal = '#0f111a',
  useless_gap = 4,
  border_width = 1,
  border_focus = '#4c566a',
  accent = '#ff4151',
  fg_focus = '#4c566a',
  bar = require('custom.themes.oceanic.bar'),
}
