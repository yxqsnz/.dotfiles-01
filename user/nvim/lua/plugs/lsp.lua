local capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp = require('lspconfig')
local Servers = { "rust_analyzer", "clangd", "sumneko_lua", "grammarly", "pyright", "elixirls", "tsserver", "hls", "jdtls" }

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require("nvim-lsp-installer").setup({
  automatic_installation = { exclude = "hls" },
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local function on_attach(client, bufnr)
  require("fidget").setup({});
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        if vim.lsp.buf.format then
          vim.lsp.buf.format({ bufnr = bufnr })
        else
          vim.lsp.buf.formatting_sync()
        end
      end,
    })
  end
end

local function get_config_of_server_or_default(server_name)
  local present, plugin = pcall(require, 'plugs.servers.' .. server_name)
  if present then return plugin else return {} end
end

for _, Server in ipairs(Servers) do
  lsp[Server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = get_config_of_server_or_default(Server)
  })
end


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
