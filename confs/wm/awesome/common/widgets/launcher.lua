local wibox = require('wibox')
local awful = require('awful')
local markup = require('utils.markup')

return function(theme)
  return wibox.widget {
    align = 'center',
    valign = 'center',
    markup = markup.colorize(theme.accent, ''),
    buttons = awful.button({}, 1, function() end),
    widget = wibox.widget.textbox,
  }
end
