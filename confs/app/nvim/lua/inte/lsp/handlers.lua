-- Internal lsp handler --
local this = {}

function this.on_attach(client, bufnr)
	require("inte.lsp.handlers.fmt")(client, bufnr)
	require("inte.lsp.handlers.fidget")()
	require("inte.lsp.handlers.keybinds")(client, bufnr)
	require("nvim-navic").attach(client, bufnr)
	require("illuminate").on_attach(client)

	if client.server_capabilities.colorProvider then
		require("document-color").buf_attach(bufnr)
	end
end

this.capabilities = vim.lsp.protocol.make_client_capabilities()
this.capabilities = require("cmp_nvim_lsp").update_capabilities(this.capabilities)
return this
