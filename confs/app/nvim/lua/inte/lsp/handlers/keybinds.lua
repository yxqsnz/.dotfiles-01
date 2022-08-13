local which = require("which-key")
local utils = require("core.utils")
local map = utils.command

return function(client, bufnr)
	which.register({
		l = {
			name = "+Lsp",
			D = { vim.lsp.buf.declaration, "Goto declaration" },
			i = map("lua vim.lsp.buf.implementation()", "Goto implementation"),
			r = map("Lspsaga rename", "Rename"),
			a = map("Lspsaga code_action", "Code action"),
		},
		t = {
			l = map("TroubleToggle", "Show diagnostics"),
		},
	}, { leader = vim.g.mapleader })

	which.register({
		["[d"] = map("Lspsaga diagnostic_jump_prev", "Go to the previus diagnostic"),
		["]d"] = map("Lspsaga diagnostic_jump_next", "Go to the next diagnostic"),
	})

	if client.name == "rust_analyzer" then
		which.register({
			K = map('lua require("rust-tools").hover_actions.hover_actions()', "Rust hover action", bufnr),
		})
	else
		which.register({ K = map("Lspsaga hover_doc", "Hover") })
	end
end