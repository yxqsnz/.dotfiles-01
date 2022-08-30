local fn = vim.fn

local this = {
	install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim",
	installed = false,
}

local Plugins = {}

Global.put("plugin", function(props, config)
	if config then
		props.config = config
	end

	table.insert(Plugins, props)
end)

function this:boostrap()
	if fn.empty(fn.glob(this.install_path)) > 0 then
		print("[ᗜˬᗜ] Installing packer...")

		this.installed = fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			this.install_path,
		})

		if this.installed then
			vim.cmd([[packadd packer.nvim]])
		else
			print("[x] Failed to install packer!")
		end
	end
end

function this:load_plugins_from(path)
	local files = vim.split(fn.globpath(path, "*/*.plug.lua"), "\n")

	for _, file in pairs(files) do
		dofile(file)
	end
end

function this:init()
	local user = require("user.config")

	require("packer").startup({
		function(use)
			use({ "wbthomason/packer.nvim", "lewis6991/impatient.nvim" })

			use({
				user.theme.re,
				as = user.theme.as,
				config = function()
					local user = require("user.config")

					if user.theme.rc then
						require(user.theme.rc)
					end

					vim.cmd("colorscheme " .. user.theme.as)
				end,
			})

			for _, plug in pairs(Plugins) do
				use(plug)
			end

			if this.installed then
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
