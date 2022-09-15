local settings = require('user.settings')
local beautiful = require('beautiful')
local log = require('core.logger')('Wallpaper hook')
local paths = require('core.paths')

log:debug('Loading theme %s', settings.theme.name)
beautiful.init(paths.get_theme_path(settings.theme.name) .. '/init.lua')
