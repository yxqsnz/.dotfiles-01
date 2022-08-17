_G.user = {
	lsp = {
		servers = { "sumneko_lua", "clangd", "denols", "tsserver", "pyright", "hls" },
		null_ls = {
			formatting = { "stylua", "rustfmt", "black", "prettier", "brittany" },
			diagnostics = { "eslint" },
			completion = { "spell" },
		},
	},

	theme = {
		name = "catppuccin",
		repo = "catppuccin/nvim",
		setup = function(apply)
			require("catppuccin").setup({
				dim_inactive = {
					enabled = false,
					shade = "dark",
					percentage = 0.15,
				},
				transparent_background = false,
				term_colors = true,
				compile = {
					enabled = true,
					path = vim.fn.stdpath("cache") .. "/catppuccin",
				},
				styles = {
					comments = { "italic" },
					conditionals = { "underline" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				integrations = {
					treesitter = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = {},
							hints = {},
							warnings = {},
							information = {},
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
					coc_nvim = false,
					lsp_trouble = false,
					cmp = true,
					lsp_saga = false,
					gitgutter = false,
					gitsigns = true,
					leap = false,
					telescope = true,
					nvimtree = {
						enabled = true,
						show_root = true,
						transparent_panel = false,
					},
					neotree = {
						enabled = false,
						show_root = false,
						transparent_panel = false,
					},
					dap = {
						enabled = false,
						enable_ui = false,
					},
					which_key = false,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					dashboard = true,
					neogit = false,
					vim_sneak = false,
					fern = false,
					barbar = false,
					bufferline = true,
					markdown = true,
					lightspeed = false,
					ts_rainbow = true,
					hop = false,
					notify = true,
					telekasten = true,
					symbols_outline = true,
					mini = false,
					aerial = false,
					vimwiki = true,
					beacon = true,
					navic = false,
					overseer = false,
				},
				color_overrides = {},
				highlight_overrides = {},
			})
			vim.g.catppuccin_flavour = "frappe"
			apply("catppuccin")
		end,
	},
}
