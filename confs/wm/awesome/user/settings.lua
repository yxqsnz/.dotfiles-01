local awful = require('awful')
local suit = awful.layout.suit

return {
  theme = {
    name = 'oceanic',
  },
  compositing = {
    picom_enabled = true,
    gamemode_hook = true,
  },
  layout = {
    default = suit.spiral,
    availiable = {
      suit.spiral,
      suit.floating,
    },
  },
  keyboard = {
    modkey = 'Mod4',
  },
  apps = {
    terminal = 'kitty',
    screenshot_provider = 'flameshot',
    editor = {
      is_gui = false,
      command = 'nvim',
    },
  },
}
