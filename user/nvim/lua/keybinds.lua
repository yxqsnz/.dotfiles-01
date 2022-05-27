local keymap = vim.keymap
local function cmd_cb(cmd)
  return function()
    vim.cmd(':' .. cmd)
  end
end

keymap.set('n', '<leader>e', cmd_cb('NvimTreeToggle'), {})
keymap.set('n', '<C-s>', cmd_cb('w'), {})
keymap.set('n', '<leader>r', cmd_cb("Lspsaga rename"), {})
keymap.set('n', '<leader>la', cmd_cb("Lspsaga code_action"), {})
keymap.set('n', ']d', cmd_cb("Lspsaga diagnostic_jump_next"), {})
keymap.set('n', '[d', cmd_cb("Lspsaga diagnostic_jump_prev"), {})
