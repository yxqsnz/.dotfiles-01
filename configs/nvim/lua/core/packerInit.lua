local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
PACKER_BOOTSTRAP = false
if fn.empty(fn.glob(install_path)) > 0 then
  print("Info: Installing Packer :<")
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packerInit.lua source <afile> | PackerSync
  augroup end
]])
local packer = require("packer")

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
return packer.startup(function(use)
  use({ "wbthomason/packer.nvim", "lewis6991/impatient.nvim" })
  use({
    Settings.theme.repo,
    as = Settings.theme.name,
    config = function()
      require(Settings.theme.config)
    end,
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
  })
  use({
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      vim.schedule(function()
        require("copilot").setup()
      end)
    end,
  })
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
  })
  use({ "andweeb/presence.nvim", event = "VimEnter" })
  use({
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
      local notify = vim.notify
      vim.notify = function(msg, ...)
        if msg:match("warning: multiple different client offset_encodings") then
          return
        end

        notify(msg, ...)
      end
    end,
  })

  use({
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()
    end,
  })

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-emoji",
      "zbirenbaum/copilot-cmp",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("plugins.cmp")
    end,
  })

  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer",
      "kevinhwang91/nvim-bqf",
      "j-hui/fidget.nvim",
      "RRethy/vim-illuminate",
      "hrsh7th/cmp-nvim-lsp",
      "ray-x/lsp_signature.nvim",
    },
    config = function()
      require("plugins.lsp")
    end,
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("plugins.lsp.null_ls")
    end,
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = { "p00f/nvim-ts-rainbow" },
    config = function()
      local ts = require("nvim-treesitter.configs")
      ts.setup({
        ensure_installed = Settings.treesitter.ensure_installed,
        sync_install = false,
        rainbow = { enable = true },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  })
  use({
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "catppuccin",
          --				component_separators = { left = "", right = "" },
          --					section_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      })
    end,
  })
  use({ "~/.vim/plugins/yex-lang/" })
  use({
    "simrat39/rust-tools.nvim",
    ft = { "rs", "rust" },
    config = function()
      require("rust-tools").setup({
        tools = {
          autoSetHints = true,
          hover_with_actions = true,
          runnables = {
            use_telescope = true,
          },
          inlay_hints = {
            parameter_hints_prefix = "",
            other_hints_prefix = "",
          },
        },
        server = {
          on_attach = require("plugins.lsp.handler").on_attach,
        },
      })
    end,
  })
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
