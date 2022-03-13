plugin {
	url = 'tami5/lspsaga.nvim',
	event = 'BufEnter',
	config = function()
	end
}
plugin {
	url = 'neovim/nvim-lspconfig',
	requires = { 'hrsh7th/cmp-nvim-lsp', 'williamboman/nvim-lsp-installer' },
	config = function()
		local present, lsp_installer = pcall(require, "nvim-lsp-installer");
        if not present then
			return
		end
		lsp_installer.settings({
			ui = {
				icons = {
					server_installed = "✓",
					server_pending = "➜",
					server_uninstalled = "✗"
				}
			}
		})
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

		local opts = {
			capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
			root_dir = vim.loop.cwd,
		}
		lsp_installer.on_server_ready(function(server)

			server:setup(opts)
		end)
	end
}

