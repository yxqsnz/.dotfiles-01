plugin({
	"saecki/crates.nvim",
	event = { "BufWinEnter Cargo.toml" },
	requires = { { "nvim-lua/plenary.nvim" } },
	after = { "cmp-nvim-lsp" },
	config = function()
		require("crates").setup()
		local cmp = require("cmp")
		cmp.setup.buffer({ sources = { { name = "crates" } } })
	end,
})

plugin({
	"simrat39/rust-tools.nvim",
	after = { "nvim-lspconfig" },

	config = function()
		local opts = {
			tools = {
				executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
				reload_workspace_from_cargo_toml = true,
				inlay_hints = {
					auto = true,
					only_current_line = false,
					show_parameter_hints = true,
					parameter_hints_prefix = "",
					other_hints_prefix = "",
					max_len_align = false,
					max_len_align_padding = 1,
					right_align = false,
					right_align_padding = 7,
					highlight = "Comment",
				},
				hover_actions = {
					border = {
						{ "╭", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╮", "FloatBorder" },
						{ "│", "FloatBorder" },
						{ "╯", "FloatBorder" },
						{ "─", "FloatBorder" },
						{ "╰", "FloatBorder" },
						{ "│", "FloatBorder" },
					},
					auto_focus = true,
				},
			},
			server = {
				on_attach = require("plug.editor.lsp.handler").on_attach,
			},
		}

		require("rust-tools").setup(opts)
	end,
})
