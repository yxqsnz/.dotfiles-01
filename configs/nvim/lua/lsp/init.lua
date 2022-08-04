local lspconfig = require('lspconfig')
require('nvim-lsp-installer').setup()

local servers = { "clangd", "sumneko_lua" }

for _, server in pairs(servers) do
  local opts = require('lsp.handlers')
  lspconfig[server].setup(opts)
end
