-- vim: foldmarker={{,}} foldmethod=marker
local awful = require("awful")
local ruled = require("ruled")

ruled.client.connect_signal("request::rules", function()
  Log.debug("(Rules) Setup Rules")
  ruled.client.append_rule({
    id = "global",
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
    },
  })

  -- {{ Title Bars
  if not Settings.desktop.enableTitleBars then
    Log.warn("(Rules) Not enabling Titlebars.")
  end
  ruled.client.append_rule({
    id = "titlebars",
    rule_any = { type = { "normal", "dialog" } },
    properties = { titlebars_enabled = Settings.desktop.enableTitleBars },
  })
  -- }}
  -- {{ Floating Windows
  ruled.client.append_rule({
    id = "floating",
    rule_any = {
      instance = { "copyq", "pinentry" },
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "Sxiv",
        "Tor Browser",
        "Wpa_gui",
        "veromix",
        "xtightvncviewer",
      },
      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        "Event Tester", -- xev.
      },
      role = {
        "AlarmWindow", -- Thunderbird's calendar.
        "ConfigManager", -- Thunderbird's about:config.
        "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
      },
    },
    properties = { floating = true },
  })
  -- }}
end)
