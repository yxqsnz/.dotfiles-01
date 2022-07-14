local null = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local opts = { sources = {} }
for _, fmt in ipairs(Settings.lsp.formatters) do
  table.insert(opts.sources, null.builtins.formatting[fmt])
end
for _, linter in ipairs(Settings.lsp.linters) do
  table.insert(opts.sources, null.builtins.diagnostics[linter])
end

for _, code_action in ipairs(Settings.lsp.code_actions) do
  table.insert(opts.sources, null.builtins.code_actions[code_action])
end

opts.on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          filter = function(lsp_client)
            return lsp_client.name == "null-ls"
          end,
        })
      end,
    })
  end
end
null.setup(opts)
