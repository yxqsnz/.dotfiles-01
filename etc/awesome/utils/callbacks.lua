local awful = require('awful')
local function execute(command)
  return function()
    awful.spawn.easy_async({ 'bash', '-c', command }, function() end)
  end
end

return {
  execute = execute,
}
