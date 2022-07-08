local keymap = {}
local opts = { silent = true, noremap = true }
function keymap.global()
  local mapper = {}
  function mapper.map(mode, keybind, action)
    vim.keymap.set(mode, keybind, action, opts)
  end
  return mapper
end
function keymap.buffer(bufnr)
  local map = vim.api.nvim_buf_set_keymap
  local mapper = {}
  function mapper.map(mode, keybind, action)
    map(bufnr, mode, keybind, action, opts)
  end
  return mapper
end
function keymap.map_for(mapper, modes, keybind, action)
  for _, mode in ipairs(modes) do
    mapper.map(mode, keybind, action)
  end
end
return keymap
