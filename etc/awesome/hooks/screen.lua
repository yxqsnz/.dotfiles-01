local wallpaper     = require('utils.wallpaper')
local awful         = require('awful')
local logger        = require('utils.logger')
local screen_id     = 0
local settings      = require('user.settings')
local beautiful     = require('beautiful')
local set_wallpaper = wallpaper.set_wallpaper
screen.connect_signal("property::geometry", set_wallpaper)
awful.screen.connect_for_each_screen(function(screen)
  screen_id = screen_id + 1
  logger.info(string.format('screen[%d] found, configuring it.', screen_id))
  awful.tag(settings.desktop.tags, screen, awful.layout.layouts[4])
  set_wallpaper(screen)
  screen.mypromptbox = awful.widget.prompt()
  beautiful.at_screen_connect(screen)
  logger.info(string.format('screen[%d] setup done ...', screen_id))
end)
