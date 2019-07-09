set noswapfile
let mapleader = ";"
set autoread
set autowriteall
set number
set nowrap
set scrolloff=3
set hlsearch
set incsearch
set cursorline

augroup testgroup
	autocmd FocusLost * nested silent! wall
	autocmd Filetype css setlocal tabstop=4
augroup END


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

syntax on
filetype plugin indent on

let g:netrw_liststyle = 3

nmap <leader>e :Sexplore!<CR>

colorscheme desert

let g:netrw_alto=1
let g:netrw_winsize=40
let g:netrw_browse_split=4
":set guifont=Bitstream\ Vera\ Sans\ Mono:h14
set guifont=Menlo\ Regular:h14


set tabstop=4
set shiftwidth=4
set expandtab

" supporting commenting with leader-space, without plugins
let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }

function! ToggleComment()
	echo "Toggling"
	if has_key(s:comment_map, &filetype)
		let comment_leader = s:comment_map[&filetype]
		if getline('.') =~ "^\\s*" . comment_leader . " " 
			" Uncomment the line
			execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
		else 
			if getline('.') =~ "^\\s*" . comment_leader
				" Uncomment the line
				execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
			else
				" Comment the line
				execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
			end
		end
	else
		echo "No comment leader found for filetype"
	end
endfunction


nnoremap <leader><Space> :call ToggleComment()<cr>
vnoremap <leader><Space> :call ToggleComment()<cr>

nnoremap <C-/> :call ToggleComment()<cr>
vnoremap <C-/> :call ToggleComment()<cr>
