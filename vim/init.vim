set encoding=utf-8
set nocompatible

 set completeopt=menu,noinsert


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
Plug 'tpope/vim-sleuth'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'terryma/vim-multiple-cursors'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

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

" Autocomplete
Plug 'shawncplus/phpcomplete.vim'


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

" set autoindent
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set shiftwidth=4    " when reading, tabs are 4 spaces
set softtabstop=4   " in insert mode, tabs are 4 spaces
set nocindent

set clipboard=unnamed                   " Mac Clipboard
set backspace=indent,eol,start          " Backspace In Insert

set hlsearch                            " Highlight Search Results
set incsearch                           " Search Results While Typing
set history=1000                        " History Depth
set undolevels=100                      " Undo Depth

" set visualbell                          " No Sounds
set noerrorbells                        " No Sounds
set novb

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

au BufRead,BufNewFile *.css.php set filetype=css

" Disable CtrlP Caching
let g:ctrlp_user_command = 'ag %s -l -g  "" --ignore-dir=cached-copy/ --ignore-dir=plugins/ --ignore-dir=modules/ --ignore-dir=node_modules/ --ignore-dir=build/ --ignore-dir=public/ --ignore-dir=bin/ --ignore-dir=vendor/ --ignore-dir=error_logs/ --ignore-dir=scripts/ --ignore-dir=portal/ --ignore-dir=tracks/'
let g:ctrlp_working_path_mode = 'a'

" Trim White Space
autocmd BufWritePre * :%s/\s\+$//e

" Airline
" ===============================
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'
"let g:airline_theme = 'solarized'
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

" CtrlP
" ==================
let g:ctrlp_abbrev = {
    \ 'gmode': 't',
    \ 'abbrevs': [
        \ {
        \ 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ',
        \ 'expanded': '',
        \ 'mode': 'pfrz',
        \ },
        \ ]
    \ }

" deoplete
" ================
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0

" Colors
" =============
syntax on
set background=dark
colorscheme onedark

" Keybinds
" ===========================
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

nnoremap <leader>f <C-f>:call NoScrollAtEOF()<cr>
nnoremap <leader>d <C-b>

nnoremap <leader>q :q<CR>
nnoremap <leader>s  :Ag!<Space>
nnoremap <leader>w  :BD!<CR>

" Indents Don't Leave Visual Mode
vnoremap < <gv
vnoremap > >gv

" Split Switch Keybinds
if has('nvim')
  nmap <bs> <c-w>h
endif
" nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:multi_cursor_start_word_key      = '<C-j>'
let g:multi_cursor_next_key            = '<C-j>'


noremap <S-W> b
noremap ! ^

nnoremap d "_d
vnoremap d "_d

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
cnoreabbrev W w

" Functions
" =======================================================
function! StartUp() " Auto Run NerdTree If No File In Arg
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
