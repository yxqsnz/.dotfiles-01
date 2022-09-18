local awful = require('awful')
local popup = require('utils.widget').popup
local show = require('utils.popup').show
local wibox = require('wibox')
local strings = require('utils.strings')

local function async_get_volume(fn)
  awful.spawn.easy_async_with_shell('pamixer --get-volume', function(output)
    fn(tonumber(strings.trim(output)))
  end)
end

local function emit_event()
  async_get_volume(function(vol)
    ---@diagnostic disable-next-line: param-type-mismatch
    awesome.emit_signal('volume::change', vol)
  end)
end

local function show_vol()
  async_get_volume(function(volume)
    show(popup {
      wibox.widget.textbox(tostring(volume) .. '%'),
      layout = wibox.layout.fixed.vertical,
    })
  end)

  emit_event()
end

---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
awesome.connect_signal('volume::raise', function()
  awful.spawn.easy_async_with_shell('pamixer -i 2', show_vol)
end)

---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
awesome.connect_signal('volume::lower', function()
  awful.spawn.easy_async_with_shell('pamixer -d 2', show_vol)
end)

emit_event()
