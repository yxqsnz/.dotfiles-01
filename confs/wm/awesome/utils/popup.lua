local mod = {}
local gears = require('gears')

function mod.show(popup)
  ---@diagnostic disable-next-line: param-type-mismatch
  local last = os.time(os.date('!*t'))
  popup.visible = true
  gears.timer {
    timeout = 3,
    autostart = true,
    single_shot = true,
    callback = function()
      ---@diagnostic disable-next-line: param-type-mismatch
      local delta = os.time(os.date('!*t')) - last

      if delta >= 2.5 then
        popup.visible = false
      end
    end,
  }
end

return mod
