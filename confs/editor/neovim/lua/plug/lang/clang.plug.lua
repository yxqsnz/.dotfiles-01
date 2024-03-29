plugin {
  'p00f/clangd_extensions.nvim',
  after = 'nvim-lspconfig',
  ft = { 'c', 'cpp' },

  config = function()
    require('clangd_extensions').setup {
      server = {
        on_attach = require('plug.editor.lsp.handler').on_attach,
        cmd = {
          'clangd',
          '--all-scopes-completion',
          '--suggest-missing-includes',
          '--header-insertion-decorators',
          '--background-index',
          '--pch-storage=disk',
          '--cross-file-rename',
          '--log=info',
          '--completion-style=detailed',
          '--enable-config',
          '--clang-tidy',
          '--offset-encoding=utf-16',
        },
      },

      extensions = {
        autoSetHints = true,
        inlay_hints = {
          only_current_line = false,
          only_current_line_autocmd = 'CursorHold',
          show_parameter_hints = true,
          parameter_hints_prefix = '',
          other_hints_prefix = '',
          max_len_align = false,
          max_len_align_padding = 1,
          right_align = false,
          right_align_padding = 7,
          highlight = 'Comment',
          priority = 100,
        },
        ast = {
          role_icons = {
            type = '',
            declaration = '',
            expression = '',
            specifier = '',
            statement = '',
            ['template argument'] = '',
          },

          kind_icons = {
            Compound = '',
            Recovery = '',
            TranslationUnit = '',
            PackExpansion = '',
            TemplateTypeParm = '',
            TemplateTemplateParm = '',
            TemplateParamObject = '',
          },

          highlights = {
            detail = 'Comment',
          },
        },
        memory_usage = {
          border = 'none',
        },
        symbol_info = {
          border = 'none',
        },
      },
    }
  end,
}
