#!/usr/bin/env lua
local action = arg[1]
local colors = require('sources.utils.colors')
local path   = require('sources.utils.path')

require('sources.utils.console')
require('sources.utils.table')
local ask     = arg[2] == '--ask'
local configs = {
   neovim = { "nvim", "~/.config/nvim" };
   alacritty = { "alacritty", "~/.config/alacritty" };
   zsh_rc = { "zsh/rc.zsh", "~/.zshrc" };
   p10k   = { "zsh/p10k.zsh", "~/.p10k.zsh" };
   tmux = { "tmux", "~/.tmux" };
}

INFO("Welcome to the dotfile configuration script!")
INFO("This script has config for: " .. table.keys_to_string(configs))

local function install()
   for name, config in pairs(configs) do
      local to = config[2]
      local from = config[1]
      if not ask or QUESTION(string.format("Install %s config?", name)) then
         INFO(string.format("Installing %s to %s", name, to))
         local cmd = string.format("ln -fvns $(realpath config/%s) %s", from, to)
         INFO(string.format("Run: %s", cmd))
         io.write(BLOCK .. ' ' .. colors.cyan)
         io.flush()
         local _, _kind, code =  os.execute(cmd)
         if code ~= 0 then
            ERROR(string.format("Failed to install %s config", name))
         end
      else
         INFO(string.format("Skipping %s config", name))
      end
   end
end

local function copy()
end

if action == "install" then
   install()
elseif action == "copy" then
   copy()
else
   print([[
   ./update.lua <ACTION>
		copy # Copy files to dotfiles repository
		install # Install dotfiles
   ]])
end
