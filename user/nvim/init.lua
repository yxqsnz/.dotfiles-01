Directories = {
  sessions = vim.fn.stdpath("data") .. "/sessions/",
  undo     = vim.fn.stdpath("cache") .. "/undo/"
}
Leader = ' '
require('options')
require('keybinds')
require('packerInit')
vim.o.guifont = 'Operator Mono Lig:style=Italic:h8'
