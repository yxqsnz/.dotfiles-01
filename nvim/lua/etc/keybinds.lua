local function map(key, command, mode, opts)
    local options = { noremap = true }
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
