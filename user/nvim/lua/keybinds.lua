local keymap = vim.keymap
local function command(cmd)
  return '<cmd>' .. cmd .. '<cr>'
end

local opts = { noremap = true, silent = true }
-- keymap.set(mode, keybind, function, options)
keymap.set('n', 'll', command('NvimTreeToggle'), opts)
keymap.set('n', 'xx', command('TroubleToggle'), opts)
keymap.set('n', 'q', command('q'), opts)
keymap.set('n', '<C-s>', command('w'), opts)
keymap.set('n', 'LL', command("SymbolsOutline"), opts)
keymap.set('n', '<leader>lr', command("Lspsaga rename"), opts)
keymap.set('n', '<leader>la', command("Lspsaga code_action"), opts)
keymap.set('n', ']d', command("Lspsaga diagnostic_jump_next"), opts)
keymap.set('n', '[d', command("Lspsaga diagnostic_jump_prev"), opts)
keymap.set('n', '<leader>o', command("SymbolsOutline"), opts)
keymap.set('n', 'K', command("Lspsaga hover_doc"), opts)
keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
keymap.set('n', 'bn', command('BufferLineCycleNext'), opts)
keymap.set('n', 'bb', command('BufferLineCyclePrev'), opts)
keymap.set('n', '<ESC>', command('nohl'), opts)
keymap.set("n", "vx", command('STSSelectMasterNode'), opts)
keymap.set("n", "vn", command('STSSelectCurrentNode<cr>'), opts)
keymap.set("x", "<A-j>", command('STSSwapNextVisual'), opts)
keymap.set("x", "<A-k>", command('STSSwapPrevVisual'), opts)
keymap.set("i", "<C-v>", [[<ESC>"+pi]], opts);
