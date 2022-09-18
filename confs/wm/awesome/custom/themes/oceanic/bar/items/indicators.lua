local wibox = require('wibox')
return function(theme)
  local widget = require('utils.widget')
  local center = widget.center
  local margin = widget.margin
  local make_rounded = widget.round
  local markup = require('utils.markup')
  local tray = wibox.widget.systray()

  tray:set_horizontal(false)
  tray:set_base_size(18)

  return margin({
    layout = wibox.layout.fixed.vertical,
    spacing = 5,

    make_rounded(theme, margin(center(tray))),

    make_rounded(
      theme,
      margin(
        center(
          wibox.widget.textclock(
            markup.box { markup.colorize(theme.palette.green, '%H'), markup.colorize(theme.palette.red, '\n%M') }
          )
        ),
        0
      ),
      0.02
    ),
  }, 4)
end
