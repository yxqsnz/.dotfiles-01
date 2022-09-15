local mod = {}
local awful = require('awful')
local utils = require('core.utils')

function mod.spawn_if_not_running(cmd)
  awful.spawn.easy_async_with_shell(string.format('pgrep -x %s || %s', cmd, cmd), utils.noop)
end

return mod
