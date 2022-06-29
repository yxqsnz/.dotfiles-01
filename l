[1mdiff --git a/user/.zshrc b/user/.zshrc[m
[1mindex daa5453..6d8148b 100644[m
[1m--- a/user/.zshrc[m
[1m+++ b/user/.zshrc[m
[36m@@ -35,7 +35,7 @@[m [mexport PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin"[m
 export PATH="/home/yxqsnz/.deno/bin:$PATH"[m
 export PATH="$PATH:/home/gk/Documents/Scripts/Bin"[m
 # }}[m
[31m-# History (From OMZ) {{[m
[32m+[m[32m#History (From OMZ) {{[m
 ## History wrapper[m
 function omz_history {[m
   local clear list[m
[36m@@ -100,7 +100,6 @@[m [malias cat='bat -p --theme=ansi'[m
 _TH=$(command -v thefuck)[m
 [[ -z $_TH ]] && export _TH=":"[m
 eval $($_TH --alias)[m
[31m-GRC_ALIASES=true[m
 [[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh[m
 # }}[m
 # Prompt {{[m
[36m@@ -131,6 +130,7 @@[m [mbindkey  "^[[3~"  delete-char[m
 # Misc {{[m
 source /opt/asdf-vm/asdf.sh[m
 export PATH="$(yarn global bin):$PATH"[m
[32m+[m[32mexport PATH="$(go env GOPATH)/bin:$PATH"[m
 # }}[m
 # vim: foldmarker={{,}}[m
 # vim: foldmethod=marker[m
[1mdiff --git a/user/awesome/keybinds.lua b/user/awesome/keybinds.lua[m
[1mindex d88df36..abf65fd 100644[m
[1m--- a/user/awesome/keybinds.lua[m
[1m+++ b/user/awesome/keybinds.lua[m
[36m@@ -248,6 +248,7 @@[m [mawful.keyboard.append_global_keybindings({[m
   end, { description = "select previous", group = "layout" }),[m
 })[m
 -- }}[m
[32m+[m
 -- {{ Default keybinds[m
 client.connect_signal("request::default_keybindings", function()[m
   awful.keyboard.append_client_keybindings({[m
[36m@@ -326,3 +327,15 @@[m [mawful.keyboard.append_global_keybindings({[m
   }),[m
 })[m
 -- }}[m
[32m+[m[32m-- {{ Backlight[m
[32m+[m[32mawful.keyboard.append_global_keybindings({[m
[32m+[m[32m  awful.key({}, "XF86MonBrightnessUp", command("xbacklight -inc 5"), {[m
[32m+[m[32m    description = "Increase Backlight",[m
[32m+[m[32m    group = "backlight",[m
[32m+[m[32m  }),[m
[32m+[m[32m  awful.key({}, "XF86MonBrightnessDown", command("xbacklight -dec 5"), {[m
[32m+[m[32m    description = "Decrease Backlight",[m
[32m+[m[32m    group = "backlight",[m
[32m+[m[32m  }),[m
[32m+[m[32m})[m
[32m+[m[32m-- }}[m
[1mdiff --git a/user/cargo/config.toml b/user/cargo/config.toml[m
[1mindex e423d9e..8f22f43 100644[m
[1m--- a/user/cargo/config.toml[m
[1m+++ b/user/cargo/config.toml[m
[36m@@ -1,10 +1,12 @@[m
 [build][m
[31m-rustc-wrapper = "sccache"[m
[32m+[m[32mrustc-wrapper = "cachepot"[m
 [target.x86_64-unknown-linux-gnu][m
 rustflags = [[m
[31m-    "-C", "link-arg=-fuse-ld=/usr/bin/mold",[m
[31m-    "-C", "link-arg=-Xlinker --threads=4"[m
[32m+[m[32m    "-C", "link-arg=-fuse-ld=lld",[m
[32m+[m[32m    "-C", "link-arg=-Xlinker --threads=8"[m
 ][m
 linker = "clang"[m
 [m
[32m+[m[32m[profile.dev][m
[32m+[m[32mdebug = false[m
 [m
[1mdiff --git a/user/lunarvim/config.lua b/user/lunarvim/config.lua[m
[1mindex e9c537d..69ca5bf 100644[m
[1m--- a/user/lunarvim/config.lua[m
[1m+++ b/user/lunarvim/config.lua[m
[36m@@ -97,6 +97,11 @@[m [mlocal formatters = require("lvim.lsp.null-ls.formatters")[m
 formatters.setup({[m
 	{ command = "black" },[m
 	{ command = "stylua" },[m
[32m+[m	[32m{ command = "gofmt" },[m
[32m+[m	[32m{ command = "goimports" },[m
[32m+[m	[32m{ command = "gofumpt" },[m
[32m+[m	[32m{ command = "golines" },[m
[32m+[m	[32m{ command = "rustfmt" },[m
 	{[m
 		command = "clang-format",[m
 		filetype = { "c", "cpp", "cs", "java" },[m
[36m@@ -118,6 +123,7 @@[m [mformatters.setup({[m
 local linters = require("lvim.lsp.null-ls.linters")[m
 linters.setup({[m
 	{ command = "flake8", filetypes = { "python" } },[m
[32m+[m	[32m{ command = "editorconfig_checker" },[m
 	{[m
 		-- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration[m
 		command = "shellcheck",[m
[36m@@ -132,10 +138,57 @@[m [mlinters.setup({[m
 	},[m
 })[m
 [m
[32m+[m[32mvim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })[m
 lvim.plugins = {[m
 	{ "folke/tokyonight.nvim" },[m
 	{ "nonamescm/notheme.nvim" },[m
 	{ "j-hui/fidget.nvim" },[m
[32m+[m	[32m{ "editorconfig/editorconfig-vim" },[m
[32m+[m	[32m{[m
[32m+[m		[32m"nvim-treesitter/nvim-treesitter-textobjects",[m
[32m+[m		[32mconfig = function()[m
[32m+[m			[32mrequire("nvim-treesitter.configs").setup({[m
[32m+[m				[32mtextobjects = {[m
[32m+[m					[32mselect = {[m
[32m+[m						[32menable = true,[m
[32m+[m
[32m+[m						[32m-- Automatically jump forward to textobj, similar to targets.vim[m
[32m+[m						[32mlookahead = true,[m
[32m+[m
[32m+[m						[32mkeymaps = {[m
[32m+[m							[32m-- You can use the capture groups defined in textobjects.scm[m
[32m+[m							[32m["af"] = "@function.outer",[m
[32m+[m							[32m["if"] = "@function.inner",[m
[32m+[m							[32m["ac"] = "@class.outer",[m
[32m+[m							[32m["ic"] = "@class.inner",[m
[32m+[m						[32m},[m
[32m+[m					[32m},[m
[32m+[m				[32m},[m
[32m+[m			[32m})[m
[32m+[m		[32mend,[m
[32m+[m	[32m},[m
[32m+[m	[32m{[m
[32m+[m		[32m"simrat39/rust-tools.nvim",[m
[32m+[m		[32mconfig = function()[m
[32m+[m			[32mlocal lsp_installer_servers = require("nvim-lsp-installer.servers")[m
[32m+[m			[32mlocal _, requested_server = lsp_installer_servers.get_server("rust_analyzer")[m
[32m+[m			[32mrequire("rust-tools").setup({[m
[32m+[m				[32mtools = {[m
[32m+[m					[32mautoSetHints = true,[m
[32m+[m					[32mhover_with_actions = true,[m
[32m+[m					[32mrunnables = {[m
[32m+[m						[32muse_telescope = true,[m
[32m+[m					[32m},[m
[32m+[m				[32m},[m
[32m+[m				[32mserver = {[m
[32m+[m					[32mcmd_env = requested_server._default_options.cmd_env,[m
[32m+[m					[32mon_attach = require("lvim.lsp").common_on_attach,[m
[32m+[m					[32mon_init = require("lvim.lsp").common_on_init,[m
[32m+[m				[32m},[m
[32m+[m			[32m})[m
[32m+[m		[32mend,[m
[32m+[m		[32mft = { "rust", "rs" },[m
[32m+[m	[32m},[m
 	{[m
 		"windwp/nvim-spectre",[m
 		event = "BufRead",[m
[36m@@ -213,6 +266,7 @@[m [mlvim.plugins = {[m
 		end,[m
 	},[m
 	{ "elkowar/yuck.vim" },[m
[32m+[m
 	{[m
 		"romgrk/nvim-treesitter-context",[m
 		config = function()[m
[1mdiff --git a/user/lunarvim/plugin/packer_compiled.lua b/user/lunarvim/plugin/packer_compiled.lua[m
[1mindex 3c91250..7c420de 100644[m
[1m--- a/user/lunarvim/plugin/packer_compiled.lua[m
[1m+++ b/user/lunarvim/plugin/packer_compiled.lua[m
[36m@@ -103,6 +103,11 @@[m [m_G.packer_plugins = {[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/opt/bufferline.nvim",[m
     url = "https://github.com/akinsho/bufferline.nvim"[m
   },[m
[32m+[m[32m  catppuccin = {[m
[32m+[m[32m    loaded = true,[m
[32m+[m[32m    path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/catppuccin",[m
[32m+[m[32m    url = "https://github.com/catppuccin/nvim"[m
[32m+[m[32m  },[m
   ["cmp-buffer"] = {[m
     loaded = true,[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/cmp-buffer",[m
[36m@@ -141,6 +146,11 @@[m [m_G.packer_plugins = {[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/opt/copilot.lua",[m
     url = "https://github.com/zbirenbaum/copilot.lua"[m
   },[m
[32m+[m[32m  ["editorconfig-vim"] = {[m
[32m+[m[32m    loaded = true,[m
[32m+[m[32m    path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/editorconfig-vim",[m
[32m+[m[32m    url = "https://github.com/editorconfig/editorconfig-vim"[m
[32m+[m[32m  },[m
   ["fidget.nvim"] = {[m
     loaded = true,[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/fidget.nvim",[m
[36m@@ -173,6 +183,13 @@[m [m_G.packer_plugins = {[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/opt/indent-blankline.nvim",[m
     url = "https://github.com/lukas-reineke/indent-blankline.nvim"[m
   },[m
[32m+[m[32m  ["lsp-colors.nvim"] = {[m
[32m+[m[32m    loaded = false,[m
[32m+[m[32m    needs_bufread = false,[m
[32m+[m[32m    only_cond = false,[m
[32m+[m[32m    path = "/home/gk/.local/share/lunarvim/site/pack/packer/opt/lsp-colors.nvim",[m
[32m+[m[32m    url = "https://github.com/folke/lsp-colors.nvim"[m
[32m+[m[32m  },[m
   ["lua-dev.nvim"] = {[m
     loaded = false,[m
     needs_bufread = false,[m
[36m@@ -191,6 +208,11 @@[m [m_G.packer_plugins = {[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/nlsp-settings.nvim",[m
     url = "https://github.com/tamago324/nlsp-settings.nvim"[m
   },[m
[32m+[m[32m  ["notheme.nvim"] = {[m
[32m+[m[32m    loaded = true,[m
[32m+[m[32m    path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/notheme.nvim",[m
[32m+[m[32m    url = "https://github.com/nonamescm/notheme.nvim"[m
[32m+[m[32m  },[m
   ["null-ls.nvim"] = {[m
     loaded = true,[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim",[m
[36m@@ -207,6 +229,12 @@[m [m_G.packer_plugins = {[m
     loaded = true,[m
     only_config = true[m
   },[m
[32m+[m[32m  ["nvim-colorizer.lua"] = {[m
[32m+[m[32m    config = { "\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\a\rRRGGBBAA\2\vRRGGBB\2\bRGB\2\bcss\2\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },[m
[32m+[m[32m    loaded = true,[m
[32m+[m[32m    path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/nvim-colorizer.lua",[m
[32m+[m[32m    url = "https://github.com/norcalli/nvim-colorizer.lua"[m
[32m+[m[32m  },[m
   ["nvim-lsp-installer"] = {[m
     loaded = true,[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/nvim-lsp-installer",[m
[36m@@ -243,6 +271,26 @@[m [m_G.packer_plugins = {[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter",[m
     url = "https://github.com/nvim-treesitter/nvim-treesitter"[m
   },[m
[32m+[m[32m  ["nvim-treesitter-context"] = {[m
[32m+[m[32m    config = { "\27LJ\2\n£\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\fdefault\1\0\0\1\4\0\0\nclass\rfunction\vmethod\1\0\3\venable\2\14max_lines\3\0\rthrottle\2\nsetup\23treesitter-context\frequire\0" },[m
[32m+[m[32m    loaded = true,[m
[32m+[m[32m    path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter-context",[m
[32m+[m[32m    url = "https://github.com/romgrk/nvim-treesitter-context"[m
[32m+[m[32m  },[m
[32m+[m[32m  ["nvim-treesitter-textobjects"] = {[m
[32m+[m[32m    config = { "\27LJ\2\ná\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\16textobjects\1\0\0\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aic\17@class.inner\aaf\20@function.outer\aac\17@class.outer\1\0\2\venable\2\14lookahead\2\nsetup\28nvim-treesitter.configs\frequire\0" },[m
[32m+[m[32m    loaded = true,[m
[32m+[m[32m    path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter-textobjects",[m
[32m+[m[32m    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"[m
[32m+[m[32m  },[m
[32m+[m[32m  ["nvim-ts-autotag"] = {[m
[32m+[m[32m    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },[m
[32m+[m[32m    loaded = false,[m
[32m+[m[32m    needs_bufread = false,[m
[32m+[m[32m    only_cond = false,[m
[32m+[m[32m    path = "/home/gk/.local/share/lunarvim/site/pack/packer/opt/nvim-ts-autotag",[m
[32m+[m[32m    url = "https://github.com/windwp/nvim-ts-autotag"[m
[32m+[m[32m  },[m
   ["nvim-ts-context-commentstring"] = {[m
     loaded = false,[m
     needs_bufread = false,[m
[36m@@ -255,17 +303,19 @@[m [m_G.packer_plugins = {[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/nvim-web-devicons",[m
     url = "https://github.com/kyazdani42/nvim-web-devicons"[m
   },[m
[31m-  ["onedarker.nvim"] = {[m
[31m-    config = { "\27LJ\2\nš\1\0\0\3\0\t\0\0196\0\0\0\15\0\0\0X\1\15€6\0\0\0009\0\1\0\a\0\2\0X\0\v€6\0\3\0'\2\2\0B\0\2\0029\0\4\0B\0\1\0016\0\0\0009\0\5\0009\0\6\0009\0\a\0'\1\2\0=\1\b\0K\0\1\0\ntheme\foptions\flualine\fbuiltin\nsetup\frequire\14onedarker\16colorscheme\tlvim\30\1\0\3\0\2\0\0046\0\0\0003\2\1\0B\0\2\1K\0\1\0\0\npcall\0" },[m
[31m-    loaded = true,[m
[31m-    path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/onedarker.nvim",[m
[31m-    url = "https://github.com/lunarvim/onedarker.nvim"[m
[31m-  },[m
   ["packer.nvim"] = {[m
     loaded = true,[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/packer.nvim",[m
     url = "https://github.com/wbthomason/packer.nvim"[m
   },[m
[32m+[m[32m  ["persistence.nvim"] = {[m
[32m+[m[32m    config = { "\27LJ\2\n¸\1\0\0\6\0\f\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0006\3\3\0009\3\4\0039\3\5\3'\5\6\0B\3\2\2'\4\a\0&\3\4\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\foptions\1\5\0\0\fbuffers\vcurdir\rtabpages\fwinsize\bdir\1\0\0\14/session/\vconfig\fstdpath\afn\bvim\nsetup\16persistence\frequire\0" },[m
[32m+[m[32m    loaded = false,[m
[32m+[m[32m    needs_bufread = false,[m
[32m+[m[32m    only_cond = false,[m
[32m+[m[32m    path = "/home/gk/.local/share/lunarvim/site/pack/packer/opt/persistence.nvim",[m
[32m+[m[32m    url = "https://github.com/folke/persistence.nvim"[m
[32m+[m[32m  },[m
   ["plenary.nvim"] = {[m
     loaded = true,[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/plenary.nvim",[m
[36m@@ -282,6 +332,14 @@[m [m_G.packer_plugins = {[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/project.nvim",[m
     url = "https://github.com/ahmedkhalf/project.nvim"[m
   },[m
[32m+[m[32m  ["rust-tools.nvim"] = {[m
[32m+[m[32m    config = { "\27LJ\2\nü\2\0\0\n\0\20\0 6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0036\3\0\0'\5\4\0B\3\2\0029\3\5\0035\5\t\0005\6\6\0005\a\a\0=\a\b\6=\6\n\0055\6\r\0009\a\v\0029\a\f\a=\a\f\0066\a\0\0'\t\14\0B\a\2\0029\a\15\a=\a\16\0066\a\0\0'\t\14\0B\a\2\0029\a\17\a=\a\18\6=\6\19\5B\3\2\1K\0\1\0\vserver\fon_init\19common_on_init\14on_attach\21common_on_attach\rlvim.lsp\1\0\0\fcmd_env\21_default_options\ntools\1\0\0\14runnables\1\0\1\18use_telescope\2\1\0\2\23hover_with_actions\2\17autoSetHints\2\nsetup\15rust-tools\18rust_analyzer\15get_server\31nvim-lsp-installer.servers\frequire\0" },[m
[32m+[m[32m    loaded = false,[m
[32m+[m[32m    needs_bufread = true,[m
[32m+[m[32m    only_cond = false,[m
[32m+[m[32m    path = "/home/gk/.local/share/lunarvim/site/pack/packer/opt/rust-tools.nvim",[m
[32m+[m[32m    url = "https://github.com/simrat39/rust-tools.nvim"[m
[32m+[m[32m  },[m
   ["schemastore.nvim"] = {[m
     loaded = true,[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/schemastore.nvim",[m
[36m@@ -303,6 +361,14 @@[m [m_G.packer_plugins = {[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/telescope.nvim",[m
     url = "https://github.com/nvim-telescope/telescope.nvim"[m
   },[m
[32m+[m[32m  ["todo-comments.nvim"] = {[m
[32m+[m[32m    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },[m
[32m+[m[32m    loaded = false,[m
[32m+[m[32m    needs_bufread = false,[m
[32m+[m[32m    only_cond = false,[m
[32m+[m[32m    path = "/home/gk/.local/share/lunarvim/site/pack/packer/opt/todo-comments.nvim",[m
[32m+[m[32m    url = "https://github.com/folke/todo-comments.nvim"[m
[32m+[m[32m  },[m
   ["toggleterm.nvim"] = {[m
     config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.terminal\frequire\0" },[m
     loaded = false,[m
[36m@@ -331,12 +397,18 @@[m [m_G.packer_plugins = {[m
     only_cond = false,[m
     path = "/home/gk/.local/share/lunarvim/site/pack/packer/opt/which-key.nvim",[m
     url = "https://github.com/max397574/which-key.nvim"[m
[32m+[m[32m  },[m
[32m+[m[32m  ["yuck.vim"] = {[m
[32m+[m[32m    loaded = true,[m
[32m+[m[32m    path = "/home/gk/.local/share/lunarvim/site/pack/packer/start/yuck.vim",[m
[32m+[m[32m    url = "https://github.com/elkowar/yuck.vim"[m
   }[m
 }[m
 [m
 time([[Defining packer_plugins]], false)[m
 local module_lazy_loads = {[m
[31m-  ["^lua%-dev"] = "lua-dev.nvim"[m
[32m+[m[32m  ["^lua%-dev"] = "lua-dev.nvim",[m
[32m+[m[32m  ["^persistence"] = "persistence.nvim"[m
 }[m
 local lazy_load_called = {['packer.load'] = true}[m
 local function lazy_load_module(module_name)[m
[36m@@ -367,46 +439,54 @@[m [mend[m
 time([[Setup for indent-blankline.nvim]], true)[m
 try_loadstring("\27LJ\2\nã\2\0\0\2\0\v\0\0256\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0005\1\b\0=\1\a\0006\0\0\0009\0\1\0+\1\1\0=\1\t\0006\0\0\0009\0\1\0+\1\1\0=\1\n\0K\0\1\0-indent_blankline_show_first_indent_level4indent_blankline_show_trailing_blankline_indent\1\2\0\0\rterminal%indent_blankline_buftype_exclude\1\4\0\0\thelp\rterminal\14dashboard&indent_blankline_filetype_exclude\bâ–\26indent_blankline_char\23indentLine_enabled\6g\bvim\0", "setup", "indent-blankline.nvim")[m
 time([[Setup for indent-blankline.nvim]], false)[m
[31m--- Config for: lualine.nvim[m
[31m-time([[Config for lualine.nvim]], true)[m
[31m-try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.lualine\frequire\0", "config", "lualine.nvim")[m
[31m-time([[Config for lualine.nvim]], false)[m
[31m--- Config for: telescope.nvim[m
[31m-time([[Config for telescope.nvim]], true)[m
[31m-try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.telescope\frequire\0", "config", "telescope.nvim")[m
[31m-time([[Config for telescope.nvim]], false)[m
[32m+[m[32m-- Config for: nvim-treesitter[m
[32m+[m[32mtime([[Config for nvim-treesitter]], true)[m
[32m+[m[32mtry_loadstring("\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.treesitter\frequire\0", "config", "nvim-treesitter")[m
[32m+[m[32mtime([[Config for nvim-treesitter]], false)[m
[32m+[m[32m-- Config for: nvim-cmp[m
[32m+[m[32mtime([[Config for nvim-cmp]], true)[m
[32m+[m[32mtry_loadstring("\27LJ\2\n`\0\0\3\0\6\0\v6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\5€6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\18lvim.core.cmp\frequire\bcmp\fbuiltin\tlvim\0", "config", "nvim-cmp")[m
[32m+[m[32mtime([[Config for nvim-cmp]], false)[m
 -- Config for: nvim-notify[m
 time([[Config for nvim-notify]], true)[m
 try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21lvim.core.notify\frequire\0", "config", "nvim-notify")[m
 time([[Config for nvim-notify]], false)[m
[31m--- Config for: nvim-autopairs[m
[31m-time([[Config for nvim-autopairs]], true)[m
[31m-try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.autopairs\frequire\0", "config", "nvim-autopairs")[m
[31m-time([[Config for nvim-autopairs]], false)[m
[31m--- Config for: alpha-nvim[m
[31m-time([[Config for alpha-nvim]], true)[m
[31m-try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.alpha\frequire\0", "config", "alpha-nvim")[m
[31m-time([[Config for alpha-nvim]], false)[m
 -- Config for: project.nvim[m
 time([[Config for project.nvim]], true)[m
 try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.project\frequire\0", "config", "project.nvim")[m
 time([[Config for project.nvim]], false)[m
[31m--- Config for: nvim-cmp[m
[31m-time([[Config for nvim-cmp]], true)[m
[31m-try_loadstring("\27LJ\2\n`\0\0\3\0\6\0\v6\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\5€6\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\nsetup\18lvim.core.cmp\frequire\bcmp\fbuiltin\tlvim\0", "config", "nvim-cmp")[m
[31m-time([[Config for nvim-cmp]], false)[m
 -- Config for: LuaSnip[m
 time([[Config for LuaSnip]], true)[m
 try_loadstring("\27LJ\2\nñ\3\0\0\v\0\23\00166\0\0\0'\2\1\0B\0\2\0024\1\0\0006\2\2\0009\2\3\0029\2\4\0029\2\5\0029\2\6\2\15\0\2\0X\3\f€\21\2\1\0\22\2\0\0029\3\a\0006\5\b\0B\5\1\2'\6\t\0'\a\n\0'\b\v\0'\t\f\0'\n\r\0B\3\a\2<\3\2\0019\2\a\0006\4\14\0B\4\1\2'\5\15\0B\2\3\0029\3\16\0\18\5\2\0B\3\2\2\15\0\3\0X\4\3€\21\3\1\0\22\3\0\3<\2\3\0016\3\0\0'\5\17\0B\3\2\0029\3\18\3B\3\1\0016\3\0\0'\5\19\0B\3\2\0029\3\18\0035\5\20\0=\1\21\5B\3\2\0016\3\0\0'\5\22\0B\3\2\0029\3\18\3B\3\1\1K\0\1\0\"luasnip.loaders.from_snipmate\npaths\1\0\0 luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\17is_directory\rsnippets\19get_config_dir\22friendly-snippets\nstart\vpacker\tpack\tsite\20get_runtime_dir\15join_paths\22friendly_snippets\fsources\fluasnip\fbuiltin\tlvim\15lvim.utils\frequire\2\0", "config", "LuaSnip")[m
 time([[Config for LuaSnip]], false)[m
[31m--- Config for: nvim-treesitter[m
[31m-time([[Config for nvim-treesitter]], true)[m
[31m-try_loadstring("\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\25lvim.core.treesitter\frequire\0", "config", "nvim-treesitter")[m
[31m-time([[Config for nvim-treesitter]], false)[m
[31m--- Config for: onedarker.nvim[m
[31m-time([[Config for onedarker.nvim]], true)[m
[31m-try_loadstring("\27LJ\2\nš\1\0\0\3\0\t\0\0196\0\0\0\15\0\0\0X\1\15€6\0\0\0009\0\1\0\a\0\2\0X\0\v€6\0\3\0'\2\2\0B\0\2\0029\0\4\0B\0\1\0016\0\0\0009\0\5\0009\0\6\0009\0\a\0'\1\2\0=\1\b\0K\0\1\0\ntheme\foptions\flualine\fbuiltin\nsetup\frequire\14onedarker\16colorscheme\tlvim\30\1\0\3\0\2\0\0046\0\0\0003\2\1\0B\0\2\1K\0\1\0\0\npcall\0", "config", "onedarker.nvim")[m
[31m-time([[Config for onedarker.nvim]], false)[m
[32m+[m[32m-- Config for: telescope.nvim[m
[32m+[m[32mtime([[Config for telescope.nvim]], true)[m
[32m+[m[32mtry_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.telescope\frequire\0", "config", "telescope.nvim")[m
[32m+[m[32mtime([[Config for telescope.nvim]], false)[m
[32m+[m[32m-- Config for: nvim-treesitter-context[m
[32m+[m[32mtime([[Config for nvim-treesitter-context]], true)[m
[32m+[m[32mtry_loadstring("\27LJ\2\n£\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\fdefault\1\0\0\1\4\0\0\nclass\rfunction\vmethod\1\0\3\venable\2\14max_lines\3\0\rthrottle\2\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")[m
[32m+[m[32mtime([[Config for nvim-treesitter-context]], false)[m
[32m+[m[32m-- Config for: nvim-autopairs[m
[32m+[m[32mtime([[Config for nvim-autopairs]], true)[m
[32m+[m[32mtry_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24lvim.core.autopairs\frequire\0", "config", "nvim-autopairs")[m
[32m+[m[32mtime([[Config for nvim-autopairs]], false)[m
[32m+[m[32m-- Config for: nvim-treesitter-textobjects[m
[32m+[m[32mtime([[Config for nvim-treesitter-textobjects]], true)[m
[32m+[m[32mtry_loadstring("\27LJ\2\ná\1\0\0\6\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\6\0005\4\3\0005\5\4\0=\5\5\4=\4\a\3=\3\t\2B\0\2\1K\0\1\0\16textobjects\1\0\0\vselect\1\0\0\fkeymaps\1\0\4\aif\20@function.inner\aic\17@class.inner\aaf\20@function.outer\aac\17@class.outer\1\0\2\venable\2\14lookahead\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")[m
[32m+[m[32mtime([[Config for nvim-treesitter-textobjects]], false)[m
[32m+[m[32m-- Config for: nvim-colorizer.lua[m
[32m+[m[32mtime([[Config for nvim-colorizer.lua]], true)[m
[32m+[m[32mtry_loadstring("\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\a\rRRGGBBAA\2\vRRGGBB\2\bRGB\2\bcss\2\vcss_fn\2\vhsl_fn\2\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")[m
[32m+[m[32mtime([[Config for nvim-colorizer.lua]], false)[m
[32m+[m[32m-- Config for: alpha-nvim[m
[32m+[m[32mtime([[Config for alpha-nvim]], true)[m
[32m+[m[32mtry_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20lvim.core.alpha\frequire\0", "config", "alpha-nvim")[m
[32m+[m[32mtime([[Config for alpha-nvim]], false)[m
[32m+[m[32m-- Config for: lualine.nvim[m
[32m+[m[32mtime([[Config for lualine.nvim]], true)[m
[32m+[m[32mtry_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22lvim.core.lualine\frequire\0", "config", "lualine.nvim")[m
[32m+[m[32mtime([[Config for lualine.nvim]], false)[m
 -- Config for: nvim-tree.lua[m
 time([[Config for nvim-tree.lua]], true)[m
 try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23lvim.core.nvimtree\frequire\0", "config", "nvim-tree.lua")[m
[36m@@ -421,12 +501,16 @@[m [mvim.cmd [[augroup packer_load_aucmds]][m
 vim.cmd [[au!]][m
   -- Filetype lazy-loads[m
 time([[Defining lazy-load filetype autocommands]], true)[m
[32m+[m[32mvim.cmd [[au FileType rust ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rust" }, _G.packer_plugins)]][m
 vim.cmd [[au FileType markdown ++once lua require("packer.load")({'glow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]][m
[32m+[m[32mvim.cmd [[au FileType rs ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rs" }, _G.packer_plugins)]][m
 time([[Defining lazy-load filetype autocommands]], false)[m
   -- Event lazy-loads[m
 time([[Defining lazy-load event autocommands]], true)[m
[31m-vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'which-key.nvim', 'bufferline.nvim', 'toggleterm.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]][m
[31m-vim.cmd [[au BufRead * ++once lua require("packer.load")({'Comment.nvim', 'nvim-spectre', 'gitsigns.nvim', 'indent-blankline.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]][m
[32m+[m[32mvim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-ts-autotag'}, { event = "InsertEnter *" }, _G.packer_plugins)]][m
[32m+[m[32mvim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'which-key.nvim', 'toggleterm.nvim', 'bufferline.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]][m
[32m+[m[32mvim.cmd [[au BufRead * ++once lua require("packer.load")({'indent-blankline.nvim', 'todo-comments.nvim', 'gitsigns.nvim', 'lsp-colors.nvim', 'nvim-spectre', 'Comment.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]][m
[32m+[m[32mvim.cmd [[au BufReadPre * ++once lua require("packer.load")({'persistence.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]][m
 vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'nvim-ts-context-commentstring'}, { event = "BufReadPost *" }, _G.packer_plugins)]][m
 vim.cmd [[au VimEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "VimEnter *" }, _G.packer_plugins)]][m
 time([[Defining lazy-load event autocommands]], false)[m
