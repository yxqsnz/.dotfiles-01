local beautiful = require('beautiful')
local gears     = require('gears')
local logger    = require('utils.logger')
local function set_wallpaper(screen)
  logger.info("setting wallpaper")
  -- Wallpaper
  if beautiful.wallpaper then
    logger.info("wallpaper found! setting it.")
    local wallpaper = beautiful.wallpaper
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(screen)
    end
    logger.info('wallpaper has set.')
    gears.wallpaper.maximized(wallpaper, screen, true)
  else
    logger.warn("can't find a wallpaper")
  end
end

return {
  set_wallpaper = set_wallpaper,
}
