plugin {
	url = 'catppuccin/nvim',
	as = "catppuccin",
	config = function()
		local catppuccin = require("catppuccin")
		catppuccin.setup({
			transparent_background = false,
			term_colors = true,
			styles = {
				comments = "NONE",
				functions = "NONE",
				keywords = "NONE",
				strings = "NONE",
				variables = "NONE",
			},
			integrations = {
				treesitter = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = "italic",
						hints = "italic",
						warnings = "italic",
						information = "italic",
					},
					underlines = {
						errors = "underline",
						hints = "underline",
						warnings = "underline",
						information = "underline",
					},
				},
				lsp_trouble = false,
				cmp = true,
				lsp_saga = true,
				gitgutter = false,
				gitsigns = true,
				nvimtree = {
					enabled = true,
					show_root = false,
					transparent_panel = false,
				},
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
				},
				dashboard = true,
				hop = false,
				telekasten = true,
			}
		});
		vim.cmd("colorscheme " .. OmegaVim.theme)
	end
}
