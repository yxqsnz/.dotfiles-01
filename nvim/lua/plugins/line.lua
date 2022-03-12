plugin {
	name = "Status Line for NeoVim",
	url = 'feline-nvim/feline.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', 'catppuccin/nvim' },
	after = "catppuccin",
	config = function()
		require("feline").setup({
			components = require('catppuccin.core.integrations.feline'),
		})
	end
}
