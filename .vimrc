"
" ============================================================================
" ~/.vimrc — Vim optimizado
" ============================================================================
" Pensado para Vim clásico + vim-plug + CoC.
" No depende de Neovim.
"

" ============================================================================
" 1. DIRECTORIOS DE VIM
" ============================================================================
let s:vim_dirs = [
      \ $HOME . '/.vim/autoload',
      \ $HOME . '/.vim/backups',
      \ $HOME . '/.vim/colors',
      \ $HOME . '/.vim/spell',
      \ $HOME . '/.vim/undodir',
      \ $HOME . '/.vim/view',
      \ $HOME . '/.vim/viminfo',
      \ $HOME . '/.vim/vimswaps',
      \ ]

for dir in s:vim_dirs
  if !isdirectory(dir)
    call mkdir(dir, 'p', 0700)
  endif
endfor
unlet s:vim_dirs


" ============================================================================
" 2. vim-plug
" ============================================================================
if empty(glob('$HOME/.vim/autoload/plug.vim'))
  silent execute
        \ '!curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs '
        \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  autocmd VimEnter * ++once PlugInstall --sync | source $MYVIMRC
endif


" ============================================================================
" 3. OPCIONES GENERALES
" ============================================================================
set nocompatible
set encoding=utf-8

set hidden
set number
set relativenumber
set cursorline
set mouse=a
set clipboard=unnamedplus

set ignorecase
set smartcase
set incsearch
set hlsearch

set scrolloff=8
set sidescrolloff=8
set signcolumn=yes
set display+=lastline
set termguicolors

set updatetime=200

" vim-which-key necesita timeout
set timeout
set timeoutlen=500
set ttimeout
set ttimeoutlen=100

set wildmenu
set path=.,,
set grepprg=rg\ --vimgrep\ $*

set nowrap
set linebreak
set textwidth=0
set wrapmargin=0


" ============================================================================
" 4. INDENTACIÓN
" ============================================================================
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Evita cambiar automáticamente de directorio.
set noautochdir


" ============================================================================
" 5. BACKUPS / SWAP / UNDO / VIMINFO
" ============================================================================
set backup
set writebackup

execute 'set backupdir=' . fnameescape($HOME . '/.vim/backups//')
execute 'set directory=' . fnameescape($HOME . '/.vim/vimswaps//')

if has('persistent_undo')
  execute 'set undodir=' . fnameescape($HOME . '/.vim/undodir//')
  set undofile
endif

if exists('+viminfofile')
  execute 'set viminfofile=' . fnameescape($HOME . '/.vim/viminfo/viminfo')
endif


" ============================================================================
" 6. TÍTULO DE LA TERMINAL
" ============================================================================
if has('title')
  set title
  set titlestring=%f\ %h%m%r%w\ -\ %{v:progname}\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif


" ============================================================================
" 7. FILETYPE / SINTAXIS
" ============================================================================
filetype plugin indent on
syntax enable


" ============================================================================
" 8. PLUGINS
" ============================================================================
call plug#begin($HOME . '/.vim/plugged')

" ---------------------------------------------------------------------------
" UI
" ---------------------------------------------------------------------------
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frazrepo/vim-rainbow'
Plug 'ap/vim-css-color'
Plug 'kshenoy/vim-signature'
Plug 'Yggdroot/indentLine'
Plug 'catppuccin/vim', { 'as': 'catppuccin', 'branch': 'main' }

" ---------------------------------------------------------------------------
" Navegación / búsqueda
" ---------------------------------------------------------------------------
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'

" ---------------------------------------------------------------------------
" Which-Key
" ---------------------------------------------------------------------------
Plug 'liuchengxu/vim-which-key'

" ---------------------------------------------------------------------------
" LSP / completado
" ---------------------------------------------------------------------------
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" ---------------------------------------------------------------------------
" Edición
" ---------------------------------------------------------------------------
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'

" ---------------------------------------------------------------------------
" Lenguajes
" ---------------------------------------------------------------------------
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'typescript'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'typescript'] }
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'tbastos/vim-lua', { 'for': 'lua' }

" ---------------------------------------------------------------------------
" Salud de Vim
" ---------------------------------------------------------------------------
Plug 'rhysd/vim-healthcheck'

call plug#end()


" ============================================================================
" 9. TEMA / UI
" ============================================================================
set background=dark
colorscheme catppuccin

highlight Normal guibg=NONE ctermbg=NONE

highlight MatchParen
      \ gui=bold
      \ cterm=bold
      \ guifg=#FFD75F
      \ ctermfg=yellow

let g:airline_detect_modified = 1
let g:airline_theme = 'catppuccin_mocha'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:rainbow_active = 1
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

let g:minimap_highlight = 'Visual'

let g:indentLine_char_list = ['┊', '¦', '┆', '│']
let g:indentLine_setColors = 0


" ============================================================================
" 10. LEADER
" ============================================================================
let mapleader = ','
let maplocalleader = ','


" ============================================================================
" 11. ATAJOS GENERALES
" ============================================================================

" Escape rápido
inoremap jk <Esc>

" Limpiar búsqueda
nnoremap <silent><F2> :nohlsearch<CR>

" Movimiento visual por líneas
nnoremap j gj
nnoremap k gk

" Mantener cursor centrado
nnoremap n nzz
nnoremap N Nzz
nnoremap # #zz
nnoremap * *zz
nnoremap g# g#zz
nnoremap g* g*zz

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

" Redimensionar ventanas
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Relative numbers
nnoremap <F4> :set relativenumber!<CR>

" Eliminar trailing whitespace
nnoremap <F10> :call StripTrailingWhitespaces()<CR>

" Búsqueda muy-mágica en Visual
vnoremap / /\v

" Terminal
nnoremap <leader>tt :botright terminal<CR>

" Guardar usando sudo
nnoremap <leader>w :write !sudo tee % >/dev/null<CR>


" ============================================================================
" 12. BUFFERS
" ============================================================================
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bf :Buffers<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bF :bfirst<CR>
nnoremap <leader>bl :blast<CR>


" ============================================================================
" 13. BÚSQUEDA / ARCHIVOS
" ============================================================================
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fr :FZFMru<CR>
nnoremap <leader>fv :vimgrep /<C-r><C-w>/gj **/*<CR>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>


" ============================================================================
" 14. CoC
" ============================================================================

" Formatear
nnoremap <leader>lf :call CocAction('format')<CR>

" Rename
nnoremap <leader>rn <Plug>(coc-rename)

" Navegación LSP
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Documentación
nnoremap <silent> K :call ShowDocumentation()<CR>


" ============================================================================
" 15. CoC COMPLETION
" ============================================================================

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <S-TAB>
      \ coc#pum#visible() ? coc#pum#prev(1) :
      \ "\<C-h>"

function! CheckBackspace() abort
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1] =~# '\s'
endfunction


function! ShowDocumentation() abort
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" ============================================================================
" 16. SPELL — INGLÉS + ESPAÑOL
" ============================================================================
set spelllang=en,es

nnoremap <leader>ss :setlocal spell!<CR>
nnoremap <leader>sa zg
nnoremap <leader>sn ]s
nnoremap <leader>sp [s


" ============================================================================
" 17. TABS
" ============================================================================
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>te :tabedit
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tp :tabprevious<CR>


" ============================================================================
" 18. MOVER LÍNEAS
" ============================================================================
nnoremap <M-Down> :move .+1<CR>
nnoremap <M-Up> :move .-2<CR>

vnoremap <M-Down> :move '>+1<CR>gv=gv
vnoremap <M-Up> :move '<-2<CR>gv=gv


" ============================================================================
" 19. EJECUTAR ARCHIVOS
" ============================================================================

function! EjecutarArchivo() abort
  update

  let l:filetype = &filetype
  let l:file = shellescape(expand('%:p'))

  if l:filetype ==# 'python'
    let l:cmd = 'python3 ' . l:file

  elseif l:filetype ==# 'lua'
    let l:cmd = 'lua ' . l:file

  elseif l:filetype ==# 'javascript'
    let l:cmd = 'node ' . l:file

  else
    echohl WarningMsg
    echomsg 'Tipo de archivo no soportado: ' . l:filetype
    echohl None
    return
  endif

  botright new
  execute 'terminal ++curwin ' . l:cmd
  startinsert
endfunction


augroup EjecucionRapida
  autocmd!
  autocmd FileType python,lua,javascript
        \ nnoremap <buffer> <F5> :call EjecutarArchivo()<CR>
augroup END


" ============================================================================
" 20. CONFIGURACIÓN POR LENGUAJE
" ============================================================================
augroup LangSettings
  autocmd!

  autocmd FileType python
        \ setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

  autocmd FileType javascript,typescript,json
        \ setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

  autocmd FileType yaml,lua
        \ setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

  autocmd FileType markdown,text
        \ setlocal wrap linebreak textwidth=80 formatoptions+=ta
augroup END


" ============================================================================
" 21. FORMATEO AUTOMÁTICO CON CoC
" ============================================================================
augroup CocAutoFormat
  autocmd!

  autocmd BufWritePre *.py,*.js,*.jsx,*.ts,*.tsx,*.lua
        \ silent! call CocAction('format')
augroup END


" ============================================================================
" 22. RECARGAR .vimrc AUTOMÁTICAMENTE
" ============================================================================
augroup ReloadVimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC
        \ nested source $MYVIMRC |
        \ echomsg 'config recargada'
augroup END


" Recarga manual
nnoremap <leader>sv
      \ :source $MYVIMRC<CR>:echomsg 'config recargada'<CR>


" ============================================================================
" 23. ELIMINAR TRAILING WHITESPACE
" ============================================================================
function! StripTrailingWhitespaces() abort
  let l:save_view = winsaveview()
  let l:save_search = @/

  keeppatterns %s/\s\+$//e

  let @/ = l:save_search
  call winrestview(l:save_view)
endfunction


" ============================================================================
" 24. COLORES DE LOS NÚMEROS DE LÍNEA
" ============================================================================
function! LineNumberColors() abort
  highlight LineNrAbove
        \ guifg=#51B3EC
        \ gui=bold

  highlight LineNr
        \ guifg=#FFFFFF
        \ gui=bold

  highlight LineNrBelow
        \ guifg=#99C1FC
        \ gui=bold
endfunction

call LineNumberColors()


" ============================================================================
" 25. vim-which-key
" ============================================================================
"
" Al pulsar:
"
"       ,
"
" aparece el menú de atajos.
"
" Los grupos principales son:
"
"   ,b   Buffers
"   ,f   Files / búsqueda
"   ,l   LSP / CoC
"   ,s   Spell
"   ,t   Tabs / terminal
"
" Además se muestran los atajos individuales.
"

let g:which_key_map = {}

" ---------------------------------------------------------------------------
" Buffers
" ---------------------------------------------------------------------------
let g:which_key_map.b = {
      \ 'name' : '+buffers',
      \ 'd' : ['bd', 'delete buffer'],
      \ 'f' : ['Buffers', 'lista de buffers'],
      \ 'n' : ['bnext', 'siguiente buffer'],
      \ 'p' : ['bprevious', 'buffer anterior'],
      \ 'F' : ['bfirst', 'primer buffer'],
      \ 'l' : ['blast', 'último buffer'],
      \ }


" ---------------------------------------------------------------------------
" Files / búsqueda
" ---------------------------------------------------------------------------
let g:which_key_map.f = {
      \ 'name' : '+find',
      \ 'f' : ['Files', 'archivos'],
      \ 'g' : ['Rg', 'grep'],
      \ 'r' : ['FZFMru', 'archivos recientes'],
      \ 'v' : ['vimgrep /<C-r><C-w>/gj **/*', 'vimgrep'],
      \ }


" ---------------------------------------------------------------------------
" LSP / CoC
" ---------------------------------------------------------------------------
let g:which_key_map.l = {
      \ 'name' : '+lsp',
      \ 'f' : ['call CocAction("format")', 'formatear'],
      \ 'r' : ['<Plug>(coc-rename)', 'renombrar'],
      \ 'g' : {
      \   'name' : '+goto',
      \   'd' : ['<Plug>(coc-definition)', 'definición'],
      \   'y' : ['<Plug>(coc-type-definition)', 'definición de tipo'],
      \   'i' : ['<Plug>(coc-implementation)', 'implementación'],
      \   'r' : ['<Plug>(coc-references)', 'referencias'],
      \ },
      \ }


" ---------------------------------------------------------------------------
" Spell
" ---------------------------------------------------------------------------
let g:which_key_map.s = {
      \ 'name' : '+spell',
      \ 's' : ['setlocal spell!', 'activar/desactivar'],
      \ 'a' : ['zg', 'añadir palabra'],
      \ 'n' : [']s', 'siguiente error'],
      \ 'p' : ['[s', 'error anterior'],
      \ 'v' : ['source $MYVIMRC', 'recargar vimrc'],
      \ }


" ---------------------------------------------------------------------------
" Tabs + terminal
" ---------------------------------------------------------------------------
let g:which_key_map.t = {
      \ 'name' : '+tabs/terminal',
      \ 'c' : ['tabclose', 'cerrar pestaña'],
      \ 'e' : ['tabedit', 'abrir pestaña'],
      \ 'n' : ['tabnext', 'siguiente pestaña'],
      \ 'p' : ['tabprevious', 'pestaña anterior'],
      \ 'o' : ['tabonly', 'solo esta pestaña'],
      \ 't' : ['botright terminal', 'terminal'],
      \ }


" ---------------------------------------------------------------------------
" Atajos individuales
" ---------------------------------------------------------------------------
let g:which_key_map.n = ['NERDTreeToggle', 'explorador']
let g:which_key_map.w = ['write !sudo tee % >/dev/null', 'guardar como root']


" Registrar el mapa
call which_key#register(',', 'g:which_key_map')


" Mostrar Which-Key al pulsar Leader
nnoremap <silent> <leader>
      \ :<C-U>WhichKey ','<CR>

vnoremap <silent> <leader>
      \ :<C-U>WhichKeyVisual ','<CR>


" ============================================================================
" 26. CONFIGURACIÓN LOCAL OPCIONAL
" ============================================================================
if filereadable($HOME . '/.vimrc.local')
  execute 'source ' . fnameescape($HOME . '/.vimrc.local')
endif
