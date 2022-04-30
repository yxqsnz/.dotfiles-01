local wallpaper     = require('utils.wallpaper')
local awful         = require('awful')
local logger        = require('utils.logger')
local gears         = require('gears')
local settings      = require('user.settings')
local beautiful     = require('beautiful')
local set_wallpaper = wallpaper.set_wallpaper
local screen_id     = 0
screen.connect_signal("property::geometry", set_wallpaper)
awful.screen.connect_for_each_screen(function(screen)
  screen_id = screen_id + 1
  logger.info(string.format('screen[%d] found, configuring it.', screen_id))
  awful.tag(settings.desktop.tags, screen, awful.layout.layouts[3])
  set_wallpaper(screen)
  screen.mypromptbox = awful.widget.prompt()
  beautiful.at_screen_connect(screen)
  logger.info(string.format('screen[%d] setup done ...', screen_id))
end)

client.connect_signal("manage", function(c)
  c.shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, 5)
  end
end)
