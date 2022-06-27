local capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp = require('lspconfig')
local SERVERS = { "rust_analyzer",
  "clangd",
  "sumneko_lua",
  "grammarly",
  "pyright",
  "elixirls",
  "tsserver",
  "hls",
  "jdtls",
  "eslint",
  "cssls",
  "html",
  "asm_lsp" }

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
require("nvim-lsp-installer").setup({
  automatic_installation = { true, exclude = { "hls", "jdtls" } },
  ui = {
    icons = {
      server_installed = "",
      server_pending = "",
      server_uninstalled = ""
    }
  }
})

local function on_attach(client, bufnr)
  require("fidget").setup({})
  --require('ufo').setup()
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

for _, server in ipairs(SERVERS) do
  if server == 'rust_analyzer' then
    require('rust-tools').setup({
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = get_config_of_server_or_default(server)
      }
    })
  else
    lsp[server].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = get_config_of_server_or_default(server)
    })
  end
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
local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("warning: multiple different client offset_encodings") then
    return
  end

  notify(msg, ...)
end
local configs = require('lspconfig.configs')
if not configs.sleepy then
  configs.sleepy = {
    default_config = {
      filetypes = { '3bc' },
      root_dir = function(fname)
        return lsp.util.find_git_ancestor(fname)
      end,
      cmd = { '/home/gk/Documents/Projects/Rust/sleepy-ls/target/debug/sleepy-ls' },
      settings = {}
    },
    docs = [[ lol ]]
  }
end
lsp.sleepy.setup({ on_attach = on_attach,
  capabilities = capabilities,
});
