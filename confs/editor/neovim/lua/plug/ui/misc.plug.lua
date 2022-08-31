plugin {
  'folke/todo-comments.nvim',
  requires = 'nvim-lua/plenary.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = function()
    require('todo-comments').setup {}
  end,
}

plugin {
  'akinsho/bufferline.nvim',
  event = { 'BufRead', 'BufNewFile' },
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        ---@diagnostic disable-next-line: assign-type-mismatch
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        indicator = {
          style = 'underline',
        },
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            text_align = 'center',
            separator = true,
          },
        },
      },
    }
  end,
}
