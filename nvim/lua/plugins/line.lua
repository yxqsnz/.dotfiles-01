plugin {
	url = 'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons' },
	after = { "catppuccin" } ,
	config = function()
		require('lualine').setup {
			options = {
				theme = "catppuccin"
			}
		}
	end
}
