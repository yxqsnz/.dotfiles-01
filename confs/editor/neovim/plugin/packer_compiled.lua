-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/yxqsnz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/yxqsnz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/yxqsnz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/yxqsnz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/yxqsnz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip",
    wants = { "nvim-cmp" }
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n}\0\0\6\1\5\0\0166\0\0\0009\0\1\0009\0\2\0-\2\0\0+\3\2\0+\4\1\0+\5\2\0B\0\5\0026\1\0\0009\1\1\0019\1\3\1\18\3\0\0'\4\4\0+\5\1\0B\1\4\1K\0\1\0\3�\vnormal\18nvim_feedkeys\27nvim_replace_termcodes\bapi\bvim�\2\1\3\b\0\16\0\28\18\5\0\0009\3\0\0'\6\1\0'\a\2\0B\3\4\2\18\5\3\0009\3\0\3'\6\3\0'\a\4\0B\3\4\0025\4\5\0=\1\6\4=\0\a\4\15\0\2\0X\5\6�5\5\t\0>\3\2\5>\2\3\0055\6\n\0>\6\4\5=\5\b\0045\5\v\0=\1\f\0053\6\r\0=\6\14\5=\4\15\0052\0\0�L\5\2\0\topts\ron_press\0\bval\1\0\1\ttype\vbutton\1\0\2\fnoremap\2\vsilent\2\1\2\0\0\6n\vkeymap\rshortcut\ttext\1\0\5\19align_shortcut\nright\rposition\vcenter\ahl\17AlphaButtons\nwidth\3$\vcursor\3\5\r<leader>\bSPC\5\a%s\tgsub�\f\1\0\n\0!\1?6\0\0\0'\2\1\0B\0\2\0023\1\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0004\4\6\0\18\5\1\0'\a\v\0'\b\f\0'\t\r\0B\5\4\2>\5\1\4\18\5\1\0'\a\14\0'\b\15\0'\t\16\0B\5\4\2>\5\2\4\18\5\1\0'\a\17\0'\b\18\0'\t\19\0B\5\4\2>\5\3\4\18\5\1\0'\a\20\0'\b\21\0'\t\22\0B\5\4\2>\5\4\4\18\5\1\0'\a\23\0'\b\24\0'\t\25\0B\5\4\0?\5\0\0=\4\5\0035\4\26\0=\4\a\3=\3\27\0029\3\28\0005\5\31\0004\6\5\0005\a\29\0>\a\1\0069\a\t\2>\a\2\0065\a\30\0>\a\3\0069\a\27\2>\a\4\6=\6 \0054\6\0\0=\6\a\5B\3\2\1K\0\1\0\vlayout\1\0\0\1\0\2\ttype\fpadding\bval\3\2\1\0\2\ttype\fpadding\bval\3\2\nsetup\fbuttons\1\0\1\fspacing\3\1;:e ~/.config/nvim/lua/user/config.lua | :cd %:p:h <CR>\18  Settings\fSPC e s\25:Telescope marks<CR>\21  Bookmarks  \fSPC b m\29:Telescope live_grep<CR>\21  Find Word  \fSPC f w\28:Telescope oldfiles<CR>\23  Recent File  \fSPC f o\30:Telescope find_files<CR>\21  Find File  \fSPC f f\1\0\1\ttype\ngroup\vheader\1\0\0\topts\1\0\2\rposition\vcenter\ahl\16AlphaHeader\bval\1\f\0\0J   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          X    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       F          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     N           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    L          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ^   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  X  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   b ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  \\ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ P      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     V       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     \1\0\1\ttype\ttext\0\nalpha\frequire\v����\4\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\0196\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\1\15\0\1\0X\2\4�6\1\0\0009\3\2\0009\3\3\3B\1\2\0016\1\4\0009\1\5\1'\3\6\0009\4\2\0009\4\a\4&\3\4\3B\1\2\1K\0\1\0\aas\17colorscheme \bcmd\bvim\arc\ntheme\16user.config\frequire\0" },
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["clangd_extensions.nvim"] = {
    config = { "\27LJ\2\n�\6\0\0\a\0\24\0\0306\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\5\0006\4\0\0'\6\3\0B\4\2\0029\4\4\4=\4\4\3=\3\a\0025\3\b\0005\4\t\0=\4\n\0035\4\f\0005\5\v\0=\5\r\0045\5\14\0=\5\15\0045\5\16\0=\5\17\4=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\23\2B\0\2\1K\0\1\0\15extensions\16symbol_info\1\0\1\vborder\tnone\17memory_usage\1\0\1\vborder\tnone\bast\15highlights\1\0\1\vdetail\fComment\15kind_icons\1\0\a\21TemplateTypeParm\b\rRecovery\b\25TemplateTemplateParm\b\rCompound\b\24TemplateParamObject\b\18PackExpansion\b\20TranslationUnit\b\15role_icons\1\0\0\1\0\6\14statement\b\ttype\b\14specifier\b\22template argument\b\15expression\b\16declaration\b\16inlay_hints\1\0\v\14highlight\fComment\rpriority\3d\24right_align_padding\3\a\16right_align\1\26max_len_align_padding\3\1\18max_len_align\1\23other_hints_prefix\5\27parameter_hints_prefix\5\25show_parameter_hints\2\30only_current_line_autocmd\15CursorHold\22only_current_line\1\1\0\1\17autoSetHints\2\vserver\1\0\0\1\0\0\14on_attach\28plug.editor.lsp.handler\nsetup\22clangd_extensions\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/clangd_extensions.nvim",
    url = "https://github.com/p00f/clangd_extensions.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer",
    wants = { "nvim-cmp" }
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline",
    wants = { "nvim-cmp" }
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp",
    wants = { "nvim-cmp" }
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path",
    wants = { "nvim-cmp" }
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip",
    wants = { "nvim-cmp" }
  },
  ["crates.nvim"] = {
    after_files = { "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/crates.nvim/after/plugin/cmp_crates.lua" },
    config = { "\27LJ\2\n�\1\0\0\6\0\b\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\1\2\0009\1\4\0015\3\6\0004\4\3\0005\5\5\0>\5\1\4=\4\a\3B\1\2\1K\0\1\0\fsources\1\0\0\1\0\1\tname\vcrates\vbuffer\bcmp\nsetup\vcrates\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  firenvim = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets",
    wants = { "nvim-cmp" }
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\21indent_blankline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    commands = { "Lspsaga" },
    config = { "\27LJ\2\nA\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\6\0\0\6\0&\0;6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\15\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0004\5\0\0=\5\t\0044\5\0\0=\5\n\4=\4\v\0034\4\0\0=\4\f\0035\4\r\0=\4\14\3=\3\16\0025\3\18\0005\4\17\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\0035\4\24\0=\4\25\0035\4\26\0=\4\27\0035\4\28\0=\4\29\3=\3\30\0025\3\31\0004\4\0\0=\4\19\0034\4\0\0=\4\21\0035\4 \0=\4\23\0035\4!\0=\4\25\0034\4\0\0=\4\27\0034\4\0\0=\4\29\3=\3\"\0024\3\0\0=\3#\0024\3\0\0=\3\n\0024\3\0\0=\3$\0024\3\0\0=\3%\2B\0\2\1K\0\1\0\15extensions\20inactive_winbar\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\4\0\0\vbranch\tdiff\16diagnostics\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\frefresh\1\0\3\ftabline\3�\a\vwinbar\3�\a\15statusline\3�\a\17ignore_focus\23disabled_filetypes\vwinbar\15statusline\1\0\0\23section_separators\1\0\2\tleft\5\nright\5\25component_separators\1\0\2\tleft\5\nright\5\1\0\4\ntheme\tauto\18icons_enabled\2\17globalstatus\2\25always_divide_middle\2\nsetup\flualine\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neorg = {
    config = { "\27LJ\2\n`\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0005\3\3\0004\4\0\0=\4\4\3=\3\6\2B\0\2\1K\0\1\0\tload\1\0\0\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "https://github.com/tamago324/nlsp-settings.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs",
    wants = { "nvim-cmp" }
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1�\tbody\15lsp_expand�\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\v�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\1�\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\1�\tjump\rjumpable\21select_prev_item\fvisible�\a\1\0\r\0008\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\3\5\0035\5\6\0B\3\2\0019\3\5\0005\5\n\0005\6\b\0003\a\a\0=\a\t\6=\6\v\0059\6\f\0009\6\r\0069\6\14\0065\b\16\0009\t\f\0009\t\15\t)\v��B\t\2\2=\t\17\b9\t\f\0009\t\15\t)\v\4\0B\t\2\2=\t\18\b9\t\f\0009\t\19\tB\t\1\2=\t\20\b9\t\f\0009\t\21\t5\v\24\0009\f\22\0009\f\23\f=\f\25\vB\t\2\2=\t\26\b9\t\f\0003\v\27\0005\f\28\0B\t\3\2=\t\29\b9\t\f\0003\v\30\0005\f\31\0B\t\3\2=\t \bB\6\2\2=\6\f\0054\6\5\0005\a!\0>\a\1\0065\a\"\0>\a\2\0065\a#\0>\a\3\0065\a$\0>\a\4\6=\6%\5B\3\2\0019\3\5\0009\3&\3'\5'\0005\6+\0009\a(\0009\a%\a4\t\3\0005\n)\0>\n\1\t4\n\3\0005\v*\0>\v\1\nB\a\3\2=\a%\6B\3\3\0019\3\5\0009\3,\3'\5-\0005\6.\0009\a\f\0009\a\r\a9\a,\aB\a\1\2=\a\f\0064\a\3\0005\b/\0>\b\1\a=\a%\6B\3\3\0019\3\5\0009\3,\3'\0050\0005\0061\0009\a\f\0009\a\r\a9\a,\aB\a\1\2=\a\f\0069\a(\0009\a%\a4\t\3\0005\n2\0>\n\1\t4\n\3\0005\v3\0>\v\1\nB\a\3\2=\a%\6B\3\3\0019\0034\0\18\5\3\0009\0035\3'\0066\0009\a7\2B\a\1\0A\3\2\0012\0\0�K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\vconfig\14gitcommit\rfiletype\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\1\0\1\tname\fluasnip\f<S-Tab>\1\3\0\0\6n\6s\0\n<Tab>\1\3\0\0\6n\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\1\0\2\vmap_bs\1\vmap_cr\1\nsetup\19nvim-autopairs\"nvim-autopairs.completion.cmp\fluasnip\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    after = { "rust-tools.nvim", "clangd_extensions.nvim" },
    config = { "\27LJ\2\n0\0\1\2\0\2\0\a9\1\0\0\6\1\1\0X\1\2�+\1\1\0X\2\1�+\1\2\0L\1\2\0\fnull-ls\tname_\1\0\4\1\b\0\v6\0\0\0009\0\1\0009\0\2\0009\0\3\0005\2\4\0-\3\0\0=\3\5\0023\3\6\0=\3\a\2B\0\2\1K\0\1\0\1�\vfilter\0\nbufnr\1\0\1\tsync\1\vformat\bbuf\blsp\bvim�\1\1\2\a\1\r\0\0269\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19�6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\0012\0\0�K\0\1\0\a�\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_method�\t\1\0\19\0001\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0016\2\0\0'\4\4\0B\2\2\0026\3\0\0'\5\5\0B\3\2\0026\4\0\0'\6\6\0B\4\2\0029\4\a\0045\6\t\0009\a\b\1=\a\n\6B\4\2\0016\4\0\0'\6\v\0B\4\2\0029\5\a\0045\a\17\0006\b\f\0009\b\r\b9\b\14\b'\n\15\0B\b\2\2'\t\16\0&\b\t\b=\b\18\a5\b\19\0=\b\20\aB\5\2\0016\5\f\0009\5\21\0059\5\15\0055\a\22\0B\5\2\0015\5\23\0006\6\24\0\18\b\5\0B\6\2\4H\t\f�'\v\25\0\18\f\t\0&\v\f\v6\f\f\0009\f\r\f9\f\26\f\18\14\v\0005\15\27\0=\n\28\15=\v\29\15=\v\30\15B\f\3\1F\t\3\3R\t�\1276\6\24\0009\b\b\1B\6\2\4H\t\22�6\v\0\0'\r\31\0B\v\2\0026\f \0006\14\0\0'\15!\0\18\16\n\0&\15\16\15B\f\3\3\15\0\f\0X\14\a�6\14\f\0009\14\"\14'\16#\0\18\17\v\0\18\18\r\0B\14\4\2\18\v\14\0008\14\n\0009\14\a\14\18\16\v\0B\14\2\1F\t\3\3R\t�\1274\6\0\0006\a\24\0009\t$\1B\a\2\4H\n\a�6\f%\0009\f&\f\18\14\6\0009\15'\0029\15(\0158\15\v\15B\f\3\1F\n\3\3R\n�\1276\a\24\0009\t)\1B\a\2\4H\n\a�6\f%\0009\f&\f\18\14\6\0009\15'\0029\15)\0158\15\v\15B\f\3\1F\n\3\3R\n�\1276\a\f\0009\a*\a9\a+\a'\t,\0004\n\0\0B\a\3\0029\b\a\0025\n-\0=\6.\n3\v/\0=\v0\nB\b\2\0012\0\0�K\0\1\0\14on_attach\0\fsources\1\0\0\18LspFormatting\24nvim_create_augroup\bapi\16diagnostics\15formatting\rbuiltins\vinsert\ntable\15formatters\nforce\20tbl_deep_extend\30plug.editor.lsp.settings.\npcall\28plug.editor.lsp.handler\nnumhl\vtexthl\ttext\1\0\0\16sign_define\19DiagnosticSign\npairs\1\0\4\tInfo\t \tWarn\t \tHint\t \nError\t \1\0\5\21update_in_insert\1\18severity_sort\2\14underline\2\nsigns\2\17virtual_text\2\15diagnostic)local_settings_root_markers_fallback\1\2\0\0\t.git\16config_home\1\0\3\23local_settings_dir\f.neovim\vloader\tjson\27append_default_schemas\2\18/lsp-settings\vconfig\fstdpath\afn\bvim\17nlspsettings\21ensure_installed\1\0\1\27automatic_installation\2\fservers\nsetup\20mason-lspconfig\15core.utils\fnull-ls\blsp\16user.config\14lspconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n�\3\0\0\a\0\20\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\6\0004\5\3\0005\6\5\0>\6\1\5=\5\a\4=\4\b\3=\3\t\0025\3\n\0005\4\v\0=\4\f\3=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\2\24update_focused_file\1\0\1\venable\2\16diagnostics\1\0\1\venable\2\rrenderer\nicons\1\0\1\18git_placement\nafter\1\0\2\18highlight_git\2\16group_empty\2\tview\rmappings\tlist\1\0\0\1\0\2\bkey\6u\vaction\vdir_up\1\0\2\18adaptive_size\2\tside\nright\1\0\2'hijack_unnamed_buffer_when_opening\2\fsort_by\19case_sensitive\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-rainbow", "neorg", "nvim-treesitter-endwise" },
    config = { "\27LJ\2\n�\2\0\0\t\0\15\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0016\2\0\0'\4\n\0B\2\2\0029\2\v\0026\4\f\0009\4\r\4'\6\14\0\18\a\1\0\18\b\0\0B\4\4\0A\2\0\1K\0\1\0\nforce\20tbl_deep_extend\bvim\nsetup\28nvim-treesitter.configs\fendwise\1\0\1\venable\2\frainbow\1\0\3\venable\2\18extended_mode\2\19max_file_lines\3��\6\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\1\0\2\17auto_install\2\17sync_install\1\15treesitter\16user.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    config = { "\27LJ\2\n>\0\0\4\0\3\0\b6\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0004\3\0\0B\0\3\1K\0\1\0\nsetup\rpresence\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\5\0\26\0,5\0\18\0005\1\3\0006\2\0\0'\4\1\0B\2\2\0029\2\2\2=\2\4\0015\2\5\0=\2\6\0015\2\15\0004\3\t\0005\4\a\0>\4\1\0035\4\b\0>\4\2\0035\4\t\0>\4\3\0035\4\n\0>\4\4\0035\4\v\0>\4\5\0035\4\f\0>\4\6\0035\4\r\0>\4\a\0035\4\14\0>\4\b\3=\3\16\2=\2\17\1=\1\19\0005\1\22\0006\2\0\0'\4\20\0B\2\2\0029\2\21\2=\2\21\1=\1\23\0006\1\0\0'\3\24\0B\1\2\0029\1\25\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\15rust-tools\vserver\1\0\0\14on_attach\28plug.editor.lsp.handler\ntools\1\0\0\18hover_actions\vborder\1\0\1\15auto_focus\2\1\3\0\0\b│\16FloatBorder\1\3\0\0\b╰\16FloatBorder\1\3\0\0\b─\16FloatBorder\1\3\0\0\b╯\16FloatBorder\1\3\0\0\b│\16FloatBorder\1\3\0\0\b╮\16FloatBorder\1\3\0\0\b─\16FloatBorder\1\3\0\0\b╭\16FloatBorder\16inlay_hints\1\0\n\22only_current_line\1\14highlight\fComment\24right_align_padding\3\a\16right_align\1\26max_len_align_padding\3\1\18max_len_align\1\23other_hints_prefix\5\27parameter_hints_prefix\5\25show_parameter_hints\2\tauto\2\rexecutor\1\0\1%reload_workspace_from_cargo_toml\2\rtermopen\25rust-tools/executors\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14ui-select\19load_extension\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\1K\0\1\0\14user.maps\nsetup\14which-key\frequire\0" },
    keys = { { "", "<leader>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cmp"] = "nvim-cmp",
  ["^cmp_nvim_lsp"] = "nvim-cmp",
  ["^which%-key"] = "which-key.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\0196\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\1\15\0\1\0X\2\4�6\1\0\0009\3\2\0009\3\3\3B\1\2\0016\1\4\0009\1\5\1'\3\6\0009\4\2\0009\4\a\4&\3\4\3B\1\2\1K\0\1\0\aas\17colorscheme \bcmd\bvim\arc\ntheme\16user.config\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lspsaga lua require("packer.load")({'lspsaga.nvim'}, { cmd = "Lspsaga", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader> <cmd>lua require("packer.load")({'which-key.nvim'}, { keys = "<lt>leader>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType norg ++once lua require("packer.load")({'neorg'}, { ft = "norg" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'clangd_extensions.nvim'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'clangd_extensions.nvim'}, { ft = "c" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'gitsigns.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'alpha-nvim', 'lualine.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter Cargo.toml ++once lua require("packer.load")({'crates.nvim'}, { event = "BufWinEnter Cargo.toml" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'indent-blankline.nvim', 'todo-comments.nvim', 'nvim-treesitter', 'Comment.nvim', 'nvim-lspconfig'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'indent-blankline.nvim', 'presence.nvim', 'todo-comments.nvim', 'nvim-treesitter', 'Comment.nvim', 'nvim-lspconfig'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/yxqsnz/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], true)
vim.cmd [[source /home/yxqsnz/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]]
time([[Sourcing ftdetect script at: /home/yxqsnz/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
