local function map(key, command, mode, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode or 'n', key, command, options)
end
local function bind(key, command)
	map(key, command .. '<CR>')
end
-- File tree binds
bind("<C-n>", ":NvimTreeToggle")
-- lsp saga keybinds
bind("<C-a>", ":Lspsaga code_action")
bind('K', ":Lspsaga hover_doc")
bind("<C-r>", ":Lspsaga rename")
bind('q', ":q");
