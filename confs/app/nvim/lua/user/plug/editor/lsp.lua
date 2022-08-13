with({
	"neovim/nvim-lspconfig",
	event = "BufRead",
	requires = {
		{ "ms-jpq/coq_nvim", requires = { "ms-jpq/coq.artifacts" } },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"ray-x/lsp_signature.nvim",
		"SmiteshP/nvim-navic",
		"j-hui/fidget.nvim",
		"windwp/nvim-autopairs",
		"glepnir/lspsaga.nvim",
		"RRethy/vim-illuminate",
	},
}, function()
	local handlers = require("inte.lsp.handlers")
	local lsp = _G.user.lsp
	local lspconfig = require("lspconfig")
	local saga = require("lspsaga")
	local npairs = require("nvim-autopairs")

	npairs.setup({ map_bs = false, map_cr = false })

	require("mason-lspconfig").setup({
		automatic_installation = true,
	})

	require("lsp_signature").setup({
		virtual_text = true,
		floating_window = false,
	})

	saga.init_lsp_saga({
		border_style = "single",
		code_action_lightbulb = {
			enable = false,
		},
		symbol_in_winbar = {
			in_custom = false,
			enable = true,
			separator = "  ",
			show_file = true,
			click_support = true,
		},
	})

	vim.diagnostic.config({
		virtual_text = false,
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
	})

	local signs = { Error = " ", Warn = " ", Info = " ", Hint = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	for _, server in pairs(lsp.servers) do
		local config = handlers

		local has_custom_config, custom_config = pcall(require, "inte.lsp.settings." .. server)

		if has_custom_config then
			config = vim.tbl_deep_extend("force", config, custom_config)
		end

		lspconfig[server].setup(config)
	end
end)

with({ "jose-elias-alvarez/null-ls.nvim" }, function()
	local null = require("null-ls")
	local conf = _G.user.lsp.null_ls
	local sources = {}
	for item, servers in pairs(conf) do
		local cat = null.builtins[item]
		for _, server in pairs(servers) do
			table.insert(sources, cat[server])
		end
	end
	require("null-ls").setup({ sources = sources })
end)

with({
	"ahmedkhalf/lsp-rooter.nvim",
	event = "BufRead",
	config = function()
		require("lsp-rooter").setup()
	end,
})

with({
	"andymass/vim-matchup",
	event = "CursorMoved",
	config = function()
		vim.g.matchup_matchparen_offscreen = { method = "popup" }
	end,
})

with({
	"simrat39/rust-tools.nvim",
	after = { "nvim-lspconfig" },
	ft = { "rust", "rs" },
}, function()
	require("rust-tools").setup({
		tools = {
			autoSetHints = true,
			inlay_hints = {
				parameter_hints_prefix = "<- ",
				other_hints_prefix = "",
			},
			runnables = {
				use_telescope = true,
			},
		},
		server = require("inte.lsp.handlers"),
	})
end)
