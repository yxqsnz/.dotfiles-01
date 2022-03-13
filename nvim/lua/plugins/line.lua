plugin {
	name = "Status Line for NeoVim",
	url = 'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', 'catppuccin/nvim' },
	after = "catppuccin",
	config = function()
		require('lualine').setup {
			options = {
				theme = "catppuccin"
				-- ... the rest of your lualine config
			}
		}
	end
}
