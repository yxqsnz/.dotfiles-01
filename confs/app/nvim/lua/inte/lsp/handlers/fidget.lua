return function()
	require("fidget").setup({
		text = {
			spinner = "dots_scrolling",
			done = " 👍",
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
