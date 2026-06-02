" Name:         miku 
" Description:  miku theme for vim!
" Author:       Caleb C. Chan
" Maintainer:   Caleb C. Chan

" echo synIDattr(synID(line('.'), col('.'), 1), 'name')


hi clear
let g:colors_name = 'miku'

hi Normal guifg=#C7D2DB ctermfg=253 guibg=#000000 ctermbg=016

hi Comment guifg=#59787f ctermfg=66

hi PreProc guifg=#af87af ctermfg=139

hi String guifg=#87d7ff ctermfg=117

hi StatusLineNC guifg=#ffffff ctermfg=231

hi StatusLine guifg=#B7C2CC ctermfg=250

hi Type guifg=#87ffff ctermfg=123

hi Repeat guifg=#ffffff ctermfg=231

hi Statement guifg=#afafff ctermfg=147

hi Constant guifg=#d7005f ctermfg=197

hi Special guifg=#b46464 ctermfg=132

hi Function guifg=#5fffff ctermfg=87

hi Search guibg=#008787 ctermbg=30 guifg=#87ffff ctermfg=123

hi Todo guibg=#59787f ctermbg=66 guifg=#87ffff ctermfg=123

hi! link Title Constant

hi! link LineNr PreProc
hi! link EndOfBuffer Comment

hi! link VertSplit StatusLineNC
hi! link Conditional Repeat
hi! link Operator Repeat
hi! link Identifier Normal

" netrw
hi! link netrwDir Statement
hi! link netrwTreeBar Comment
