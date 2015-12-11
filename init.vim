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

" GUI
Plug 'ervandew/supertab'

" Explorers
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" Syntax
Plug 'othree/html5.vim', {'for': ['html']}
Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html']}
Plug 'pangloss/vim-javascript', {'for': ['javascript']}
Plug 'StanAngeloff/php.vim', {'for': ['php']}

call plug#end()

" General
" =================
let mapleader = " "
let g:mapleader = " "

set number                              " Show Line Numbers
set virtualedit=all                     " Always Navigate Like Virtual Mode
set hidden                              " Allow background buffers
set autoread                    	" Reload Files Automatically
set nowrap                              " No Line Wrap
set showmatch                           " Bracket Matching

set clipboard=unnamed                   " Mac Clipboard
set backspace=indent,eol,start          " Backspace In Insert

set hlsearch                            " Highlight Search Results
set incsearch                           " Search Results While Typing
set history=1000                        " History Depth
set undolevels=100                      " Undo Depth

set visualbell                          " No Sounds
set noerrorbells                        " No Sounds

set noswapfile 				" No Swap File
set nobackup                            " No Backup
set nowritebackup                       " No Write Backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set wildmode=longest:full               " Bash Style Autocompletes
set wildmenu

" Regexes On /
nnoremap \ /\v
vnoremap \ /\v

" Disable CtrlP Caching
let g:ctrlp_user_command = 'ag %s -l -g  "" --ignore-dir=plugins/ --ignore-dir=modules/ --ignore-dir=node_modules/'

" Trim White Space
autocmd BufWritePre * :%s/\s\+$//e

" NeoMake
" ======================================
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers=['eslint']

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
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>d :CtrlPBuffer<CR>

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

" Git keybinds
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>

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

" Functions
" =======================================================
function! StartUp() " Auto Run NerdTree If No File In Arg
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()
