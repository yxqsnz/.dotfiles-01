local which = require('which-key')

-- Setup keybinds
return function(bufnr)
  which.register({
    l = {
      a = { vim.lsp.buf.code_action, 'Run code action' },
      r = { '<cmd>Lspsaga rename<cr>', 'Rename symbol' },
      S = { '<cmd>Telescope lsp_workspace_symbols<cr>', 'Find workspace symbols' },
      s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Find document symbols' },
      ds = { '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', 'Find dynamic workspace symbols' },
      i = { '<cmd>Telescope lsp_implementations<cr>', 'Find implementations' },
      d = { '<cmd>Telescope lsp_definitions<cr>', 'Find document definition' },
      fd = { '<cmd>Telescope lsp_type_definitions<cr>', 'Find type definitions' },
    },
  }, { buffer = bufnr, prefix = vim.g.mapleader })

  which.register({
    K = { '<cmd>Lspsaga hover_doc<cr>', 'Hover doc' },
    ['[d'] = { '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Go to next diagnostic' },
    [']d'] = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Go to prev diagnostic' },
  }, { buffer = bufnr })
end
