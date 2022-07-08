local lconfig = require("lspconfig")
local installer = require("nvim-lsp-installer")
local handler = require("plugins.lsp.handler")
installer.setup({
  automatic_installation = true,
})
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
local border = {
  { "╭", "CmpBorder" },
  { "─", "CmpBorder" },
  { "╮", "CmpBorder" },
  { "│", "CmpBorder" },
  { "╯", "CmpBorder" },
  { "─", "CmpBorder" },
  { "╰", "CmpBorder" },
  { "│", "CmpBorder" },
}
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

for name, symbol in pairs(symbols) do
  local group = "DiagnosticSign" .. name
  vim.fn.sign_define(group, { text = symbol, texthl = group, numhl = group })
end
for _, server in ipairs(Settings.lsp.servers) do
  local opts = handler
  opts["handlers"] = handlers
  local has_config, server_config = pcall(require, "user.lsp.settings." .. server)
  if has_config then
    opts = MergeTable(opts, server_config)
  end
  lconfig[server].setup(opts)
end
