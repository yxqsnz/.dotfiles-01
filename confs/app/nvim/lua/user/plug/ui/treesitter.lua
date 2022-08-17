with({
	"nvim-treesitter/nvim-treesitter",
	requires = { { "p00f/nvim-ts-rainbow", after = "nvim-treesitter" } },
	event = "BufRead",
	run = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
}, function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "c", "rust", "lua", "elixir", "cpp", "go", "python", "markdown", "markdown_inline" },
		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		matchup = {
			enable = true,
		},
		rainbow = {
			enable = true,
			extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			max_file_lines = 1000, -- Do not enable for files with more than n lines, int
		},
	})
end)
