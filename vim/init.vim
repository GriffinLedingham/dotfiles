set encoding=utf-8
set nocompatible

" Plugged
" ===============================
call plug#begin('~/.vim/plugged')

" System
Plug 'rking/ag.vim', {'on': 'Ag'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'bling/vim-airline'
Plug 'benekastah/neomake'
Plug 'sickill/vim-pasta'
Plug 'qpkorr/vim-bufkill'
Plug 'tpope/vim-fugitive'

" GUI
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'

" Explorers
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" Syntax
Plug 'othree/html5.vim', {'for': ['html']}
Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html']}
Plug 'pangloss/vim-javascript', {'for': ['javascript']}
Plug 'StanAngeloff/php.vim', {'for': ['php']}
Plug '2072/PHP-Indenting-for-VIm', {'for': ['php']}

call plug#end()

" General
" =================
let mapleader = " "
let g:mapleader = " "

set number                              " Show Line Numbers
set hidden                              " Allow background buffers
set autoread				                  	" Reload Files Automatically
set nowrap                              " No Line Wrap
set showmatch                           " Bracket Matching

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set clipboard=unnamed                   " Mac Clipboard
set backspace=indent,eol,start          " Backspace In Insert

set hlsearch                            " Highlight Search Results
set incsearch                           " Search Results While Typing
set history=1000                        " History Depth
set undolevels=100                      " Undo Depth

set visualbell                          " No Sounds
set noerrorbells                        " No Sounds

set noswapfile											  	" No Swap File
set nobackup                            " No Backup
set nowritebackup                       " No Write Backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set wildmode=longest:full               " Bash Style Autocompletes
set wildmenu

set relativenumber

" Regexes On /
nnoremap \ /\v
vnoremap \ /\v

" Disable CtrlP Caching
let g:ctrlp_user_command = 'ag %s -l -g  "" --ignore-dir=cached-copy/ --ignore-dir=plugins/ --ignore-dir=modules/ --ignore-dir=node_modules/ --ignore-dir=build/ --ignore-dir=public/ --ignore-dir=bin/ --ignore=dir=vendor/ --ignore-dir=error_logs/'

" Trim White Space
autocmd BufWritePre * :%s/\s\+$//e

" Airline
" ===============================
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#enable#branch = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1

" PHP
" =================
:let g:PHP_outdentphpescape = 0

" Ag
" ==================
let g:ag_highlight=1

" Colors
" =============
color   monokai
syntax  enable
set     background=dark

" Keybinds
" ===========================
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader><Tab> :CtrlPBuffer<CR>

nnoremap <leader>f <C-f>:call NoScrollAtEOF()<cr>
nnoremap <leader>d <C-b>

nnoremap <leader>q :q<CR>
nnoremap <leader>s  :Ag!<Space>
nnoremap <leader>w  :BD<CR>

" Indents Don't Leave Visual Mode
vnoremap < <gv
vnoremap > >gv

" Split Switch Keybinds
if has('nvim')
  nmap <bs> <c-w>h
endif
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <S-w> b
nnoremap ! ^

nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

nnoremap <C-]> :vsp<CR>
nnoremap <leader>] :vsp<CR>

" Git keybinds
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>

" Buffer
nnoremap <leader>n :enew<CR>

nnoremap <leader>\ :NERDTreeToggle<CR>

" Make <C-f> Only Scroll To Last Line of File At Bottom Of Buffer
" (Prevents overscroll, when next-page'ing, but not conciously aiming for bottom of file)
function! NoScrollAtEOF()
  if get(getpos('.'), 1, -1) + winheight(0) >= line('$')
    normal! ggG
  endif
endfunction
nnoremap <c-f> <c-f>:call NoScrollAtEOF()<cr>

" Commands
" ===============================================
" Don't close vsp on :bd using Bufkil plugin
cnoreabbrev bd BD
" Close all buffers on :q
cnoreabbrev q qa
cnoreabbrev nt NERDTree

" Functions
" =======================================================
function! StartUp() " Auto Run NerdTree If No File In Arg
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()
