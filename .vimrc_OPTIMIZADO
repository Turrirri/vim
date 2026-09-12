" ============================================================================
" 📁 DIRECTORIOS
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

" ============================================================================
" 📦 VIM-PLUG SETUP
" ============================================================================
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" General & UI
Plug 'severin-lemaignan/vim-minimap'
Plug 'liuchengxu/vim-which-key'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frazrepo/vim-rainbow'
Plug 'ap/vim-css-color'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-vinegar'
Plug 'Yggdroot/indentLine'
Plug 'bluz71/vim-nightfly-guicolors'

" File Explorer & Navigation
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yegappan/mru'
if !has('nvim')
    Plug 'rhysd/vim-healthcheck'
endif

" LSP (COC)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Syntax / Languages
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript','typescript'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript','typescript'] }
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'tbastos/vim-lua', { 'for': 'lua' }

call plug#end()

" ============================================================================
" ⚙️ BASICS & CONFIGURACIÓN
" ============================================================================
let mapleader = " "

set encoding=utf-8
filetype plugin indent on
syntax on
set runtimepath+=~/.vim/spell

set number relativenumber
set cursorline
set hidden
set linebreak
set scrolloff=8 sidescrolloff=8
set nowrap
set textwidth=0
set wrapmargin=0

set clipboard=unnamedplus
set mouse=a

set ignorecase smartcase
set incsearch hlsearch

set updatetime=200
set timeoutlen=400

set signcolumn=yes
set termguicolors
set display+=lastline

set backup
set writebackup
set backupdir=~/.vim/backups//
set directory=~/.vim/vimswaps//
if has("persistent_undo")
    set undodir=~/.vim/undodir//
    set undofile
endif
set viminfo='10,/10,h,<100,:100,%,n$HOME/.vim/viminfo/_viminfo

set grepprg=rg\ --vimgrep\ $*
set path=.,,**
set wildmenu
set autochdir

set tabstop=4 shiftwidth=4 expandtab
set spelllang=en,es

if has('title') && (has('gui_running') || &title)
    set titlestring=%f%h%m%r%w\ -\ %{v:progname}\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif

" ============================================================================
" 🎨 APARIENCIA & UI
" ============================================================================
colorscheme nightfly
set background=dark
hi Normal guibg=NONE ctermbg=NONE
hi MatchParen cterm=bold ctermfg=yellow

let g:minimap_highlight = 'Visual'
let g:airline_detect_modified = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:rainbow_active = 1
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

let g:indentLine_char_list = ['┊', '¦', '┆', '│']
let g:indentLine_setColors = 0

def LineNumberColors()
      highlight LineNrAbove guifg=#51B3EC gui=bold
      highlight LineNr      guifg=white   gui=bold
      highlight LineNrBelow guifg=#99C1FC gui=bold
enddef
call LineNumberColors()

" ============================================================================
" ⌨️ MAPEOS BÁSICOS
" ============================================================================
inoremap jk <esc>

" Navegación y Centrado
nnoremap gl $
nnoremap gh ^
nnoremap # #zz
nnoremap * *zz
nnoremap g# g#zz
nnoremap g* g*zz
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap j gj
nnoremap k gk
nnoremap gc BBE
vnoremap / /\v

" Accesos directos rápidos
nnoremap ; :Buffers<CR>
nnoremap <silent><F2> :noh<CR>
nnoremap <C-s> :w<CR>
nnoremap <F10> :call StripTrailingWhitespaces()<CR>

" Mover ventanas
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Redimensionar ventanas
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" Mover líneas arriba/abajo
nmap <M-Down> :m .+1<CR>
nmap <M-Up> :m .-2<CR>
vmap <M-Down> :m '>+1<CR>
vmap <M-Up> :m '<-2<CR>

" COC Autocompletado con <Tab>
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <S-TAB>
      \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" ============================================================================
" 🔑 WHICH-KEY CONFIGURATION (Espacio / Leader)
" ============================================================================
let g:which_key_map = {}

" Estructura de grupos
let g:which_key_map.b = {
      \ 'name' : '+buffer',
      \ 'd' : ['bdelete',     'borrar buffer'],
      \ 'f' : ['bfirst',      'primer buffer'],
      \ 'l' : ['blast',       'último buffer'],
      \ 'n' : ['bnext',       'siguiente buffer'],
      \ 'p' : ['bprevious',   'anterior buffer'],
      \ '?' : ['Buffers',     'buscar buffers (fzf)'],
      \ }

let g:which_key_map.f = {
      \ 'name' : '+file/find',
      \ 'f' : ['Files',       'buscar archivos'],
      \ 'g' : ['Rg',          'live grep'],
      \ 'b' : ['Buffers',     'buffers abiertos'],
      \ 'r' : ['FZFMru',      'archivos recientes'],
      \ 'v' : ['vimgrep',     'vimgrep'],
      \ }

let g:which_key_map.l = {
      \ 'name' : '+lsp/coc',
      \ 'd' : ['<Plug>(coc-definition)',     'ir a definición'],
      \ 't' : ['<Plug>(coc-type-definition)','definición de tipo'],
      \ 'i' : ['<Plug>(coc-implementation)', 'implementación'],
      \ 'r' : ['<Plug>(coc-references)',     'referencias'],
      \ 'n' : ['<Plug>(coc-rename)',         'renombrar variable'],
      \ 'f' : ['call CocAction("format")',  'formatear código'],
      \ 'k' : ['call ShowDocumentation()',   'mostrar documentación'],
      \ }

let g:which_key_map.q = {
      \ 'name' : '+quit/session',
      \ 'q' : ['qa!',         'salir sin guardar'],
      \ 's' : ['wqa!',         'guardar y salir'],
      \ }

let g:which_key_map.s = {
      \ 'name': '+spell',
      \ 's': ['set spell!',  'alternar ortografía'],
      \ 'n': [']s',          'siguiente error'],
      \ 'p': ['[s',          'error anterior'],
      \ 'a': ['zg',          'añadir palabra'],
      \ }

let g:which_key_map.t = {
      \ 'name' : '+tabs/terminal',
      \ 'c' : ['tabclose',   'cerrar pestaña'],
      \ 'e' : ['tabedit',    'nueva pestaña'],
      \ 'n' : ['tabNext',    'siguiente pestaña'],
      \ 'o' : ['tabonly',    'cerrar las demás'],
      \ 'p' : ['tabprev',    'pestaña anterior'],
      \ 't' : ['bel term',   'abrir terminal abajo'],
      \ }

" Accesos directos individuales en Leader
let g:which_key_map.n = ['NERDTreeToggle',                     'árbol de archivos']
let g:which_key_map.w = ['w !sudo tee > /dev/null %',          'guardar como sudo']

" Registrar which-key
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>

" ============================================================================
" 🛠️ AUTOCMD & FUNCIONES
" ============================================================================
augroup lang_settings
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType javascript,typescript,yaml,lua setlocal tabstop=2 shiftwidth=2 expandtab
  autocmd FileType text,markdown setlocal wrap linebreak textwidth=80 formatoptions+=ta
augroup END

augroup auto_format
  autocmd!
  autocmd BufWritePre *.py,*.js,*.lua silent! call CocAction('format')
augroup END

augroup vim_ui_events
  autocmd!
  autocmd BufEnter * :AirlineRefresh
  autocmd BufWrite * :lcd %:p:h
augroup END

augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC,$MYGVIMRC nested source %
augroup END

augroup EjecucionRapida
  autocmd!
  autocmd FileType python,lua,javascript nnoremap <buffer> <F5> :call EjecutarArchivo()<CR>
augroup END

" Documentación COC
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Limpieza de espacios al final de línea
function! StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" Ejecutar código en ventana flotante o split
function! EjecutarArchivo()
    silent! write
    let l:file_type = &filetype
    let l:file_name = expand('%:p')
    let l:cmd = ''
    if l:file_type == 'python'
        let l:cmd = 'python3 ' . l:file_name
    elseif l:file_type == 'lua'
        let l:cmd = 'lua ' . l:file_name
    elseif l:file_type == 'javascript'
        let l:cmd = 'node ' . l:file_name
    else
        echo "Tipo de archivo no soportado"
        return
    endif

    let l:width = float2nr(&columns * 0.8)
    let l:height = float2nr(&lines * 0.8)
    let l:row = float2nr((&lines - l:height) / 2)
    let l:col = float2nr((&columns - l:width) / 2)

    if has('nvim')
        let l:opts = {
            \ 'relative': 'editor',
            \ 'row': l:row,
            \ 'col': l:col,
            \ 'width': l:width,
            \ 'height': l:height,
            \ 'style': 'minimal',
            \ 'border': 'rounded'
            \ }
        let l:buf = nvim_create_buf(v:false, v:true)
        call nvim_open_win(l:buf, v:true, l:opts)
        execute 'terminal ' . l:cmd
        startinsert
        nnoremap <buffer> q :q<CR>
    else
        execute 'botright terminal ++shell ' . l:cmd
    endif
endfunction
