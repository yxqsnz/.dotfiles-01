plugin({
	"andweeb/presence.nvim",
	event = "BufRead",
	config = function()
		require("presence"):setup({})
	end,
})
