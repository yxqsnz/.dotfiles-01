local gears = require('gears')
local mod = {}

function mod.get_theme_path(name)
  return gears.filesystem.get_configuration_dir() .. 'custom/themes/' .. name
end

return mod
