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
-- Lsp saga float term
vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm fish<CR>", { silent = true })
vim.keymap.set("t", "<A-d>", "<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>", { silent = true })
vim.cmd([[noremap <ESC> <cmd>nohl<cr>]])
