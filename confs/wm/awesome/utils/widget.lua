local mod = {}
local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')

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

function mod.popup(widget)
  return awful.popup {
    widget = wibox.widget {
      {
        widget,

        layout = wibox.container.margin,
      },
      margins = 8,
      widget = wibox.container.margin,
    },
    placement = function(popup)
      return awful.placement.centered(popup, { margins = { top = 480 } })
    end,
    shape = function(cr, w, h)
      gears.shape.rounded_rect(cr, w, h, 8)
    end,
    border_color = require('beautiful').border_focus,
    border_width = 2,
    ontop = true,
    visible = false,
    hide_on_right_click = true,
    offset = {
      y = 10,
    },
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
