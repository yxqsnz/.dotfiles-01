local wibox = require('wibox')
local round = require('utils.widget').round
local margin = require('utils.widget').margin
local create_bar = require('common.base.indicator_bar')

local function update_bar_color(bar, theme, percentage, charging)
  if Integrations.gamemode_enabled then
    bar.color = theme.accent
  elseif charging then
    bar.color = theme.palette.cyan
  elseif percentage > 15 and percentage <= 30 then
    bar.color = theme.palette.yellow
  elseif percentage <= 15 then
    bar.color = theme.palette.red
  elseif percentage > 30 then
    bar.color = theme.palette.green
  end
end

return function(theme)
  local bar = create_bar(theme)

  bar.color = theme.palette.green
  local last_update = nil

  local function update_bar(update)
    if update then
      update_bar_color(bar, theme, update.percentage, update.state ~= 2)
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

    margin(round(theme, bar, 2), 7),
  }
end
