local log = require('core.logger')('Hooks')
local hooks = {
  'hooks.custom.errors',
  'hooks.custom.initial',
  'hooks.custom.themer',
  'hooks.custom.wallpaper',
  'hooks.custom.tag',
}

for _, hook in pairs(hooks) do
  log:debug('Starting hook %s', hook)
  require(hook)
end
