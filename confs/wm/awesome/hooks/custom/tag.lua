local awful = require('awful')
local log = require('core.logger')('Tag hook')
local theme = require('beautiful')
local settings = require('user.settings')

tag.connect_signal('request::default_layouts', function()
  log:debug('Setting default layouts')
  awful.layout.append_default_layouts(settings.layout.availiable)
end)

screen.connect_signal('request::desktop_decoration', function(screen)
  log:debug('Updating tags for screen %d', screen.index)
  awful.tag(theme.tags, screen, settings.layout.default)
end)
