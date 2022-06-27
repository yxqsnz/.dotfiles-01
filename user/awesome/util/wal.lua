local beautiful = require("beautiful")
local wibox = require("wibox")
local awful = require("awful")
local env = require("util.env")
local M = {}
function M.set(screen)
  if beautiful.wallpaper then
    awful.wallpaper({
      screen = screen,
      widget = {
        {
          image = beautiful.wallpaper,
          upscale = true,
          downscale = true,
          widget = wibox.widget.imagebox,
        },
        valign = "center",
        halign = "center",
        tiled = true,
        widget = wibox.container.tile,
      },
    })
    Log.debug("(Wallpaper) Set To: " .. env.hide_home(beautiful.wallpaper))
  else
    Log.warn("(Wallpaper) No wallpaper Set.")
  end
end

return M
