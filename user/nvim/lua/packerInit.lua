local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then PACKER_BOOTSTRAP = fn.system { "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "kyazdani42/nvim-web-devicons"
  use "norcalli/nvim-base16.lua"
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "windwp/nvim-ts-autotag" -- Auto close and auto rename html tags
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-tree.lua"
  use "moll/vim-bbye" -- Delete buffers easily
  use "nvim-lualine/lualine.nvim"
  use { 'akinsho/bufferline.nvim', tag = "*" }
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "Pocco81/AutoSave.nvim"
  use 'norcalli/nvim-colorizer.lua' -- Colorizes color codes
  use 'rcarriga/nvim-notify'
  use "max397574/better-escape.nvim"
  use "Pocco81/TrueZen.nvim"
  use "kevinhwang91/nvim-hlslens"
  use "folke/trouble.nvim"
  use "folke/todo-comments.nvim"
  use 'stevearc/aerial.nvim'
  use 'nacro90/numb.nvim'
  use "RRethy/vim-illuminate"
  use 'rlane/pounce.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'andymass/vim-matchup'
  use 'karb94/neoscroll.nvim'
  use 'danymat/neogen'
  use 'abecodes/tabout.nvim'

  use {
    'michaelb/sniprun',
    run = 'bash install.sh'
  }

  use({
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
  })

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-calc"
  use "hrsh7th/cmp-nvim-lsp-signature-help"
  use {
    'tzachar/cmp-tabnine',
    run = './install.sh'
  }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "williamboman/nvim-lsp-installer"
  use "neovim/nvim-lspconfig" -- enable LSP
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "onsails/lspkind.nvim"
  use "ray-x/lsp_signature.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "TimUntersberger/neogit"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
