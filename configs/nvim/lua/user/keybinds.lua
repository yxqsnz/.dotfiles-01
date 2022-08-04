local wk = require('which-key')

wk.register({
  f = {
    name = "file", 
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, 
    n = { "New File" }, 
    e = "Edit File", 
  },
}, { prefix = "<leader>" })
