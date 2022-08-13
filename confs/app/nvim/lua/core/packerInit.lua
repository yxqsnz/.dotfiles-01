local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local config_path = vim.fn.stdpath("config")
local plugins_dir = config_path .. "/lua/user/plug"

local STATIC_PLUGINS = {}

---@diagnostic disable-next-line: lowercase-global
function with(props, config)
	props.config = config
	table.insert(STATIC_PLUGINS, props)
end

local this = {}

function this:boostrap()
	---@diagnostic disable-next-line: missing-parameter
	if fn.empty(fn.glob(install_path)) > 0 then
		print("@[Core/packerInit]: Boostrapping packer...")
		self.boostrapped = fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		vim.cmd([[redraw]])
	end
end

function this:load()
	local get_plugins_list = function()
		local list = {}
		---@diagnostic disable-next-line: missing-parameter
		local tmp = vim.split(fn.globpath(plugins_dir, "*/*.lua"), "\n")
		for _, f in ipairs(tmp) do
			list[#list + 1] = string.match(f, "lua/(.+).lua$")
		end
		return list
	end

	local plugins_list = get_plugins_list()

	for _, m in ipairs(plugins_list) do
		require(m)
	end
end

function this:setup()
	require("packer").startup({
		function(use)
			use({ "wbthomason/packer.nvim", "lewis6991/impatient.nvim" })
			use({
				_G.user.theme.repo,
				as = _G.user.theme.name,
				config = function()
					_G.user.theme.setup(function(name)
						vim.cmd("colorscheme " .. name)
					end)
				end,
			})

			for _, plug in pairs(STATIC_PLUGINS) do
				use(plug)
			end

			if self.boostrapped then
				require("packer").sync()
			end
		end,
		config = {
			display = {
				open_fn = function()
					return require("packer.util").float({ border = "single" })
				end,
				done_sym = " ",
				working_sym = " ",
				moved_sym = " ",
				error_sym = " ",
				removed_sym = " ",
			},
		},
	})
end

return this
