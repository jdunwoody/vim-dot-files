set nocompatible               " be iMproved
filetype off                   " required!
"filetype plugin on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'scrooloose/nerdcommenter.git'

Bundle 'ack.vim'
Bundle 'surround.vim'
Bundle 'SuperTab'
Bundle 'EasyMotion'
Bundle 'endwise.vim'
"Bundle 'indent-object'
Bundle 'Syntastic'
Bundle 'matchit.zip'
Bundle 'nerdcommenter'
Bundle 'repeat.vim'
Bundle 'fugitive.vim'
Bundle 'vim-coffee-script'
Bundle 'Auto-Pairs'
"Bundle 'indentruby.vim'

"Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree.git'
Bundle 'flazz/vim-colorschemes.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'jeetsukumaran/vim-buffergator.git'
Bundle 'Tabular'
"Bundle 'vim-scripts/copypath.vim.git'


"Bundle 'vim-scripts/copypath'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'

" non github repos

" git repos on your local machine (ie. when working on your own plugin)


filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

let mapleader = ";"
colorscheme jellybeans

" line number
set nu

" tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" no wraps
set nowrap

set scrolloff=3

" Searching
set hlsearch
set incsearch

set cursorline

"remove right-hand scroll bar
set guioptions-=r

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
set lazyredraw

nmap Y y$
nmap <space> zz
nnoremap <esc> :noh<return><esc>
map <leader>e :NERDTreeToggle<cr>
map <leader>f :NERDTreeFind<cr>
let g:NERDTreeWinSize = 40

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

" CtrlP
nmap <D-t> :CtrlP<cr>
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_max_height = 20
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 2
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40

set wildignore+=vendor/gems/*,tmp/*,coverage/*,public/*,spec/javascripts/generated/*,db/bootstrap/*,vendor/gems/
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*.json,*.pdf,*.epub,*.ipa,*.jpeg,*.jpg,*.log,*.cache

" Save on focus lost
au FocusLost * :wa

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Open the next item and keeping the focus in the quickfix window
autocmd BufWinEnter quickfix noremap <buffer> j :cn<CR><C-w><C-p>

" Open the previous item keeping the focus in the quickfix window
autocmd BufWinEnter quickfix noremap <buffer> k :cp<CR><C-w><C-p>

" Ignore the enter key
autocmd BufWinEnter quickfix noremap <buffer> <Enter> <Nop>

au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" For local replace
nnoremap gr gd[{V%:s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

nnoremap <M-j> :m .+1<CR>== nnoremap <C-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

nmap <leader>r ggVG=

nmap <silent> <leader>ul :t.<CR>Vr=

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q


" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

set clipboard=unnamed

"au BufNew *.rb 0r ~/.vim/ruby.skel
au BufNewFile *.rb 0r ~/ruby.skel

command Pry :normal A<CR>binding.pry
nmap <leader>pry :Pry<CR>==

nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:/l0 \zs<CR>
vmap <Leader>a: :Tabularize /:/l0 \zs<CR>

"nmap <Leader>> :%s/:\(\w*\) .*=>/\1: /gc
"vmap <Leader>> :%s/:\(\w*\) .*=>/\1: /gc

" bye bye pry
":g/binding.pry/d

"condenses multiple blank lines
":%s/\n\{3,}/\r\r/e

"%s/"\([^"]*\)"/'\1'/gc  "Replaces double with single quotes

imap <D-/> <leader>c<space>
nmap <D-/> <leader>c<space>
vmap <D-/> <leader>c<space>

