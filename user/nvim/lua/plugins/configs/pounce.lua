require'pounce'.setup{
  accept_keys = "JFKDLSAHGNUVRBYTMICEOXWPQZ",
  accept_best_key = "<enter>",
  multi_window = true,
  debug = false,
}

vim.api.nvim_command[[
highlight PounceMatch gui=bold guifg=#555555 guibg=#11dd11
highlight PounceGap gui=bold guifg=#555555 guibg=#00aa00
highlight PounceAccept gui=bold guifg=#111111 guibg=#de940b
]]
