" Vim color scheme: xoria256
" Port of xoria256 Emacs theme

set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "xoria256"

" Define colors
let s:default_fg = "252"
let s:default_bg = "234"
let s:cursor_line_bg = "237"
let s:comment_fg = "244"
let s:constant_fg = "229"
let s:error_fg = "brightwhite"
let s:identifier_fg = "182"
let s:line_no_fg = "237"
let s:number_fg = "180"
let s:preproc_fg = "150"
let s:special_fg = "174"
let s:statement_fg = "110"
let s:warning_fg = "173"
let s:status_line_fg = "brightwhite"
let s:status_line_bg = "239"
let s:visual_fg = "brightwhite"
let s:visual_bg = "brightblue"

" Set highlight groups
execute "highlight Normal ctermfg=" . s:default_fg . " ctermbg=" . s:default_bg
execute "highlight CursorLine ctermbg=" . s:cursor_line_bg
execute "highlight Comment ctermfg=" . s:comment_fg
execute "highlight Constant ctermfg=" . s:constant_fg
execute "highlight Error ctermfg=" . s:error_fg
execute "highlight Identifier ctermfg=" . s:identifier_fg
execute "highlight Number ctermfg=" . s:number_fg
execute "highlight PreProc ctermfg=" . s:preproc_fg
execute "highlight Special ctermfg=" . s:special_fg
execute "highlight Statement ctermfg=" . s:statement_fg
execute "highlight WarningMsg ctermfg=" . s:warning_fg
execute "highlight StatusLine ctermfg=" . s:status_line_fg . " ctermbg=" . s:status_line_bg
execute "highlight Visual ctermfg=" . s:visual_fg . " ctermbg=" . s:visual_bg

" Match numbers (similar to Emacs font-lock-number)
syntax match Number /\<\d\+\(e[+-]\?\d*\)\?\>/
syntax match Number /\<0[xX][0-9a-fA-F]\+\>/

" Link syntax groups
highlight link Float Number
highlight link Boolean Constant
highlight link Function Identifier
highlight link Keyword Statement
highlight link String Constant
highlight link Type Special

" Enable syntax highlighting if not already enabled
if !exists("g:syntax_on")
  syntax enable
endif
