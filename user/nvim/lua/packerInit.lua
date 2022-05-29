local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd [[packadd packer.nvim]]
end
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use({ 'lewis6991/impatient.nvim', config = function()
    require('impatient').enable_profile()
  end })

  use({
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup({
        dir = Directories.sessions
      })
    end,
  })

  use({ "navarasu/onedark.nvim", config = function()
    require('onedark').setup {
      style = 'darker'
    }
    require('onedark').load()
  end })

  use({ "github/copilot.vim", event = "BufEnter" })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require('plugs.file_manager')
    end
  })


  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugs.line')
    end
  })


  use({ "tami5/lspsaga.nvim", config = function()
    require('lspsaga').setup()
  end })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end
  })

  use({
    "hrsh7th/nvim-cmp",
    requires = { "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require('plugs.cmp')
    end
  })

  use({ "simrat39/symbols-outline.nvim" })
  use({ "folke/trouble.nvim" })

  use({
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  })

  use({
    "neovim/nvim-lspconfig",
    requires = { "williamboman/nvim-lsp-installer", "j-hui/fidget.nvim" },
    config = function()
      require('plugs.lsp')
    end
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require('plugs.treesitter')
    end
  })
  if PACKER_BOOSTRAP then
    require('packer').sync()
  end
end)
