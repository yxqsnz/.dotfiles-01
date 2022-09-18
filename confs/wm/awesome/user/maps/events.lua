return function(_)
  local awful = require('awful')
  awful.keyboard.append_global_keybindings {
    awful.key({}, 'XF86AudioRaiseVolume', function()
      ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
      awesome.emit_signal('volume::raise')
    end),

    awful.key({}, 'XF86AudioLowerVolume', function()
      ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
      awesome.emit_signal('volume::lower')
    end),
  }
end
