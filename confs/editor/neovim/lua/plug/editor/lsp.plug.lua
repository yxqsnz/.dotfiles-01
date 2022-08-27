plugin {
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason-lspconfig.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'nvim-lua/plenary.nvim',
    'lukas-reineke/lsp-format.nvim',
    'tamago324/nlsp-settings.nvim',
    'ray-x/lsp_signature.nvim',
    'j-hui/fidget.nvim'
  },

  config = function()
    local lsp    = require 'lspconfig'
    local config = require('user.config').lsp
    local null   = require('null-ls')
    local utils  = require('core.utils')

    require("mason-lspconfig").setup({
      ensure_installed = config.servers,
      automatic_installation = true,
    })

    local nlspsettings = require("nlspsettings")

    nlspsettings.setup({
      config_home = vim.fn.stdpath('config') .. '/lsp-settings',
      local_settings_dir = ".neovim",
      local_settings_root_markers_fallback = { '.git' },
      append_default_schemas = true,
      loader = 'json'
    })

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      severity_sort = true,
      update_in_insert = false,
    })

    local signs = { Error = " ", Warn = " ", Info = " ", Hint = " " }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    for _, server in pairs(config.servers) do
      local server_config = require('plug.editor.lsp.handler')

      local server_settings_exists, server_custom_config = pcall(require, 'plug.editor.lsp.settings.' .. server)

      if server_settings_exists then
        server_config = vim.tbl_deep_extend('force', server_config, server_custom_config)
      end

      lsp[server].setup(server_config)
    end

    null.setup({
      sources = utils.map_field(null.builtins.formatting, config.formatters)
    })
  end
}
