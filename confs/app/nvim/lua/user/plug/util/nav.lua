with({
	"phaazon/hop.nvim",
	event = "BufRead",
}, function()
	require("hop").setup()
	vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
	vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
end)

with({
	"windwp/nvim-spectre",
	event = "BufRead",
}, function()
	require("spectre").setup()
end)

with({
	"windwp/nvim-ts-autotag",
	after = "nvim-treesitter",
}, function()
	require("nvim-ts-autotag").setup()
end)

with({
	"JoosepAlviste/nvim-ts-context-commentstring",
	event = "BufRead",
})
