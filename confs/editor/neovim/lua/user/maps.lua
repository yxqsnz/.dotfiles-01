local which = require('which-key')

which.register({
  e = { '<cmd>NvimTreeToggle<cr>', 'Open file manager' },
}, { prefix = vim.g.mapleader })

which.register {
  ['<C-s>'] = { '<cmd>w<cr>', 'Save changes' },
}

which.register {
  ['<SPACE>'] = {
    ['<SPACE>'] = { '<cmd>Telescope find_files<cr>', 'Find files' },
  },
}

vim.keymap.set({ 'n', 'i' }, '<A-Down>', '<cmd>m .+1<cr>')
vim.keymap.set({ 'n', 'i' }, '<A-Up>', '<cmd>m .-2<cr>')
vim.keymap.set('n', '<ESC>', '<cmd>:nohl<cr>')
