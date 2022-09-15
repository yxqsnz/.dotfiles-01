local awful = require('awful')
local settings = require('user.settings')
local klog = require('core.logger')('Keybinds')
local modkey = settings.keyboard.modkey

klog:debug('Modkey is %s', modkey)

local run = function(command)
  return function()
    klog:debug('Spawning %s', command)
    awful.spawn.spawn(command)
  end
end

awful.keyboard.append_global_keybindings {
  awful.key({ modkey }, 'Return', run(settings.apps.terminal), { description = 'Open a terminal', group = 'launcher' }),
  awful.key({ modkey }, 'd', run('rofi -show drun'), { description = 'Run a program', group = 'launcher' }),
}

awful.keyboard.append_global_keybindings {
  awful.key {
    modifiers = { modkey },
    keygroup = 'numrow',
    description = 'only view tag',
    group = 'tag',
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  },
  awful.key {
    modifiers = { modkey, 'Control' },
    keygroup = 'numrow',
    description = 'toggle tag',
    group = 'tag',
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end,
  },
  awful.key {
    modifiers = { modkey, 'Shift' },
    keygroup = 'numrow',
    description = 'move focused client to tag',
    group = 'tag',
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  },
  awful.key {
    modifiers = { modkey, 'Control', 'Shift' },
    keygroup = 'numrow',
    description = 'toggle focused client on tag',
    group = 'tag',
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end,
  },
  awful.key {
    modifiers = { modkey },
    keygroup = 'numpad',
    description = 'select layout directly',
    group = 'layout',
    on_press = function(index)
      local t = awful.screen.focused().selected_tag
      if t then
        t.layout = t.layouts[index] or t.layout
      end
    end,
  },
}
