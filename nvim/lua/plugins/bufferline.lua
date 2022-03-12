plugin {
	url = 'akinsho/bufferline.nvim',
	config = function()
	 require('bufferline').setup({
		options = {
			separator_style = "slant",
		}
	 })
	end
}
