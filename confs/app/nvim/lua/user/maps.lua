local which = require("which-key")
local utils = require("core.utils")
local command = utils.command

which.register({
	f = {
		name = "+find", -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
		t = { "<cmd>NvimTreeToggle<cr>", "Open file manager" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = true },
		d = command("Lspsaga lsp_finder", "Find usage"),
		w = command("Telescope live_grep", "Live grep"),
		sw = {
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			"find word",
			noremap = true,
		},
	},
}, { prefix = vim.g.mapleader })

which.register({
	["<SPACE>"] = {
		["<SPACE>"] = command("Telescope find_files", "Find files"),
	},
})

vim.cmd([[noremap <ESC> <cmd>nohl<cr>]])
