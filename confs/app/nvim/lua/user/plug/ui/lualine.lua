with({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" }, event = "BufEnter" }, function()
	---@diagnostic disable-next-line: redundant-parameter
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "catppuccin",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = { "alpha", "telescope" },
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = true,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = {
				{
					function()
						return " "
					end,
					padding = { left = 0, right = 0 },
					color = {},
					cond = nil,
				},
			},
			lualine_b = { "branch", "diff" },
			lualine_c = { "filename" },
			lualine_x = { "filetype" },
			lualine_y = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
				},
				"progress",
			},
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	})
end)
