-- vim: foldmarker={{,}} foldmethod=marker
local awful = require("awful")
local wibox = require("wibox")
local start = require("shared.widgets.start")
local battery = require("shared.widgets.battery")
local network = require("shared.widgets.network")
local volume = require("shared.widgets.volume")
local dnd = require("shared.widgets.dnd")
local theme = require("beautiful")
local vicious = require("vicious")
local wibar = awful.wibar
Log.debug("(Wibar) Waiting for event...")
screen.connect_signal("request::desktop_decoration", function(screen)
  Log.debug("(Wibar) Showing-up...")
  screen.mypromptbox = awful.widget.prompt()
  screen.mytaglist = awful.widget.taglist({
    screen = screen,
    filter = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({}, 1, function(t)
        t:view_only()
      end),
      awful.button({ Settings.keyboard.modifier }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ Settings.keyboard.modifier }, 3, function(t)
        if client.focus then
          client.focus:toggle_tag(t)
        end
      end),
      awful.button({}, 4, function(t)
        awful.tag.viewprev(t.screen)
      end),
      awful.button({}, 5, function(t)
        awful.tag.viewnext(t.screen)
      end),
    },
  })
  -- {{ CPU widget
  local cpuwidget = awful.widget.graph()
  cpuwidget:set_width(50)
  cpuwidget:set_background_color("#494B4F")
  cpuwidget:set_color({
    type = "linear",
    from = { 0, 0 },
    to = { 50, 0 },
    stops = {
      { 0, "#FF5656" },
      { 0.5, "#88A175" },
      { 1, "#AECF96" },
    },
  })
  vicious.register(cpuwidget, vicious.widgets.cpu, "$1", 0.1)
  -- }}
  screen.mywibox = wibar({
    screen = screen,
    width = 1350,
    position = "top",
    height = 30,
    border_color = theme.fg_focus,
    border_width = 1,
    bg = theme.bg_normal,
    widget = {
      layout = wibox.layout.align.horizontal,
      {
        layout = wibox.layout.fixed.horizontal,
        start,
        screen.mypromptbox,
      },
      screen.mytaglist,
      {
        layout = wibox.layout.fixed.horizontal,
        spacing = 10,
        volume,
        network,
        battery,
        dnd,
        wibox.widget.textclock(),
      },
    },
  })
  screen.mywibox.y = 10
  screen.mywibox:struts({ top = 42 })
end)
