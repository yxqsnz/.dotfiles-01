plugin {
  'glepnir/lspsaga.nvim',
  requires = { 'glepnir/lspsaga.nvim' },
  cmd = 'Lspsaga',
  config = function()
    local saga = require('lspsaga')
    saga.init_lsp_saga {
      border_style = 'rounded',
      code_action_lightbulb = {
        enable = false,
      },
    }
  end,
}
