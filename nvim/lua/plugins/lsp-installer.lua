plugin {
	url = 'williamboman/nvim-lsp-installer',
	config = function()
		local lsp_installer = require('nvim-lsp-installer')
		lsp_installer.settings({
			ui = {
				icons = {
					server_installed = "✓",
					server_pending = "➜",
					server_uninstalled = "✗"
				}
			}
		})
	end
}
