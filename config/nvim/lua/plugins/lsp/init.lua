local lconfig = require("lspconfig")
local installer = require("nvim-lsp-installer")
local handler = require("plugins.lsp.handler")
installer.setup()
require("lsp_signature").setup({
  bind = true,
  virtual_text = true,
  floating_window = false,
})
local symbols = {
  Error = "",
  Warn = "",
  Info = "",
  Hint = "",
}

for name, symbol in pairs(symbols) do
  local group = "DiagnosticSign" .. name
  vim.fn.sign_define(group, { text = symbol, texthl = group, numhl = group })
end
for _, server in ipairs(Settings.lsp.servers) do
  local opts = handler
  local has_config, server_config = pcall(require, "user.lsp.settings." .. server)
  if has_config then
    opts = MergeTable(opts, server_config)
  end
  lconfig[server].setup(opts)
end
