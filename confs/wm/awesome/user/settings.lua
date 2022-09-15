local awful = require('awful')
local suit = awful.layout.suit

return {
  theme = {
    name = 'oceanic',
  },
  layout = {
    default = suit.tile,
    availiable = {
      suit.tile,
    },
  },
  keyboard = {
    modkey = 'Mod4',
  },
  apps = {
    terminal = 'kitty',
    editor = {
      is_gui = false,
      command = 'nvim',
    },
  },
}
