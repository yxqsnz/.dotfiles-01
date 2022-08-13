with({ "lewis6991/gitsigns.nvim", event = "BufRead" }, function()
	require("gitsigns").setup()
end)
