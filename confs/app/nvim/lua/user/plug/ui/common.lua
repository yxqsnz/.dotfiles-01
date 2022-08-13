with({ "lukas-reineke/indent-blankline.nvim", after = { "nvim-treesitter" }, event = "BufRead" }, function()
	require("indent_blankline").setup({
		show_current_context = false,
		show_current_context_start = true,
		use_treesitter = true,
	})
end)
