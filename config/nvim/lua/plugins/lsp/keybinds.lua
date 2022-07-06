local keymap = require("utils.keymap")
return function(bufnr)
  local mapper = keymap.buffer(bufnr)

  keymap.map_for(mapper, { "n", "i" }, "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
  mapper.map("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>")
  mapper.map("n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  mapper.map("n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  mapper.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  mapper.map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
end
