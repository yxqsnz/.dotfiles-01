local settings = require('user.settings')
local klog = require('core.logger')('Keybinds')
local modkey = settings.keyboard.modkey

klog:info('Modkey is %s', modkey)

local binds = {
  'user.maps.app',
  'user.maps.focus',
  'user.maps.layout',
  'user.maps.mouse',
  'user.maps.tag',
  'user.maps.client',
  'user.maps.popup',
}

for _, bind in pairs(binds) do
  klog:debug('Loading bind %s', bind)
  require(bind)(modkey)
end
