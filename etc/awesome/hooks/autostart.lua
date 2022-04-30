local settings  = require('user.settings')
local callbacks = require('utils.callbacks')
local logger    = require('utils.logger')
for _, app in pairs(settings.system.autostart) do
  callbacks.execute(app)()
  logger.info('running app[autostart]: ' .. app)
end
