" Configuraciones del mapeo de teclas a mostrar con which-key pluggin
" Timeout
let g:which_key_timeout = 100

" map leader key
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" vim-which-key look
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 1
let g:which_key_max_size = 0
" autocmd! FileType which_key
" autocmd FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" defining keybindings
let g:which_key_map = {}
let g:which_key_map['/'] = [ 'gc' , 'comment' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC' , 'open init' ]
let g:which_key_map['='] = [ '<C-W>=' , 'balance windows' ]
let g:which_key_map['H'] = [ '<C-W>s' , 'split below']
let g:which_key_map['p'] = [ ':Files' , 'search files' ]
let g:which_key_map['v'] = [ '<C-W>v' , 'split right']

"let g:which_key_map.a = {
"      \ 'name' : '+actions' ,
"      \ 'h' : [':let @/ = ""' , 'remove search highlight'],
"      \ 'S' : [':s/\%V\(.*\)\%V/"\1"/' , 'surround'],
"      \ 'o' : [':set spell!' , 'orthography'],
"      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'f' : ['bfirst' , 'first-buffer'],
      \ 'l' : ['blast' , 'last buffer'],
      \ 'n' : ['bnext' , 'next-buffer'],
      \ 'p' : ['bprevious' , 'previous-buffer'],
      \ '?' : ['Buffers' , 'fzf-buffer'],
      \ }

let g:which_key_map.g = {
      \ 'name' : '+Lsp' ,
      \ 'd' : ['<Plug>(lsp-definition)' , 'Lsp Definition'],
      \ 's' : ['<Plug>(lsp-document-symbol-search)' , 'Lsp document symbol search'],
      \ 'S' : ['<Plug>(lsp-workspace-symbol-search)' , 'Lsp workspace symboñ search'],
      \ 'r' : ['<Plug>(lsp-references)' , 'Lsp References'],
      \ 'i' : ['<Plug>(lsp-implementation)' , 'Lsp Implementation'],
      \ 't' : ['<Plug>(lsp-type-definition)' , 'Lsp type definition'],
      \ '[' : ['<Plug>(lsp-previous-diagnostic)' , 'Lsp previous diagnostics'],
      \ ']' : ['<Plug>(lsp-next-diagnostic)' , 'Lsp next diagnostic'],
      \ 'K' : ['<Plug>(lsp-hover)' , 'Lsp hover'],
      \ }

let g:which_key_map.f = {
      \ 'name' : '+Finders' ,
      \ 'r' : ['FZFMru' , 'Recent Files'],
      \ 'f' : [':FZF .' , 'FZF pwd'],
      \ 'F' : [':FZF ~' , 'FZF ~'],
      \ }
