local create_bar = require('common.base.indicator_bar')
local margin = require('utils.widget').margin
local round = require('utils.widget').round

return function(theme)
  local bar = create_bar(theme)

  bar.color = theme.palette.pink2

  ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
  awesome.connect_signal('volume::change', function(volume)
    bar.value = volume / 100
  end)

  return margin(round(theme, bar, 2), 7)
end
