local beautiful = require('beautiful')
local awful     = require('awful')
local settings  = require('user.settings')
local logger    = require('utils.logger')
require("awful.autofocus")
do
  local user_theme, ut
  user_theme = awful.util.getdir("config") .. "/themes/" .. settings.ui.theme .. '/theme.lua'
  ut = io.open(user_theme)
  if ut then
    io.close(ut)
    beautiful.init(user_theme)
  else
    logger.warn("Personal theme doesn't exist, falling back to openSUSE")
    beautiful.init(awful.util.get_themes_dir() .. "openSUSE/theme.lua")
  end
end
theme.icon_theme = settings.ui.gtk.icon_theme
