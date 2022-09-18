local mod = {}
local wibox = require('wibox')

function mod.center(widget)
  return { widget, valign = 'center', halign = 'center', layout = wibox.container.place }
end

function mod.round(theme, widget, radius, kind)
  local shape = require('gears').shape
  return {
    bg = theme.palette.bg2,
    shape = kind or shape.rounded_rect,
    widget = wibox.container.background,
    radius = radius or 0.56,
    widget,
  }
end

function mod.margin(widget, custom)
  return {
    margins = custom or 3,

    widget = wibox.container.margin,
    widget,
  }
end

function mod.rotate(widget, at)
  return wibox.container {
    widget,
    direction = at,
    widget = wibox.container.rotate,
  }
end

return mod
