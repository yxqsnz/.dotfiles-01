local naughty = require("naughty")
local theme = require("beautiful")
local markup = require("lain.util.markup")
local awful = require("awful")
local wibox = require("wibox")
local symbols = {
  enabled = "",
  disabled = "",
}
local text = wibox.widget.textbox()
local function getIcon()
  if naughty.is_suspended() then
    return symbols.enabled
  else
    return symbols.disabled
  end
end

text:buttons(awful.button({}, 1, function()
  if naughty.is_suspended() then
    naughty.resume()
  else
    naughty.suspend()
  end
  text:set_markup(markup.font(theme.nerdFont, getIcon()))
end))
text:set_markup(markup.font(theme.nerdFont, getIcon()))
return text
