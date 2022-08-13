-- Internal lsp handler --
local this = {}

local coq = require("coq")

function this.on_attach(client, bufnr)
	require("inte.lsp.handlers.fmt")(client, bufnr)
	require("inte.lsp.handlers.fidget")()
	require("inte.lsp.handlers.keybinds")(client, bufnr)
	require("nvim-navic").attach(client, bufnr)
	require("illuminate").on_attach(client)

	vim.cmd(":COQnow --shut-up")
end

return coq.lsp_ensure_capabilities(this)
