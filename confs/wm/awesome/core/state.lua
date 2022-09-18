local mod = {}
local log = require('core.logger')('State')

_G.awesome.state = {}

function mod.read(key)
  log:debug('Reading key %s', key)
  return _G.awesome.state[key]
end

function mod.put(key, value)
  log:debug('Writing %s = %s', key, value)
  _G.awesome.state[key] = value
end

return mod
