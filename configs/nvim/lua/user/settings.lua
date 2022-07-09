Settings = {
	theme = {
		repo = "catppuccin/nvim",
		name = "catppuccin",
		config = "user.theme",
	},
	lsp = {
		servers = { "rust_analyzer", "sumneko_lua", "clangd", "cssls", "jsonls", "tsserver" },
		linters = { "staticcheck" },
		formatters = { "stylua", "clang_format", "rustfmt" },
	},
	treesitter = {
		ensure_installed = { "rust", "lua", "markdown", "markdown_inline" },
	},
}
