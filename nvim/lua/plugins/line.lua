plugin {
	name = "Status Line for NeoVim", 
	url = 'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', 'catppuccin/nvim' }, 
	config = function()
		require('lualine').setup({
			options = {
				theme = OmegaVim.lineTheme or 'auto' 
			}
		})
	end
}
