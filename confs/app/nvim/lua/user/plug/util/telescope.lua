with({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }, cmd = 'Telescope' }, function()
  local telescope = require('telescope')
  ---@diagnostic disable-next-line: redundant-parameter
  telescope.setup {
    defaults = {
      file_ignore_patterns = {
        "node_modules", "build", "dist", "yarn.lock", "packer_compiled.lua", "target"
      },
    }
  }
end)
