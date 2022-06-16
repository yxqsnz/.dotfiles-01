local keymap = vim.keymap
local function run_command(cmd)
  return function()
    vim.cmd(':' .. cmd)
  end
end

-- keymap.set(mode, keybind, function, options)
keymap.set('n', 'll', run_command('NvimTreeToggle'), {})
keymap.set('n', 'xx', run_command('TroubleToggle'), {})
keymap.set('n', '<C-s>', run_command('w'), {})
keymap.set('n', 'LL', run_command("SymbolsOutline"), {})
keymap.set('n', '<leader>r', run_command("Lspsaga rename"), {})
keymap.set('n', '<leader>la', run_command("Lspsaga code_action"), {})
keymap.set('n', ']d', run_command("Lspsaga diagnostic_jump_next"), {})
keymap.set('n', '[d', run_command("Lspsaga diagnostic_jump_prev"), {})
keymap.set('n', '<leader>o', run_command("SymbolsOutline"), {})
keymap.set('n', 'K', run_command("Lspsaga hover_doc"), {})
keymap.set('n', 'gd', vim.lsp.buf.definition, {})
keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
keymap.set('n', '[q', run_command('BufferLineCycleNext'), {})
keymap.set('n', ']q', run_command('BufferLineCyclePrev'), {})
keymap.set('n', '<ESC>', run_command('nohl'), {})

