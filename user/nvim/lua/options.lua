local opt, bopt, g              = vim.o, vim.bo, vim.g
opt.undodir                     = Directories.undo
opt.undofile                    = true
opt.tabstop, bopt.tabstop       = 2, 2
opt.shiftwidth, bopt.shiftwidth = 2, 2
opt.expandtab                   = true
opt.termguicolors               = true
opt.number                      = 1
opt.mouse                       = 'a'
opt.completeopt                 = "menuone,noselect,noinsert"
opt.updatetime                  = 300
opt.clipboard                   = "unnamedplus"
g.mapleader                     = Leader or ','
g.instant_username              = 'nagatorogameplays'
