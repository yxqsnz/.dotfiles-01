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
  LuaSnip = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\nh\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\20separator_style\nslant\nsetup\15bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    after = { "feline.nvim" },
    config = { "\27LJ\2\n∫\5\0\0\a\0\23\0\0286\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0005\5\a\0005\6\b\0=\6\t\0055\6\n\0=\6\v\5=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\4=\4\17\3B\1\2\0016\1\18\0009\1\19\1'\3\20\0006\4\21\0009\4\22\4&\3\4\3B\1\2\1K\0\1\0\ntheme\rOmegaVim\17colorscheme \bcmd\bvim\17integrations\21indent_blankline\1\0\2\26colored_indent_levels\2\fenabled\2\rnvimtree\1\0\3\fenabled\2\22transparent_panel\1\14show_root\1\15native_lsp\15underlines\1\0\4\rwarnings\14underline\nhints\14underline\16information\14underline\verrors\14underline\17virtual_text\1\0\4\rwarnings\vitalic\nhints\vitalic\16information\vitalic\verrors\vitalic\1\0\1\fenabled\2\1\0\t\bcmp\2\15telekasten\2\bhop\1\14dashboard\2\rgitsigns\2\14gitgutter\1\rlsp_saga\2\16lsp_trouble\1\15treesitter\2\vstyles\1\0\5\14variables\tNONE\fstrings\tNONE\rkeywords\tNONE\14functions\tNONE\rcomments\tNONE\1\0\2\16term_colors\2\27transparent_background\1\nsetup\15catppuccin\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\nz\0\0\6\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0006\3\0\0'\5\3\0B\3\2\2=\3\5\2B\0\2\1K\0\1\0\15components\1\0\0(catppuccin.core.integrations.feline\nsetup\vfeline\frequire\0" },
    load_after = {
      catppuccin = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  nvim = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim",
    url = "https://github.com/catppuccin/nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireå\a\1\0\v\0003\1\\6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1,\1=\1\4\0006\0\5\0'\2\6\0B\0\2\0026\1\5\0'\3\a\0B\1\2\0029\2\b\0005\4\f\0005\5\n\0003\6\t\0=\6\v\5=\5\r\0045\5\15\0009\6\14\0014\b\0\0B\6\2\2=\6\16\5=\5\17\0045\5\18\0=\5\19\0045\5\21\0005\6\20\0=\6\22\0056\6\23\0009\6\24\0066\b\0\0009\b\25\b9\b\26\b)\n\0\0B\b\2\2\25\b\0\bB\6\2\2=\6\27\0056\6\23\0009\6\24\0066\b\0\0009\b\25\b9\b\28\b)\n\0\0B\b\2\2\25\b\0\bB\6\2\2=\6\29\5=\5\30\0044\5\5\0005\6\31\0>\6\1\0055\6 \0>\6\2\0055\6!\0>\6\3\0055\6\"\0>\6\4\5=\5#\0045\5&\0009\6$\0009\6%\6)\b¸ˇB\6\2\2=\6'\0059\6$\0009\6%\6)\b\4\0B\6\2\2=\6(\0059\6$\0009\6)\6B\6\1\2=\6*\0059\6$\0009\6+\6B\6\1\2=\6,\0059\6$\0009\6-\0065\b0\0009\t.\0009\t/\t=\t1\bB\6\2\2=\0062\5=\5$\4B\2\2\1K\0\1\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\fsources\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\18documentation\rmaxwidth\rwinwidth\14maxheigth\14winheight\afn\nfloor\tmath\vborder\1\0\1\17winhighlight\28FloatBorder:NormalFloat\1\t\0\0\tü≠Ω\b‚ñî\tü≠æ\b‚ñï\tü≠ø\b‚ñÅ\tü≠º\b‚ñè\15completion\1\0\1\16completeopt\30menuone,noinsert,noselect\15formatting\vformat\1\0\0\15cmp_format\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\flspkind\bcmp\frequire\15updatetime\30menuone,noselect,noinsert\16completeopt\6o\bvim\4\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    after = { "nvim-lspconfig" },
    config = { "\27LJ\2\n®\1\0\0\6\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0005\5\3\0=\5\5\4=\4\a\3B\1\2\1K\0\1\0\aui\1\0\0\nicons\1\0\0\1\0\3\19server_pending\b‚ûú\23server_uninstalled\b‚úó\21server_installed\b‚úì\rsettings\23nvim-lsp-installer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n#\0\1\5\1\1\0\5\18\3\0\0009\1\0\0-\4\0\0B\1\3\1K\0\1\0\3¿\nsetup±\3\1\0\r\0\24\0,6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\0019\1\5\1B\1\1\0025\2\6\0006\3\a\0\18\5\2\0B\3\2\4H\6\fÄ'\b\b\0\18\t\6\0&\b\t\b6\t\2\0009\t\t\t9\t\n\t\18\v\b\0005\f\v\0=\a\f\f=\b\r\f=\b\14\fB\t\3\1F\6\3\3R\6Ú5\3\17\0006\4\0\0'\6\15\0B\4\2\0029\4\16\4\18\6\1\0B\4\2\2=\4\18\0036\4\2\0009\4\19\0049\4\20\4=\4\21\0039\4\22\0003\6\23\0B\4\2\0012\0\0ÄK\0\1\0\0\20on_server_ready\rroot_dir\bcwd\tloop\17capabilities\1\0\0\24update_capabilities\17cmp_nvim_lsp\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\nError\bÔôò\tInfo\bÔüª\tWarn\bÔÅ±\tHint\bÔ†¥\29make_client_capabilities\rprotocol\blsp\bvim\23nvim-lsp-installer\frequire\0" },
    load_after = {
      ["nvim-lsp-installer"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n”\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\14highlight\1\0\2\venable\2\21use_languagetree\2\21ensure_installed\1\0\0\1\v\0\0\15javascript\15typescript\thtml\bcss\tbash\blua\tjson\vpython\trust\6c\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
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
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-lsp-installer', 'bufferline.nvim', 'nvim-lspconfig', 'catppuccin', 'feline.nvim', 'nvim-tree.lua'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'nvim-cmp', 'nvim-treesitter', 'lspsaga.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
