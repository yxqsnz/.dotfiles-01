local keymap = require("utils.keymap")
local mapper = keymap.global()
vim.g.mapleader = " "
mapper.map("n", "<leader>fm", ":NvimTreeToggle<cr>")
mapper.map("n", ",leader>q", ":q!")
mapper.map("n", "<C-s>", ":w!<cr>")
mapper.map("n", "<leader>ff", ":Telescope find_files<cr>")
mapper.map("n", "<leader>fg", ":Telescope git_files<cr>")
mapper.map("n", "<leader>gp", ":Telescope live_grep<cr>")
mapper.map("n", "<leader>gb", ":Telescope buffers<cr>")
mapper.map("n", "<leader>ld", ":Telescope diagnostics<cr>")
mapper.map("n", "<leader>lds", ":Telescope lsp_document_symbols<cr>")
mapper.map("n", "<leader>lws", ":Telescope lsp_workspace_symbols<cr>")
