local colors = {
  bg = '#202020',
  darker_grey2 = '#212121',
  darker_grey = '#262626',
  dark_grey = '#555555',
  light_grey = '#a0a0a0',
  bg_light = '#313131',
  red = '#b66467',
  green = '#8c977d',
  orange = '#d9bc8c',
  blue = '#8da3b9',
  magenta = "#a988b0",
  cyan = '#8ca3af',
  white = '#e8e3e3',
}

local theme = {
  normal = {
    a = { fg = colors.bg, bg = colors.green},
    b = { fg = colors.white,  bg = colors.bg_light},
    c = { fg = colors.white, bg = colors.bg},

    x = { fg = colors.dark_grey, bg = colors.bg},
    y = { fg = colors.green, bg = colors.bg_light},
    z = { fg = colors.bg, bg = colors.green},
  },
  insert = { a = { fg = colors.bg, bg = colors.magenta}, b = { fg = colors.magenta, bg = colors.bg} },
  visual = { a = { fg = colors.bg, bg = colors.cyan}, b = { fg = colors.cyan, bg = colors.bg} },
  replace = { a = { fg = colors.bg, bg = colors.orange}, b = { fg = colors.orange, bg = colors.bg} },
  command = { a = { fg = colors.bg, bg = colors.magenta}, b = { fg = colors.magenta, bg = colors.bg} },
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
  width_percent_below = function (n, thresh)
    local winwidth = vim.api.nvim_win_get_width(0)
    return n / winwidth <= thresh
  end,
}

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local mainIcon = {
  "%",
  icon = " ",
  padding = 1,
  color = { bg = colors.bg, fg = colors.dark_grey},
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
  color = {fg = colors.dark_grey, bg = colors.bg_light},
  padding = 2,
}

local diff = {
  "diff",
  symbols = { added = '洛', modified = '柳', removed = ' ' },
  diff_color = {
    added = { fg = colors.dark_grey},
    modified = { fg = colors.dark_grey },
    removed = { fg = colors.dark_grey },
  },
	colored = true,
  cond = conditions.buffer_not_empty,
  padding = { left = 2, right = 2 },
}

local mode = {
	"mode",
  icon = " ",
  padding = { left = 2, right = 2 },
  color = { gui = "bold"}
}

local filetype = {
	"filetype",
  colored = false,
  icon_only = true,
  padding = { left = 2, right = 0 },
  color = {fg = colors.white, bg = colors.bg_light},
}

local filename = {
	"filename",
  padding = { left = 1, right = 2 },
  color = {fg = colors.white, bg = colors.bg_light},
  icon = icon,
}

local fileDirectory = function()
  local cwd = vim.fn.getcwd(0)
  cwd = vim.fn.fnamemodify(cwd, ":~")
  if not conditions.width_percent_below(#cwd, 0.25) then
      cwd = vim.fn.pathshorten(cwd)
  end
  local trail = cwd:sub(-1) == "/" and "" or "/"
  return cwd .. trail
end

local directory = {
  fileDirectory,
	icon = " ",
  color = {fg = colors.dark_grey, bg = colors.darker_grey},
  padding = 2,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
  padding = { left = 2, right = 2 },
  color = {fg = colors.dark_grey, bg = colors.darker_grey},
}

local progress = function()
	local current_line = vim.fn.line(".")
	local totalLines = vim.fn.line("$")
  if current_line == 1 then
    return 'Top'
  elseif current_line == totalLines then
    return 'Bot'
  else
    return "%p%%"
  end
end

local location = {
	progress,
  icon = "",
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local aerial = {
  "aerial",
  sep = ' > ',
  depth = nil,
  dense = false,
  dense_sep = '.',
  padding = 2,
  color = {fg = colors.dark_grey,  bg = colors.darker_grey2},
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "NvimTree", "Outline", "aerial" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mainIcon, mode },
		lualine_b = { filetype, filename, directory},
		lualine_c = { diff },

		lualine_x = { aerial, branch },
		lualine_y = { diagnostics },
		lualine_z = { location },
	},
	tabline = {},
	extensions = {},
})
