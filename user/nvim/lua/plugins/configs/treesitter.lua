local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

require "nvim-treesitter.configs".setup{
  sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  ensure_installed = { "python", "lua", "html", "css", "javascript", "c_sharp", "query" },
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  autotag = {
    enable=true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  matchup = {
    enable = true,
  },
  refactor = {
      highlight_definitions = {
        enable = false,
        clear_on_cursor_move = true,
      },
      highlight_current_scope = {
        enable = false,
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "gr"
        }
      },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "<leader>td",
          list_definitions = "<leader>tl"
        }
      }
    },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_files_lines = nil,
    colors = { "#d9bc8c", "#a988b0", "#8da3b9" },
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}
