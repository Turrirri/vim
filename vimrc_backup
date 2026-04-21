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
Plug 'XadillaX/json-formatter.vim', { 'do': 'npm install -g jjson' }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'frazrepo/vim-rainbow'
Plug 'github/copilot.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'rafi/awesome-vim-colorschemes'
"Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'timothycrosley/isort'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-scripts/indentpython.vim'
Plug 'yegappan/mru'

call plug#end()


runtime /usr/share/vim/vim91/pack/dist/opt/justify/plugin/justify.vim /usr/share/vim/vim91/macros/matchit.vim

runtime ftplugin/man.vim
runtime ftplugin/markdown.vim
runtime ftplugin/python.vim


" ALE fixers"
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_fixers = {
            \'*': [ 'remove_trailing_lines', 'trim_whitespace'],
            \ 'python': [ 'autoflake', 'black', 'isort', 'autoimport', 'yapf'],
            \'javascript': ['eslint'],
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
let g:airline_detect_modified=1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline_powerline_fonts = 1

"usando el plugin vin-rainbow
let g:rainbow_active = 1
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" usando el plugin COC (deprecated)
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif

" copied (almost) directly from the vim-lsp docs:
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled (set the lsp shortcuts) when an lsp server
    " is registered for a buffer.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"********************************************************

"   CONFIGURACIONES  "

colorscheme challenger_deep
set autochdir
set autoindent
set autoread
set background=dark
set backup
set backupdir=~/.vim/backups
set cc=80
set clipboard=unnamedplus
set cmdheight=2
set complete-=i
set copyindent
set cursorline
set directory=~/.vim/vimswaps
set display+=lastline
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
set nomodeline nrformats=           " Los numerales serán tratados como decimales
set nu rnu
set path+=**
set shiftround
set shiftwidth=6
set smartcase
set smartindent
set smarttab
set softtabstop=4
set spelllang=en_us,es
set t_Co=256
set tabstop=4
set termguicolors
set undodir=~/.vim/undo
set undofile
set undolevels=10000
set viminfo='10,/10,h,<100,:100,%,n$HOME/.vim/viminfo/_viminfo
set visualbell
set wildcharm=<C-z>
set wildmode=longest:list,full

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

let mapleader = " "
inoremap jk <esc>
map <silent> <F5> :20Lex<CR>
nmap <Leader>f = :vimgrep<space>
nmap <Leader>w = :w !sudo tee > /dev/null %<CR>
nnoremap <silent> <Esc> :noh<CR>
nnoremap # #zz
nnoremap * *zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <Leader>b :buffer <C-z><S-Tab>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-h> = <C-w>h
nnoremap <silent> <C-j> = <C-w>j
nnoremap <silent> <C-k> = <C-w>k
nnoremap <silent> <C-l> = <C-w>l
nnoremap <silent> <F4> :call ToggleNumber()<cr>
nnoremap <silent> <F2> :belowright terminal<CR>
nnoremap <silent> <F3> :call StripWhitespace()<cr>
nnoremap <silent> <F6> = :Mru<CR>
nnoremap <silent> <F7> :bel term<CR>
nnoremap <silent> <F8> = :ALEFix<CR>
nnoremap <silent> <Leader>u :UndotreeToggle<CR>
nnoremap <silent> <S-F11> :set guioptions +=m<CR>
nnoremap <silent> <S-F8> = :ALENextWrap<CR>
nnoremap <silent> tc = :tabclose<CR>
nnoremap <silent> tn = :tabNext<CR>
nnoremap <silent> to = :tabonly<CR>
nnoremap <silent> tp = :tabprev<CR>
nnoremap N Nzz
nnoremap g# g#zz
nnoremap g* g*zz
nnoremap gc BBE
nnoremap j gj
nnoremap k gk
nnoremap n nzz
nnoremap te = :tabedit<space>
noremap {B :bfirst<CR>
noremap {b :bprev<CR>
noremap }B :blast<CR>
noremap }b :bnext<CR>
vmap s S    "Útil para el vim-surround
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


" SECCIÓN DE AUTOCOMANDOS

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

augroup configgroup
    autocmd!
    "autocmd BufEnter Makefile setlocal noexpandtab
    "autocmd BufEnter *.h *.c *.cpp setlocal shiftwidth=2 softtabstop=2 tabstop=2
    "autocmd BufEnter *.zsh‐theme setlocal filetype=zsh
    autocmd BufEnter * :AirlineRefresh
    autocmd BufWrite * :lcd %:p:h
    autocmd BufWritePost * :nohlsearch
    autocmd BufWritePre *.cpp,*.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call StripWhitespace()
    "autocmd BufWritePre *.py :%s/\s\+$//e
    "autocmd FileType java setlocal formatprg=par\ ‐w80\ ‐T4 nolist listchars=tab:+\ ,eol:‐ noexpandtab
    "autocmd FileType php setlocal expandtab formatprg=par\ ‐w80\ ‐T4 list listchars=tab:+\ ,eol:‐
    "autocmd FileType python setlocal commentstring=#\ %s
    "autocmd FileType python setlocal makeprg=python3\ -u
    "autocmd FileType python map <buffer> <F9> :make %<CR>
    "autocmd FileType c,cpp,java set mps+==:;
    "autocmd FileType cpp setlocal tabstop=2 softtabstop=2 shiftwidth=2
    "autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
    "autocmd FileType ruby setlocal commentstring=#\ %s shiftwidth=2 softtabstop=2 tabstop=2
    autocmd VimEnter * highlight clear SignColumn Vau VimEnter * RainbowParenthesesToggle
    "autocmd BufNewFile,BufRead pyyhon setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
    "autocmd BufNewFile,BufRead *.js, *.html, *.css setlocal tabstop=2 softtabstop=2 set shiftwidth=2
augroup END

" Source vim configuration file whenever it is saved
if has('autocmd') " ignore this section if your vim does not support autocommands
    augroup reload_vimrc
        autocmd!
        autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
    augroup END
endif

"********************************************************

" FUNCIONES

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
