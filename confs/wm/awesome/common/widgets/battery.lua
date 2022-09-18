local wibox = require('wibox')
local round = require('utils.widget').round
local margin = require('utils.widget').margin
local rotate = require('utils.widget').rotate
local center = require('utils.widget').center

local function update_bar_color(bar, bar2, theme, percentage, charging)
  if Integrations.gamemode_enabled then
    bar.color = theme.accent
  elseif charging then
    bar.color = theme.palette.cyan
  elseif percentage > 15 and percentage <= 30 then
    bar.color = theme.palette.yellow
  elseif percentage <= 15 then
    bar.color = theme.palette.red
  elseif percentage > 30 and percentage < 95 then
    bar.color = theme.palette.green
    bar2.value = 0
  end

  if percentage > 95 then
    bar2.color = bar.color
    bar2.value = 1
  end
end

return function(theme)
  local bar = wibox.widget.progressbar()
  local bar2 = wibox.widget.progressbar()

  bar.forced_height = 5
  bar.forced_width = 30

  bar2.forced_height = 3
  bar2.forced_width = 6

  bar.background_color = theme.palette.bg2
  bar2.background_color = theme.palette.bg2

  bar.color = theme.palette.green
  bar2.color = theme.palette.green
  local last_update = nil

  local function update_bar(update)
    if update then
      update_bar_color(bar, bar2, theme, update.percentage, update.state ~= 2)
    end
  end

  ---@diagnostic disable-next-line: param-type-mismatch, missing-parameter
  awesome.connect_signal('upower::update', function(update)
    bar.value = update.percentage / 100
    last_update = update
    update_bar(last_update)
  end)

  local function on_gamemode_callback()
    update_bar(last_update)
  end

  ---@diagnostic disable-next-line: param-type-mismatch, missing-parameter
  awesome.connect_signal('gamemode::enabled', on_gamemode_callback)

  ---@diagnostic disable-next-line: param-type-mismatch, missing-parameter
  awesome.connect_signal('gamemode::disabled', on_gamemode_callback)

  return {
    layout = wibox.layout.fixed.vertical,
    spacing = 0,

    center(margin(bar2, { left = 12, right = 12, bottom = 0, top = 32 })),
    margin(
      round(theme, rotate(bar, 'east'), nil, function(cairo, width, height)
        local gears = require('gears')
        return gears.shape.partially_rounded_rect(cairo, width, height, true, true, false, false, 6)
      end),
      { left = 7, right = 7, bottom = 7, top = 0 }
    ),
  }
end
