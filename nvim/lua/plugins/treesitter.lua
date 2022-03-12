plugin { 
	url = 'nvim-treesitter/nvim-treesitter',
	event = 'BufEnter',
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup {
			ensure_installed = {
				"javascript",
				"typescript",
				"html",
				"css",
				"bash",
				"lua",
				"json",
				"python",
				"rust",
				"c"
			},
			highlight = {
				enable = true,
				use_languagetree = true
			},
		}
	end
}
