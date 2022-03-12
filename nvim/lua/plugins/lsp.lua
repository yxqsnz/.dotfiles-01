plugin { 
	url = 'tami5/lspsaga.nvim', 
	event = 'BufEnter', 
	config = function() 
	end
}
plugin { 
  url = 'neovim/nvim-lspconfig', 
  event = 'BufEnter',
  requires = {'hrsh7th/cmp-nvim-lsp'},  
  config = function()
	local servers = { "rust_analyzer", "clangd" };
 	local lsp = require('lspconfig');   

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local symbols = {
		Error = "",
		Warn = "",
		Info = "",
		Hint = "",
	}

	for name, symbol in pairs(symbols) do
		local group = "DiagnosticSign" .. name
		vim.fn.sign_define(group, { text = symbol, texthl = group, numhl = group })
	end

	for _, server in ipairs(servers) do
		lsp[server].setup {
			capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
			root_dir = vim.loop.cwd,
		}
	end 

  end
}

