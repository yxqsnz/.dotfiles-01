local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'


if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd [[packadd packer.nvim]]
end
return require('packer').startup(function(use)
  use({ 'wbthomason/packer.nvim' })
  use({ "yxqsnz/3bc.vim" })
  use({ "ron-rs/ron.vim", })
  use({ "elkowar/yuck.vim" })
  use({ "folke/trouble.nvim", cmd = "TroubleToggle" })
  use({ 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async', config = function()
    vim.wo.foldcolumn = '1'
    vim.wo.foldlevel = 99
    vim.wo.foldenable = true
  end })
  use({ "ziontee113/syntax-tree-surfer", event = "BufEnter", config = function()
    require("syntax-tree-surfer").setup({
      highlight_group = "STS_highligh",
      left_hand_side = "fdsawervcxqtzb",
      right_hand_side = "jkl;oiu.,mpy/n",
    })
  end })

  use({ "norcalli/nvim-colorizer.lua", event = "BufReadPre", config = function()
    require('colorizer').setup()
  end })
  use({ "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline", config = function()
    vim.g.symbols_outline = {
      highlight_hovered_item = false
    }
  end })

  use({ "sainnhe/gruvbox-material", config = function()
    vim.cmd [[colorscheme gruvbox-material]]
  end })

  use({ 'lewis6991/impatient.nvim', config = function()
    require('impatient')
  end })

  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  })

  use({
    "neovim/nvim-lspconfig",
    requires = { "williamboman/nvim-lsp-installer", "j-hui/fidget.nvim" },
    config = function()
      require('plugs.lsp')
    end
  })


  use({ "akinsho/bufferline.nvim", event = "BufEnter", config = function()
    require('plugs.bufferline')
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


  use({
    "simrat39/rust-tools.nvim",
    requires = { "neovim/nvim-lspconfig" },
  })



  use({ "github/copilot.vim", event = "BufEnter" })

  use({
    "kyazdani42/nvim-tree.lua",
    cmd = 'NvimTreeToggle',
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require('plugs.file_manager')
    end
  })


  use({
    "nvim-lualine/lualine.nvim",
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
      --      "hrsh7th/cmp-copilot",
      { "petertriho/cmp-git", requires = { "nvim-lua/plenary.nvim" } },
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require('plugs.cmp')
    end
  })

  use({
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
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
