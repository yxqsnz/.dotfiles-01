local log = require('core.logger')('Bar hook')

screen.connect_signal('request::desktop_decoration', function(screen)
  local theme = require('beautiful')
  log:debug('Starting ar for s:%d', screen.index)

  theme.bar(theme, screen)
end)
