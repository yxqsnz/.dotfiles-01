local settings = require('user.settings')
local get_provider_by_name = require('hooks.custom.screenshot.providers')
local log = require('core.logger')('Screenshot hook')
local awful = require('awful')
local spawn = require('core.spawn')
local utils = require('core.utils')
local noop = utils.noop

local provider = get_provider_by_name(settings.apps.screenshot_provider)

if provider then
  log:info('Mapping keys for %s', settings.apps.screenshot_provider)

  if provider.daemon then
    log:debug('Starting screenshot daemon')
    spawn.spawn_if_not_running(provider.daemon)
  end

  awful.keyboard.append_global_keybindings {
    awful.key({}, 'Print', function()
      awful.spawn.easy_async_with_shell(provider.fullscreen, noop)
    end, { description = 'Take a full screen shot', category = 'screenshot' }),

    awful.key({ 'Shift' }, 'Print', function()
      awful.spawn.easy_async_with_shell(provider.selection, noop)
    end, { description = 'Take selection screenshot', category = 'screenshot' }),
  }
else
  log:warn('%s is a invalid screenshot provider.', settings.apps.screenshot_provider)
end
