plugin {
	url = 'akinsho/bufferline.nvim',
	after = 'catppuccin',
	config = function()
	 require('bufferline').setup({
		options = {
			separator_style = "slant",
		}
	 })
	end
}
