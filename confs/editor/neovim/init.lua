local here = vim.fn.stdpath("config")
local stdpath = {
  plugs = here .. '/lua/plug'
}

Global = {}

function Global.put(name, val) 
  if not _G[name] then
    _G[name] = val
  else
    print('err:Global:put: invalid name')
  end
end

local packer = require('core.packer')

require('user.options') -- Use options
require('user.config')  -- Cache config

packer:boostrap()
packer:load_plugins_from(stdpath.plugs)
packer:init()

pcall(require, 'impatient')

