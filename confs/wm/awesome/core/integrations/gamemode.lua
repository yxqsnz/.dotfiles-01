local log = require('core.logger')('Gamemode integration')
local awful = require('awful')
local cmd = [[bash -c 'while true; do
gamemoded --status
sleep 2
done']]

awful.spawn.with_line_callback(cmd, {
  stdout = function(line)
    if line == 'gamemode is active' and not Integrations.gamemode_enabled then
      log:info('Gamemode enabled.')
      Integrations.gamemode_enabled = true

      ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
      awesome.emit_signal('gamemode::enabled')
    elseif Integrations.gamemode_enabled then
      log:info('Gamemode disabled')
      ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
      awesome.emit_signal('gamemode::disabled')
      Integrations.gamemode_enabled = false
    end
  end,
})
