local wibox = require("wibox")
local beautiful = require("beautiful")
local markup = require("lain.util.markup")
local awful = require("awful")
local function fg(cl, text)
  return markup.fontfg(beautiful.font, cl, text)
end

return wibox.widget({
  {
    font = beautiful.nerdFont .. "26",
    fg = beautiful.fg_accent,
    markup = fg(beautiful.fg_normal, "⯅"),
    align = "center",
    valign = "center",
    buttons = awful.button({}, 1, function() end),
    widget = wibox.widget.textbox,
  },
  right = 7,
  left = 5,
  top = 1,
  layout = wibox.container.margin,
})
