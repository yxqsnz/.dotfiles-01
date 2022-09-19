return function(theme)
  local wibox = require('wibox')

  local bar = wibox.widget.progressbar()

  bar.forced_height = 12
  bar.forced_width = 3
  bar.border_width = 0.2

  bar.background_color = theme.palette.bg2
  return bar
end
