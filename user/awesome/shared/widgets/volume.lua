local lain = require("lain")
local markup = require("lain.util.markup")
local theme = require("beautiful")
local symbols = {
  full = "",
  medium = "",
  low = "",
}
local function get_symbol(level, status)
  if status == "off" then
    return "ﱝ"
  end
  if level > 70 then
    return symbols.full
  elseif level > 30 then
    return symbols.medium
  else
    return symbols.low
  end
end

local volume = lain.widget.alsa({
  settings = function()
    widget:set_markup(
      markup.font(
        theme.nerdFont,
        get_symbol(volume_now.level, volume_now.status)
      )
    )
  end,
})
return volume
