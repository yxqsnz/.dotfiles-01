local settings = require('user.settings')
kbdcfg = {}
kbdcfg.cmd = "setxkbmap"
kbdcfg.layout = { { settings.keyboard.layout, "" } }
kbdcfg.current = 1
