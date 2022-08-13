with({ "akinsho/bufferline.nvim", event = "BufRead" }, function()
	require("bufferline").setup({
		options = {
			always_show_bufferline = false,
		},
	})
end)

with({
	"folke/todo-comments.nvim",
	requires = "nvim-lua/plenary.nvim",
	event = "BufRead",
}, function()
	require("todo-comments").setup({})
end)

with({ "rcarriga/nvim-notify" }, function()
	vim.notify = require("notify")
	local notify = require("notify")
	vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
		local client = vim.lsp.get_client_by_id(ctx.client_id)
		local lvl = ({
			"ERROR",
			"WARN",
			"INFO",
			"DEBUG",
		})[result.type]
		notify({ result.message }, lvl, {
			title = "LSP | " .. client.name,
			timeout = 10000,
			keep = function()
				return lvl == "ERROR" or lvl == "WARN"
			end,
		})
	end
end)
