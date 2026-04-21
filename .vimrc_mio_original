" Lista de directorios a comprobar/crear
let s:dirs = [
      \ expand('~/.vim/autoload'),
      \ expand('~/.vim/colors'),
      \ expand('~/.vim/plugged'),
      \ expand('~/.vim/spell'),
      \ expand('~/.vim/undodir'),
      \ expand('~/.vim/view'),
      \ expand('~/.vim/viminfo'),
      \ expand('~/.vim/backups'),
      \ expand('~/.vim/vimswaps')
      \ ]

" Crear los directorios si no existen
for dir in s:dirs
  if !isdirectory(dir)
    call mkdir(dir, 'p')
  endif
endfor

let &rtp .= ',' . expand( '<sfile>:p:h' )
" * * * * * Plugins List* * * * *
"Plugin autoinstalling
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"
call plug#begin('~/.vim/plugged')
"
Plug 'liuchengxu/vim-which-key'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'dense-analysis/ale'
Plug 'frazrepo/vim-rainbow'
Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'elzr/vim-json'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'rhysd/vim-lsp-ale'
Plug 'SirVer/ultisnips'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
"Plug 'timothycrosley/isort'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'XadillaX/json-formatter.vim', { 'do': 'npm install -g jjson' }
Plug 'yegappan/mru'
" Terminal flotante
Plug 'voldikss/vim-floaterm'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'ap/vim-css-color'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-vinegar'
.vim/.vimrc
call plug#end()

runtime /usr/share/vim/vim91/pack/dist/opt/justify/plugin/justify.vim /usr/share/vim/vim91/macros/matchit.vim
runtime ftplugin/man.vim
runtime ftplugin/markdown.vim
runtime ftplugin/python.vim

" ALE fixers"
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_linters = {
                  \ 'python': ['flake8'],
                  \ 'javascript': ['eslint'],
                  \ 'typescript': ['eslint'],
                  \ 'json': ['jsonlint'],
                  \ 'rust': ['analyzer'],
                  \ 'java': ['checkstyle'],
                  \}

let g:ale_fixers = {
            \'*': [ 'remove_trailing_lines', 'trim_whitespace'],
            \ 'python': [ 'autoflake', 'black', 'isort', 'autoimport', 'yapf'],
            \'javascript': ['prettier', 'eslint', 'clang-format-all'],
            \'yaml': ['prettier', 'yamlfix'],
            \'typescript': ['prettier'],
            \'rust': ['rustfmt'],
            \'java': ['eslint', 'clang-format-all'],
            \'json': ['prettier', 'jq', 'clang-format'],
            \'markdown': ['markdownlint', 'prettier'],
            \'lua': ['stylua'],
            \'toml': ['taplo'],
            \}
let g:ale_lint_on_save = 1
let g:ale_sign_error ='Œ'
let g:ale_sign_warning = 'œ'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_disable_lsp = 1
let g:ale_completion_enabled=1
"fin vim-ale
"fzf-plugin
let g:fzf_vim ={}
" indentLines
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0
"" Plugin AirLine
"let g:airline_theme='durant'
let g:airline_detect_modified=1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline_powerline_fonts = 1
"usando el plugin vin-rainbow
let g:rainbow_active = 1
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
"usando los plugins de autocompletado
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"   CONFIGURACIONES Y OPCIONES   "
syntax on
filetype on
filetype plugin on
filetype indent on
colorscheme nightfly
hi Normal guibg=NONE ctermbg=NONE
packadd hlyank
set autochdir
set autoindent
set autoread
set backup
set writebackup
set backupdir=~/.vim/backups//
set directory=~/.vim/vimswaps//
set background=dark
set cc=80
set clipboard=unnamedplus
set cmdheight=2
set copyindent
set cursorline
set display+=lastline
set encoding=utf-8
set expandtab
set grepprg=rg\ --vimgrep\ $*
set helplang=es,en
set hidden
set history=500
set hlsearch
set ignorecase
set linebreak
set listchars=tab:\|>
set mouse=a
set nocompatible
set nomodeline
set nrformats=bin,octal,hex           " Los numerales serán tratados como decimales
set nowrap
set noswapfile
set nu rnu
def LineNumberColors()
      highlight LineNrAbove guifg=#51B3EC gui=bold
      highlight LineNr      guifg=white   gui=bold
      highlight LineNrBelow guifg=#99C1FC gui=bold  #99C1FC
enddef
call LineNumberColors()
set path=.,,**
set shiftround
set showmatch
hi MatchParen cterm=bold ctermfg=yellow
set smartcase
set smartindent
set smarttab
set softtabstop=4
set spelllang=en_us,es
set splitbelow
set splitright
set t_Co=256
set tabstop=4
set termguicolors
if has("persistent_undo")
    set undodir=~/.vim/undodir//
    set undofile
endif
set undolevels=10000
set viminfo='10,/10,h,<100,:100,%,n$HOME/.vim/viminfo/_viminfo
set visualbell
set wildcharm=<C-z>
"set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set wildmode=longest:list,full
let g:hlyank_duration = 500
" add useful stuff to title bar (file name, flags, cwd)
" based on @factorylabs
if has('title') && (has('gui_running') || &title)
      set titlestring=
    set titlestring+=%f
    set titlestring+=%h%m%r%w
    set titlestring+=\ -\ %{v:progname}
    set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}
endif

"********************************************************
" KEY-MAPPINGS
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
inoremap jk <esc>
nnoremap <leader>e :20Lex<CR>
nnoremap <F2> :noh<return><CR>
nnoremap <leader>qq :qa!<CR>
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
nnoremap <C-p> :Files<CR>  " Búsqueda de archivos con fzf
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>
nnoremap <F3> :call StripWhitespace()<CR>
nnoremap <F4> :call ToggleNumber()<CR>
nnoremap <F8> = :ALEFix<CR>
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
nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <Leader>w = :w !sudo tee > /dev/null %<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap <S-F12> :set guioptions +=m<CR>
nnoremap <S-F8> = :ALENextWrap<CR>
"nnoremap <silent><leader>t :bel term<CR>
vmap s S
vnoremap / /\v
"
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
"
"          Útiles para el plugin VIM-LSP
"
"********************************************************
" nmap <buffer> gd <plug>(lsp-definition)
" nmap <buffer> gs <plug>(lsp-document-symbol-search)
" nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
" nmap <buffer> gr <plug>(lsp-references)
" nmap <buffer> gi <plug>(lsp-implementation)
" nmap <buffer> gt <plug>(lsp-type-definition)
nmap <buffer> <leader>rn <plug>(lsp-rename)
" nmap <buffer> [g <plug>(lsp-previous-diagnostic)
" nmap <buffer> ]g <plug>(lsp-next-diagnostic)
" nmap <buffer> K <plug>(lsp-hover)
" nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
" nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
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
autocmd! FileType which_key
autocmd FileType which_key set laststatus=2 noshowmode noruler
                  \ | autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
" defining keybindings
let g:which_key_map = {}
let g:which_key_map['/'] = [ 'gc' , 'comment' ]
let g:which_key_map['.'] = [ ':e $MYVIMRC' , 'open init' ]
let g:which_key_map['='] = [ '<C-W>=' , 'balance windows' ]
let g:which_key_map['h'] = [ '<C-W>s' , 'split below']
let g:which_key_map['p'] = [ ':Files' , 'search files' ]
let g:which_key_map['v'] = [ '<C-W>v' , 'split right']
let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'd' : ['bdelete' , 'borar buffer'],
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
let g:which_key_map.t = {
      \ 'name' : '+Terminal Flotante' ,
      \ 'n' : ['FloatermNew' , 'Abre terminal'],
      \ 's' : ['FloatermShow' , 'Muetra Terminal'],
      \ 'h' : ['FloaterHide' , 'Oculta Terminal'],
      \ 't' : ['FloatermToggle' , 'Muestra/Oculta Terminal'],
      \ }

" SECCIÓN DE AUTOCOMANDOS
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
augroup configgroup
    autocmd!
    autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
    autocmd BufEnter * :AirlineRefresh
    autocmd BufWrite * :lcd %:p:h
    autocmd BufWritePre *.cpp,*.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call StripWhitespace()
    autocmd FileType text setlocal wrap paste spell
    autocmd FileType python setlocal tabstop=5 shiftwidth=4 commentstring=#\ %s makeprg=python3\ -u
    autocmd FileType javascript,jason setlocal tabstop=2 shiftwidth=2
    autocmd FileType markdown setlocal wrap linebreak
    autocmd FileType python map <buffer> <F9> :make %<CR>
augroup END
autocmd BufNewFile,BufRead *.txt set filetype=text

" Source vim configuration file whenever it is saved
if has('autocmd') " ignore this section if your vim does not support autocommands
    augroup reload_vimrc
        autocmd!
        autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
    augroup END
endif
"********************************************************
augroup lsp_install
   au!
   " call s:on_lsp_buffer_enabled (set the lsp shortcuts) when an lsp server
   " is registered for a buffer.
   autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END
"
""********************************************************
" --- Autocomandos ---
augroup EjecucionRapida
    autocmd!
    " Mapear F5 para ejecutar
    autocmd FileType python,lua,javascript nnoremap <buffer> <F5> :call EjecutarArchivo()<CR>
augroup END
" FUNCIONES
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
" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
                \   '%d⨉ %d⚠ ',
                \   all_non_errors,
                \   all_errors
                \)
endfunction
" --- Strip trailing whitespace ---
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
" copied (almost) directly from the vim-lsp docs:
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction
