local wibox = require("wibox")
local markup = require("lain.util.markup")
local theme = require("beautiful")
local M = {}
function M.material(text)
  return wibox.widget({
    {
      markup = markup.font("Material Icons", text),
      align = "center",
      valign = "center",
      widget = wibox.widget.textbox,
    },

    top = -3,
    layout = wibox.container.margin,
  })
end

function M.nerd(text)
  return wibox.widget({
    {
      markup = markup.font(theme.nerdFont, text),
      align = "center",
      valign = "center",
      widget = wibox.widget.textbox,
    },
    top = -3,
    layout = wibox.container.margin,
  })
end

return M
