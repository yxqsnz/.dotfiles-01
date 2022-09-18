local log = require('core.logger')('Integration manager')
Integrations = {}

local integrations = {
  'core.integrations.gamemode',
  'core.integrations.upower',
}

for _, integration in pairs(integrations) do
  log:info('Using %s', integration)
  require(integration)
end
