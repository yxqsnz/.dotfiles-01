local upower = require('lgi').require('UPowerGlib')
local gtimer = require('gears.timer')
local log = require('core.logger')('Upower Integration')

log:debug('Fiding battery...')
local device = upower.Client():get_display_device()
log:info('Found.')

device.on_notify = function(result)
  log:debug('Received update event: %d%%,%d', result.percentage, result.state)
  ---@diagnostic disable-next-line: param-type-mismatch
  awesome.emit_signal('upower::update', result)
end
gtimer.delayed_call(awesome.emit_signal, 'upower::update', device)
