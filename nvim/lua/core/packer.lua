local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require('packer')
packer.startup(function (use)
  use { 'wbthomason/packer.nvim' }
  for _, plugin in pairs(OmegaVim.plugins) do
	  use {
		  plugin.url,
		  event = plugin.event or 'VimEnter',
		  config = plugin.config or function() end,
		  requires = plugin.requires or {},
		  after = plugin.after or {},
		  as = plugin.as
	  }
  end
  if packer_bootstrap then
	  packer.sync()
	  packer.compile()
  end
end)
