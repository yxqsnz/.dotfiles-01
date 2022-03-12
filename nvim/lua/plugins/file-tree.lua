plugin { 
	url = 'kyazdani42/nvim-tree.lua', 
	requires = {'kyazdani42/nvim-web-devicons'},  
	config = function() 
		require('nvim-tree').setup()
	end
}
