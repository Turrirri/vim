" Revisar existecia de directorios:
" Definir los directorios que quieres asegurar
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

" Iterar sobre la lista y crearlos si no existen
for dir in s:vim_dirs
    if !isdirectory(dir)
        call mkdir(dir, 'p', 0700)
    endif
endfor

"
"" instalar vim-plug si no existe, para el manejo de los plugins

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Luego de ejecutar vim por primera vez, ejecutar dentro de vim:
"
" :CocInstall coc-pyright coc-tsserver coc-json coc-yaml coc-lua coc-sh
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ========================
" ⚙️ BASICS
" ========================
set encoding=utf-8
set nocompatible

filetype plugin indent on
syntax on
set runtimepath+=~/.vim/spell

set number relativenumber
set cursorline
set hidden
set linebreak
set scrolloff=8 sidescrolloff=8

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
set grepprg=rg\ --vimgrep\ $*
set path=.,,**
set wildmenu
hi MatchParen cterm=bold ctermfg=yellow
if has("persistent_undo")
    set undodir=~/.vim/undodir//
    set undofile
endif
set viminfo='10,/10,h,<100,:100,%,n$HOME/.vim/viminfo/_viminfo
set autochdir
set grepprg=rg\ --vimgrep\ $*
nnoremap <leader>qq :qa!<CR>
nnoremap <leader>qs :wq!<CR>
" add useful stuff to title bar (file name, flags, cwd)
" based on @factorylabs
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%f
    set titlestring+=%h%m%r%w
    set titlestring+=\ -\ %{v:progname}
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif
set nowrap
set textwidth=0
set wrapmargin=0


" Tabs fallback
set tabstop=4 shiftwidth=4 expandtab

" Leader
let mapleader=" "

" ========================
" 🌍 SPELL (EN + ES)
" ========================
"set spell
set spelllang=en,es

nnoremap <leader>ss :set spell!<CR>
nnoremap <leader>sn ]s
nnoremap <leader>sp [s
nnoremap <leader>sa zg

" ========================
" 📦 PLUGINS (lazy-ish)
" ========================
call plug#begin('~/.vim/plugged')

" Mini MAP
Plug 'severin-lemaignan/vim-minimap'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" which-key
Plug 'liuchengxu/vim-which-key'

" File explorer (lazy)
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
if !has('nvim')
    Plug 'rhysd/vim-healthcheck'
endif
" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frazrepo/vim-rainbow'
Plug 'ap/vim-css-color'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-vinegar'
Plug 'Yggdroot/indentLine'

" Git
"Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'yegappan/mru'

" Languages
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript','typescript'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript','typescript'] }
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'tbastos/vim-lua', { 'for': 'lua' }
Plug 'bluz71/vim-nightfly-guicolors'

call plug#end()

" ========================
" 🎨 UI
" ========================
colorscheme nightfly
set background=dark
hi Normal guibg=NONE ctermbg=NONE
packadd hlyank

" MiniMAP
let g:minimap_highlight='Visual'

" ========================
" Plugin AirLine
" ========================
let g:airline_detect_modified=1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='jellybeans'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline_powerline_fonts = 1
"usando el plugin vin-rainbow
let g:rainbow_active = 1
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" ========================
" KEY MAPPINGS
" ========================
inoremap jk <esc>
nnoremap <leader>qq :qa!<CR>
nnoremap ; :Buffers<CR>
nnoremap gl $
nnoremap gh ^
nnoremap <leader>qs :wq!<CR>
nnoremap # #zz
nnoremap * *zz
nnoremap <C-h> = <C-w>h
nnoremap <C-j> = <C-w>j
nnoremap <C-k> = <C-w>k
nnoremap <C-l> = <C-w>l
nnoremap <C-s> = :w<CR>
nnoremap <C-d> = <C-d>zz
nnoremap <C-u> = <C-u>zz
nnoremap <C-f> = <C-f>zz
nnoremap <C-b> = <C-b>zz
nnoremap <silent><F2> :noh<CR>
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>
nnoremap g# g#zz
nnoremap g* g*zz
nnoremap gc BBE
nnoremap j gj
nnoremap k gk
nnoremap <Leader>fv :vimgrep<space>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>te :tabedit<space>
nnoremap <Leader>tn :tabNext<CR>
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>tp :tabprev<CR>
nnoremap <Leader>tt :bel term<CR>
nnoremap <Leader>w = :w !sudo tee > /dev/null %<CR>
nnoremap n nzz
nnoremap N Nzz
vmap s S
vnoremap / /\v
"********************************************************
"
"           MOVING LINES UP AND DOWN
"
"********************************************************
nmap <M-Down> :m .+1<CR>
vmap <M-Down> :m '>+1<CR>
vmap <M-Up> :m '<-2<CR>
nmap <M-Up> :m .-2<CR>
"********************************************************
let g:indentLine_char_list = ['┊', '¦', '┆', '│']
let g:indentLine_setColors = 0

" ========================
" 🔑 WHICH-KEY CONFIG
" ========================
let g:which_key_map = {}

let g:which_key_map.f = {
      \ 'name' : '+file',
      \ 'f' : ['Files', 'find files'],
      \ 'g' : ['Rg', 'live grep'],
      \ 'b' : ['Buffers', 'buffers'],
      \ 'r' : ['FZFMru' , 'Recent Files'],
      \ }

let g:which_key_map.g = {
      \ 'name' : '+git',
      \ 's' : ['Gstatus', 'status'],
      \ 'c' : ['Gcommit', 'commit'],
      \ 'p' : ['Gpush', 'push']
      \ }

let g:which_key_map.l = {
      \ 'name' : '+lsp',
      \ 'd' : ['call CocAction("definition")', 'definition'],
      \ 'r' : ['<Plug>(coc-rename)', 'rename'],
      \ 'f' : ['call CocAction("format")', 'format']
      \ }


let g:which_key_map.n = ['NERDTreeToggle', 'file tree']
let g:which_key_map.s = {
      \ 'name': '+spell',
      \ 's': ['set spell!', 'toggle'],
      \ 'n': [']s', 'next'],
      \ 'p': ['[s', 'prev'],
      \ 'a': ['zg', 'add word']
      \ }

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : ['bdelete' , 'borrar buffer'],
      \ 'f' : ['bfirst' , 'first-buffer'],
      \ 'l' : ['blast' , 'last buffer'],
      \ 'n' : ['bnext' , 'next-buffer'],
      \ 'p' : ['bprevious' , 'previous-buffer'],
      \ '?' : ['Buffers' , 'fzf-buffer'],
      \ }

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" ========================
" 🔍 FZF
" ========================
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>

" ========================
" 📁 NERDTREE
" ========================
nnoremap <leader>n :NERDTreeToggle<CR>

" ========================
" ⚡ COC (LSP)
" ========================
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"

inoremap <silent><expr> <S-TAB>
      \ coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <leader>lf :call CocAction('format')<CR>

" ========================
" 🧠 LANGUAGE SETTINGS
" ========================
augroup lang_settings
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
  autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
  autocmd FileType lua setlocal tabstop=2 shiftwidth=2
augroup END

" Configuración específica para archivos de texto plano y Markdown
augroup TextWrap
  autocmd!
  autocmd FileType text,markdown setlocal wrap linebreak | setlocal colorcolumn=80
augroup END

" ========================
" 🧹 AUTOFORMAT
" ========================
autocmd BufWritePre *.py silent! call CocAction('format')
autocmd BufWritePre *.js silent! call CocAction('format')
autocmd BufWritePre *.lua silent! call CocAction('format')
autocmd BufEnter * :AirlineRefresh
autocmd BufWrite * :lcd %:p:h
" Source vim configuration file whenever it is saved
if has('autocmd') " ignore this section if your vim does not support autocommands
    augroup reload_vimrc
        autocmd!
        autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
    augroup END
endif

" ========================
" 🔒 LOCAL CONFIG
" ========================
if filereadable($HOME . '/.vimrc.local')
  source ~/.vimrc.local
endif
augroup EjecucionRapida
    autocmd!
    " Mapear F5 para ejecutar
    autocmd FileType python,lua,javascript nnoremap <buffer> <F5> :call EjecutarArchivo()<CR>
augroup END

" --- Función para ejecutar código en terminal flotante ---
function! EjecutarArchivo()
    " Guardar el archivo automáticamente antes de ejecutar
    silent! write
    let l:file_type = &filetype
    let l:file_name = expand('%:p')
    let l:cmd = ''
    " Definir el comando según el lenguaje
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
    " Configuración de dimensiones de la ventana (80% del editor)
    let l:width = float2nr(&columns * 0.8)
    let l:height = float2nr(&lines * 0.8)
    let l:row = float2nr((&lines - l:height) / 2)
    let l:col = float2nr((&columns - l:width) / 2)
    if has('nvim')
        " Configuración específica para Neovim (Ventana flotante)
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
        " Ejecutar y mapear cierre rápido en la terminal
        execute 'terminal ' . l:cmd
        startinsert " Entrar en modo insertar automáticamente
        " Mapeo local para cerrar la ventana con 'q' cuando termine el proceso
        nnoremap <buffer> q :q<CR>
    else
        " Alternativa para Vim clásico (Terminal en split inferior)
        execute 'botright terminal ++shell ' . l:cmd
    endif
endfunction

def LineNumberColors()
      highlight LineNrAbove guifg=#51B3EC gui=bold
      highlight LineNr      guifg=white   gui=bold
      highlight LineNrBelow guifg=#99C1FC gui=bold  #99C1FC
enddef
call LineNumberColors()

" Usar <Tab> para navegar el autocompletado
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
    let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Ir a definición, implementación o referencias
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Mostrar documentación con K
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" --- Función para eliminar trailing whitespaces ---
function! StripTrailingWhitespaces()
    " Preparación: guardar posición actual del cursor y la búsqueda
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Ejecutar la sustitución: eliminar espacios al final de línea
    %s/\s\+$//e
    " Restaurar posición anterior y la búsqueda
    let @/=_s
    call cursor(l, c)
endfunction

" --- Asociar la función a la tecla F10 (en modo Normal) ---
nnoremap <F10> :call StripTrailingWhitespaces()<CR>
