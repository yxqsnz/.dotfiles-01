local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

local packer = require('packer')

packer.init({
  display = {
    done_sym = '' ,
    working_sym = '',
    error_sym = ' "',
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
})

return packer.startup(function(with)
  with({'wbthomason/packer.nvim', 'lewis6991/impatient.nvim'})

  with({"folke/which-key.nvim", config = function()
    require('which-key').setup()
  end})

  with({"nvim-treesitter/nvim-treesitter", config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { "c", "lua", "rust" },
      sync_install = false,
      highlight = {
        enable = true
      }
    })
  end})

  with({ 'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp' }, config = function()
    require('cmp')
  end})

  with({ 'saadparwaiz1/cmp_luasnip', requires = {'L3MON4D3/LuaSnip'}})


  with({"neovim/nvim-lspconfig", requires = {"williamboman/nvim-lsp-installer"}, config = function()
    require('lsp')
  end})

  with({"nvim-telescope/telescope.nvim", requires = {"nvim-lua/plenary.nvim"}, cmd = "Telescope"})

  with({"catppuccin/nvim", config = function()
    vim.g.catppuccin_flavour = "mocha"
    vim.cmd[[colorscheme catppuccin]]
  end})

  if packer_bootstrap then
    packer.sync()
  end
end)
