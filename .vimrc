set noswapfile
let mapleader = ";"
set autoread
set autowriteall
:au FocusLost * :wa

" no wraps
set nowrap

set scrolloff=3

" Searching
set hlsearch
set incsearch

set cursorline

"remove right-hand scroll bar
set guioptions-=r

set laststatus=2
set lazyredraw

nmap Y y$
nmap <space> zz
nnoremap <esc> :noh<return><esc>

nnoremap j gj
nnoremap k gk
map <D-j> gT
map <D-k> gt

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
noremap <C-l> <C-w>l

inoremap jk <Esc>
nnoremap JJJJ <Nop>
