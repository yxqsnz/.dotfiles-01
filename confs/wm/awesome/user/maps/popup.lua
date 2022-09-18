return function(modkey)
  local hotkeys_popup = require('awful.hotkeys_popup')
  local awful = require('awful')

  awful.keyboard.append_global_keybindings {
    awful.key({ modkey }, 'h', hotkeys_popup.show_help, { description = 'Show keybinds', group = 'help' }),
  }
end
