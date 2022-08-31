---@diagnostic disable: redundant-parameter
local this = {}

local setup_keybinds = require('plug.editor.lsp.maps')

local capabilities = vim.lsp.protocol.make_client_capabilities()
this.capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

function this.on_attach(_, bufnr)
  -- Signature
  require('lsp_signature').setup({
    bind = true,
    handler_opts = {
      border = 'single',
    },
  }, bufnr)

  setup_keybinds(bufnr)

  require('plug.editor.lsp.handlers.fidget')
end

return this
