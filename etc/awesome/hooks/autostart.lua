local settings = require('user.settings')
local awful    = require('awful')
local logger   = require('utils.logger')
local function run_once(cmd_arr)
  for _, cmd in ipairs(cmd_arr) do
    awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
  end
end

for _, app in pairs(settings.system.autostart) do
  logger.info('running app[autostart]: ' .. app)
  run_once({ app })
end
