local handler = {}
handler.capabilities = vim.lsp.protocol.make_client_capabilities()
handler.capabilities.textDocument.completion.completionItem.snippetSupport = true
handler.capabilities = require("cmp_nvim_lsp").update_capabilities(handler.capabilities)

function handler.on_attach(client, bufnr)
	require("plugins.lsp.keybinds")(bufnr)
	require("illuminate").on_attach(client)
	require("fidget").setup({
		text = {
			spinner = "dots_scrolling",
			done = " OK",
		},
		fmt = {
			leftpad = true, -- right-justify text in fidget box
			stack_upwards = true, -- list of tasks grows upwards
			max_width = 0, -- maximum width of the fidget box
			-- function to format fidget title
			fidget = function(fidget_name, spinner)
				return string.format("Loading %s%s", fidget_name, spinner)
			end,
			-- function to format each task line
			task = function(task_name, message, percentage)
				return string.format(
					"%s: %s %s",
					task_name,
					message,
					percentage and string.format("(%s%%)", percentage) or ""
				)
			end,
		},
		align = {
			bottom = true,
		},
	})
end

return handler
