local awful = require('awful')
local wibox = require('wibox')
local launcher = require('common.widgets.launcher')
local modkey = require('user.settings').keyboard.modkey
local center = require('utils.widget').center
local indicators = require('custom.themes.oceanic.bar.items.indicators')
local battery = require('common.widgets.battery')
local volume = require('common.widgets.volume')

return function(theme, screen)
  screen.mytaglist = awful.widget.taglist {
    screen = screen,
    filter = awful.widget.taglist.filter.all,
    layout = {
      layout = wibox.layout.fixed.vertical,
    },
    buttons = {
      awful.button({}, 1, function(t)
        t:view_only()
      end),
      awful.button({ modkey }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, function(t)
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
  }

  screen.mywibox = awful.wibar {
    position = 'left',
    height = screen.geometry.height - 18,
    border_color = theme.fg_focus,
    border_width = 0.5,
    screen = screen,
    widget = {
      layout = wibox.layout.align.vertical,
      {
        layout = wibox.layout.fixed.vertical,
        launcher(theme),
      },
      {
        layout = wibox.layout.fixed.vertical,

        center(screen.mytaglist),
      },
      {
        layout = wibox.layout.fixed.vertical,
        volume(theme),
        battery(theme),
        indicators(theme),
      },
    },
  }

  screen.mywibox.y = 8
  screen.mywibox.x = 4
end
