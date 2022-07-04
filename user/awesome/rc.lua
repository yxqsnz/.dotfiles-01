-- vim: foldmarker={{,}} foldmethod=marker
-- {{ Some Globals
require("util.io")
Log = require("util.log")
Settings = require("settings")
State = {}
-- }}
-- {{ Some imports
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
-- }}
-- {{ Some Debugs
Log.info("(StartUp) Using Awesome " .. awesome.api_level)
-- }}
-- {{ Awful
Log.info("(Awful) Setting Default Layouts")
awful.layout.append_default_layouts({
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  awful.layout.suit.floating,
  awful.layout.suit.max.fullscreen,
})
-- }}
-- {{ Error handling
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification({
    urgency = "critical",
    title = "Oops, an error happened"
      .. (startup and " during startup!" or "!"),
    message = message,
  })
end)
-- }}
-- {{ Theme
do
  Log.debug("(Theme) Loading: " .. Settings.desktop.theme)
  local theme = require(format("themes.%s", Settings.desktop.theme))
  beautiful.init(theme)
  require(format("themes.%s.wibar", Settings.desktop.theme))
end
-- }}
-- {{ Load Modules
local function L(mod)
  Log.debug("(Debug Loader) Load: " .. mod)
  local m = require(mod)
  return m
end

L("screen")
L("client")
L("keybinds")
L("rules")
L("notification")
-- }}
