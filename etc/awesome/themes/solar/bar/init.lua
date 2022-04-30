return function(theme)
  require("awful.hotkeys_popup.keys")
  local lain                       = require('lain')
  local gears                      = require('gears')
  local wibox                      = require('wibox')
  local awful                      = require('awful')
  local naughty                    = require('naughty')
  local docker                     = require('awesome-wm-widgets.docker-widget.docker')
  local dpi                        = require("beautiful.xresources").apply_dpi
  local markup                     = lain.util.markup
  local base_col                   = "#101020"
  local round_shape                = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, dpi(3))
  end
  naughty.config.defaults.position = 'bottom_right'
  naughty.config.padding           = 16
  local my_table                   = awful.util.table or gears.table -- 4.{0,1} compatibility
  local spr                        = wibox.widget.textbox(' ')
  local block                      = function(widgets, color)
    return wibox.container.margin(
      wibox.container.background(
        wibox.widget(widgets),
        color, round_shape),
      dpi(3), dpi(3), dpi(3), dpi(3))
  end

  -- Textclock
  local clocktext = awful.widget.watch(
    "date +' %a %d %b %R '", 60,
    function(widget, stdout)
    widget:set_markup(" " .. markup.font(theme.font, markup.fg.color(base_col, stdout)))
  end
  )

  local clock = block({
    clocktext,
    layout = wibox.layout.align.horizontal
  },
    theme.clock_color)

  -- Calendar
  theme.cal = lain.widget.cal({
    attach_to = { clock },
    notification_preset = {
      font = "Hack Nerd Font Mono",
      fg   = theme.fg_normal,
      bg   = base_col
    }
  })

  -- MEM
  local memicon = wibox.widget.imagebox(theme.widget_mem)
  local memtext = lain.widget.mem({
    settings = function()
      widget:set_markup(markup.font(theme.font, ' ' .. markup.fg.color(base_col, mem_now.used .. "MB ")))
    end
  })
  local mem = block({
    memicon,
    memtext,
    layout = wibox.layout.align.horizontal
  },
    theme.mem_color)

  -- CPU
  local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
  local cputext = lain.widget.cpu({
    settings = function()
      widget:set_markup(markup.font(theme.font, ' ' .. markup.fg.color(base_col, cpu_now.usage .. "% ")))
    end
  })

  local cpu = block({
    cpuicon,
    cputext,
    layout = wibox.layout.align.horizontal
  },
    theme.cpu_color)


  -- Coretemp
  local tempicon = wibox.widget.imagebox(theme.widget_temp)
  local temptext = awful.widget.watch(
    "cat /sys/class/thermal/thermal_zone0/temp", 30,
    function(widget, stdout)
    local tmp = string.sub(stdout, 1, -2)
    tmp = tonumber(tmp) / 1000
    tmp = string.format("%.1f", tmp)
    widget:set_markup(markup.font(theme.font, ' ' .. markup.fg.color(base_col, tmp .. "°C ")))
  end
  )

  local temp = block({
    tempicon,
    temptext,
    layout = wibox.layout.align.horizontal
  },
    theme.temp_color)


  -- Battery
  local baticon = wibox.widget.imagebox(theme.widget_battery)
  local battext = awful.widget.watch(
    "cat /sys/class/power_supply/BAT0/capacity", 20,
    function(widget, stdout)
    widget:set_markup(markup.font(theme.font, markup.fg.color(base_col, ' ' .. string.sub(stdout, 1, -2) .. "% ")))
  end
  )

  local bat = block({
    baticon,
    battext,
    layout = wibox.layout.align.horizontal
  },
    theme.bat_color)

  -- Music
  local musicicon = wibox.widget.imagebox(theme.widget_music)
  local musictext = awful.widget.watch(
    'playerctl metadata --format="{{artist}} :{{title}} :{{status}}"', 10,
    function(widget, stdout)
    local out = string.sub(stdout, 1, -2)

    local artist, title, status = string.match(out, "(.*):(.*):(.*)")

    if stdout == nil or
        artist == '' or
        artist == nil or
        status == '' or
        status == nil
    then
      musicicon.image = nil
      widget:set_markup("")
    else
      local text = artist
      if title ~= nil then
        text = text .. "- " .. title
      end

      widget:set_markup(" " .. markup.font(theme.font, markup.fg.color(base_col, text)))

      if status == "Playing" then
        musicicon.image = theme.widget_music
      elseif status == "Paused" then
        musicicon.image = theme.widget_music_paused
      else
        musicicon.image = nil
      end
    end
  end
  )

  function theme.update_music(command)
    awful.spawn.easy_async_with_shell(
      command .. '&& sleep 0.1 && playerctl metadata --format="{{artist}} :{{title}} :{{status}}"',
      function(stdout)
      local out = string.sub(stdout, 1, -2)

      local artist, title, status = string.match(out, "(.*):(.*):(.*)")

      if stdout == nil or
          artist == '' or
          artist == nil or
          status == '' or
          status == nil
      then
        musicicon.image = nil
        musictext:set_markup("")
      else
        local text = artist
        if title ~= nil then
          text = text .. "- " .. title
        end

        musictext:set_markup(" " .. markup.font(theme.font, markup.fg.color(base_col, text)))

        if status == "Playing" then
          musicicon.image = theme.widget_music
        elseif status == "Paused" then
          musicicon.image = theme.widget_music_paused
        else
          musicicon.image = nil
        end
      end
    end
    )
  end

  local music = block({
    musicicon,
    musictext,
    layout = wibox.layout.align.horizontal
  },
    theme.music_color)

  -- Separators

  function theme.at_screen_connect(s)
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
      awful.button({}, 1, function() awful.layout.inc(1) end),
      awful.button({}, 2, function() awful.layout.set(awful.layout.layouts[1]) end),
      awful.button({}, 3, function() awful.layout.inc(-1) end),
      awful.button({}, 4, function() awful.layout.inc(1) end),
      awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
      screen = s,
      filter = awful.widget.taglist.filter.noempty,
      buttons = awful.util.taglist_buttons,
      style = {
        shape = round_shape,
      },
      layout = {
        spacing = 3,
        layout = wibox.layout.fixed.horizontal
      },
      widget_template = {
        layout = wibox.layout.fixed.horizontal,
        widget = wibox.container.margin,
        {
          id = 'background_role',
          bg = theme.bg_normal,
          widget = wibox.container.background,
          {
            widget = wibox.container.margin,
            margins = 4,
            {
              id = 'text_role',
              widget = wibox.widget.textbox,
              bg = theme.bg_focus,
            },
          },
        },
      },
    }

    s.mytaglist = wibox.container.margin(s.mytaglist, dpi(3), dpi(3), dpi(3), dpi(3))


    -- Create the wibox
    s.mywibox = awful.wibar({
      screen = s,
      position = "bottom",
      height = dpi(30),
      border_width = dpi(8),
      bg = base_col,
      fg = theme.fg_normal,
      shape = gears.shape.rounded_rect
    })
    local tray = wibox.widget.systray()
    tray:set_base_size(37)
    s.mywibox:setup {
      widget = wibox.container.background,
      shape_border_width = dpi(2),
      {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
          layout = wibox.layout.fixed.horizontal,
          --spr,
          s.mytaglist,
          s.mypromptbox,
          spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
          layout = wibox.layout.fixed.horizontal,
          tray,
          docker(),
          music,
          theme.volume,
          mem,
          cpu,
          temp,
          bat,
          clock,
          --:w
          --s.mylayoutbox,
        },
      }
    }

  end

  return theme
end
