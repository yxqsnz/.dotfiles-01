local awful = require('awful')
local wibox = require('wibox')
local launcher = require('common.widgets.launcher')
-- local make_vertical = require('utils.widget').make_vertical

return function(theme, screen)
  local tray = wibox.widget.systray()
  tray:set_horizontal(false)
  tray:set_base_size(18)

  screen.mywibox = awful.wibar {
    position = 'left',
    height = screen.geometry.height - 18,
    border_color = theme.fg_focus,
    border_width = 0.5,
    screen = screen,
    widget = {
      layout = wibox.layout.align.vertical,
      {
        layout = wibox.layout.flex.vertical,
        launcher(theme),
      },
      nil,
      {
        layout = wibox.layout.fixed.vertical,
        { tray, valign = 'center', halign = 'center', layout = wibox.container.place },
        { wibox.widget.textclock('%H\n%M'), valign = 'center', halign = 'center', layout = wibox.container.place },
      },
    },
  }

  screen.mywibox.y = 8
  screen.mywibox.x = 4
end
