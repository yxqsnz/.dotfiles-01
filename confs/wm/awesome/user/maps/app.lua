return function(modkey)
  local awful = require('awful')
  local log = require('core.logger')('App keybinds')
  local settings = require('user.settings')

  local run = function(command)
    return function()
      log:debug('Spawning %s', command)
      awful.spawn.spawn(command)
    end
  end

  -- App related
  awful.keyboard.append_global_keybindings {
    awful.key(
      { modkey },
      'Return',
      run(settings.apps.terminal),
      { description = 'Open a terminal', group = 'launcher' }
    ),
    awful.key({ modkey }, 'd', run('rofi -show drun'), { description = 'Run a program', group = 'launcher' }),
    awful.key({}, 'Print', run('flameshot full -c')),
    awful.key({ 'Shift' }, 'Print', run('flameshot gui')),
    awful.key({ modkey, 'Shift' }, 'r', awesome.restart),
  }
end
