local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

screen.connect_signal('request::wallpaper', function(screen)
  awful.wallpaper {
    screen = screen,
    widget = {
      {
        image = beautiful.wallpapers[screen.index],
        upscale = true,
        downscale = true,
        widget = wibox.widget.imagebox,
      },
      valign = 'center',
      halign = 'center',
      tiled = true,
      widget = wibox.container.tile,
    },
  }
end)
