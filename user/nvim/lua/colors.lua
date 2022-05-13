local base16 = require('base16')

-- themes
local paradise_dark = base16.theme_from_array {
	"151515"; "1f1f1f"; "282828"; "3b3b3b";
	"e8e3e3"; "e8e3e3"; "e8e3e3"; "e8e3e3";
  	"b66467"; "d9bc8c"; "d9bc8c"; "8c977d";
	"8aa6a2"; "8da3b9"; "a988b0"; "e8e3e3";
}
base16(paradise_dark, true)

-- higlights
vim.api.nvim_command[[
  exe "hi StatusInactive guibg=background guifg=".g:terminal_color_8
  exe "hi StatusNormal guifg=background guibg=".g:terminal_color_2
  exe "hi StatusReplace guifg=background guibg=".g:terminal_color_1
  exe "hi StatusInsert guifg=background guibg=".g:terminal_color_2
  exe "hi StatusCommand guifg=background guibg=".g:terminal_color_3
  exe "hi StatusVisual guifg=background guibg=".g:terminal_color_4
  exe "hi StatusTerminal guifg=background guibg=".g:terminal_color_5

  exe "hi NvimTreeGitDirty guifg=".g:terminal_color_1
  exe "hi NvimTreeGitNew guifg=".g:terminal_color_2
  exe "hi NvimTreeGitDeleted guifg=".g:terminal_color_1
  exe "hi NvimTreeGitRenamed guifg=".g:terminal_color_3
  exe "hi NvimTreeSpecialFile guifg=".g:terminal_color_5
  exe "hi NvimTreeExecFile guifg=".g:terminal_color_2
  exe "hi NvimTreeImageFile guifg=".g:terminal_color_7

  exe "hi CmpItemAbbrMatch guibg=NONE guifg=".g:terminal_color_14
  exe "hi CmpItemAbbrMatchFuzzy guibg=NONE guifg=".g:terminal_color_14
  exe "hi CmpItemKindFunction guibg=NONE guifg=".g:terminal_color_15
  exe "hi CmpItemKindMethod guibg=NONE guifg=".g:terminal_color_15
  exe "hi CmpItemKindVariable guibg=NONE guifg=".g:terminal_color_14
  exe "hi CmpItemKindKeyword guibg=NONE guifg=".g:terminal_color_5
  exe "hi CmpItemKindText guifg=".g:terminal_color_10
  exe "hi CmpItemKindConstructor guifg=".g:terminal_color_11
  exe "hi CmpItemKindField guifg=".g:terminal_color_14
  exe "hi CmpItemKindClass guifg=".g:terminal_color_10
  exe "hi CmpItemKindInterface guifg=".g:terminal_color_10
  exe "hi CmpItemKindModule guifg=".g:terminal_color_14
  exe "hi CmpItemKindProperty guifg=".g:terminal_color_14
  exe "hi CmpItemKindValue guifg=".g:terminal_color_10
  exe "hi CmpItemKindEnum guifg=".g:terminal_color_10
  exe "hi CmpItemKindSnippet guifg=".g:terminal_color_12
  exe "hi CmpItemKindFile guifg=".g:terminal_color_14
  exe "hi CmpItemKindEnumMember guifg=".g:terminal_color_14
  exe "hi CmpItemKindConstant guifg=".g:terminal_color_11
  exe "hi CmpItemKindStruct guifg=".g:terminal_color_10
  exe "hi CmpItemKindTypeParameter guifg=".g:terminal_color_10

  hi EndOfBuffer guifg=background
  hi LineNr guibg=background
  hi SignColumn guibg=background
  hi VertSplit guibg=background

  hi! link TabLineSel StatusInsert
  hi TabLine guibg=background
  hi TabLineFill guibg=background

  hi FoldColumn guibg=background
  hi DiffAdd guibg=background
  hi DiffChange guibg=background
  hi DiffDelete guibg=background
  hi DiffText guibg=background

]]
