" Exuma 1.0
"
" https://github.com/9mm/dotfiles
"
" Copyright 2018, All rights reserved
"
" Color numbers (0-255) see:
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "exuma"

"""

hi Boolean         guifg=#ffe1b3
hi Character       guifg=#a8ff60
hi Number          guifg=#fcccdd
hi String          guifg=#c6ffb3
hi Conditional     guifg=#92c5f7                 gui=none
hi Constant        guifg=#c2f9e0                 gui=none
hi Cursor          guifg=#f1f1f1  guibg=#777777
hi iCursor         guifg=#f1f1f1  guibg=#777777
hi Debug           guifg=#bca3a3                 gui=none
hi Define          guifg=#a2f2ff
hi Delimiter       guifg=#888888
hi Directory       guifg=#aaaaaa                 gui=none
hi Error           guifg=#a8ff60  guibg=#1e0010
hi ErrorMsg        guifg=#92c5f7  guibg=#232526  gui=none
hi Exception       guifg=#a0d7f3                 gui=none
hi Float           guifg=#99cc99
hi FoldColumn      guifg=#465457  guibg=#000000
hi Folded          guifg=#465457  guibg=#000000
hi Function        guifg=#e6b6ff
hi Identifier      guifg=#ffbcd2
hi Ignore          guifg=#808080  guibg=bg
hi IncSearch       guifg=#fff9b5  guibg=#000000
hi Keyword         guifg=#92c5f7                 gui=none
hi Label           guifg=#a8ff60                 gui=none
hi Macro           guifg=#fff9b5                 gui=none
hi SpecialKey      guifg=#66d9ef                 gui=none
hi MatchParen      guifg=#b7b9b8  guibg=#444444  gui=none
hi ModeMsg         guifg=#a8ff60
hi MoreMsg         guifg=#a8ff60
hi Operator        guifg=#92c5f7
hi Pmenu           guifg=#66d9ef  guibg=#000000
hi PmenuSel        guifg=#ffffff  guibg=#444444
hi PmenuSbar                      guibg=#080808
hi PmenuThumb      guifg=#66d9ef
hi PreCondit       guifg=#a0d7f3                 gui=none
hi PreProc         guifg=#a0d7f3
hi Question        guifg=#66d9ef
hi Repeat          guifg=#92c5f7                 gui=none
hi Search          guifg=#000000  guibg=#b4ec85
hi SignColumn      guifg=#a0d7f3  guibg=#232526
hi SpecialChar     guifg=#92c5f7                 gui=none
hi SpecialComment  guifg=#7c7c7c                 gui=none
hi Special         guifg=#66d9ef  guibg=bg       gui=none
if has("spell")
  hi SpellBad      guisp=#ff0000  gui=undercurl
  hi SpellCap      guisp=#7070f0  gui=undercurl
  hi SpellLocal    guisp=#70f0f0  gui=undercurl
  hi SpellRare     guisp=#ffffff  gui=undercurl
endif
hi Statement       guifg=#cbe5fc
hi StatusLine      guifg=#455354  guibg=fg       gui=none
hi StatusLineNC    guifg=#808080  guibg=#080808
hi StorageClass    guifg=#b6b7eb                 gui=none
hi Structure       guifg=#66d9ef
hi Tag             guifg=#92c5f7                 gui=none
hi Title           guifg=#b6b7eb                 gui=none
hi Todo            guifg=#ffffff  guibg=bg       gui=none
hi Typedef         guifg=#66d9ef
hi Type            guifg=#fff9b5                 gui=none
hi Underlined      guifg=#808080                 gui=underline
hi VertSplit       guifg=#808080  guibg=#080808
hi VisualNOS                      guibg=#403d3d
hi Visual                         guibg=#403d3d
hi WarningMsg      guifg=#ffffff  guibg=#333333
hi WildMenu        guifg=#66d9ef  guibg=#000000
hi TabLineFill     guifg=#1d1f21  guibg=#1d1f21
hi TabLine         guibg=#1d1f21  guifg=#808080  gui=none
hi Normal          guifg=#f8f8f2  guibg=#111111
hi Comment         guifg=#7c7c7c
hi CursorLine                     guibg=#292929
hi CursorLineNr    guifg=#b6b7eb                 gui=none
hi CursorColumn                   guibg=#293739
hi ColorColumn                    guibg=#232526
hi LineNr          guifg=#465457  guibg=#232526
hi NonText         guifg=#465457
hi SpecialKey      guifg=#465457

" Git Gutter
hi GitGutterAdd    guifg=#009900 guibg=#232526 ctermfg=2 ctermb=0
hi GitGutterChange guifg=#f5db00 guibg=#232526 ctermfg=3 ctermb=0
hi GitGutterDelete guifg=#ff2222 guibg=#232526 ctermfg=1 ctermb=0

" NERDTree
hi NERDTreeDir      guifg=#aaaaaa
hi NERDTreeDirSlash guifg=#a0d7f3

" CtrlP
hi CtrlPMatch       guifg=#b6b7eb
