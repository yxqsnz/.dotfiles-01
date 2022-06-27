local theme = require("beautiful")
local awful = require("awful")
local markup = require("lain.util.markup")
local function get_icon(percent)
  if percent > 98 then
    return ""
  elseif percent > 90 then
    return ""
  elseif percent > 80 then
    return ""
  elseif percent > 70 then
    return ""
  elseif percent > 60 then
    return ""
  elseif percent > 50 then
    return ""
  elseif percent > 40 then
    return ""
  elseif percent > 30 then
    return ""
  elseif percent > 20 then
    return ""
  elseif percent > 10 then
    return ""
  else
    return ""
  end
end

return awful.widget.watch(
  "cat /sys/class/power_supply/BAT0/capacity",
  30,
  function(widget, stdout)
    local icon = get_icon(tonumber(stdout))
    local text = markup.font(theme.nerdFont, icon)
    widget:set_markup(text)
  end
)
