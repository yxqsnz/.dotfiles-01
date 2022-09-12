local here = vim.fn.stdpath('config')

local stdpath = {
  plugs = here .. '/lua/plug',
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
require('user.config') -- Cache config

packer:boostrap()
packer:load_plugins_from(stdpath.plugs)
packer:init()

pcall(require, 'impatient')

local default_plugins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'matchit',
  'tar',
  'tarPlugin',
  'rrhelper',
  'spellfile_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'tutor',
  'rplugin',
  'syntax',
  'synmenu',
  'optwin',
  'compiler',
  'bugreport',
  'ftplugin',
  'man',
}

for _, plugin in pairs(default_plugins) do
  vim.g['loaded_' .. plugin] = 1
end

vim.opt.guifont = 'JetBrainsMono Nerd Font:h8'
vim.g.neovide_cursor_antialiasing = false
vim.g.neovide_cursor_vfx_mode = 'pixiedust'
vim.g.neovide_refresh_rate = 120
