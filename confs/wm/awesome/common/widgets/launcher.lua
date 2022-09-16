local wibox = require('wibox')
local awful = require('awful')

return function(theme)
  return wibox.widget {
    align = 'center',
    valign = 'center',
    markup = string.format('<span color="%s"></span>', theme.accent),
    buttons = awful.button({}, 1, function() end),
    widget = wibox.widget.textbox,
  }
end
