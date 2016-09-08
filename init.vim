call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'chriskempson/vim-tomorrow-theme'
call plug#end()

filetype plugin indent on

let mapleader = ","

" view
"set shell=/bin/sh
set nofoldenable
set number
set tabstop=2
set shiftwidth=2
set expandtab
set list " Show invisible characters
set listchars=tab:>.,trail:.,extends:>,precedes:\<
set noerrorbells visualbell t_vb=

" searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" indenting blocks while retaining visual selection
vnoremap > >gv
vnoremap < <gv

" aliases
nnoremap <silent> <leader><space> :noh<cr>
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" aliases / anti-temptation
ino <Up> <NOP>
ino <Right> <NOP>
ino <Down> <NOP>
ino <Left> <NOP>

" aliases / anit-annoyance
map <S-k> <NOP>
map <F1> <Esc>
imap <F1> <Esc>

" aliases / copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" aliaes / paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" aliases / command line emacs bindings
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" plugins / nerdtree
let g:NERDTreeMouseMode=3
let g:NERDTreeGitStatusIgnoreSubmodules=1
map <silent> <Leader>d :NERDTreeToggle<CR>
map <silent> <Leader>f :NERDTreeFind<CR>

" style
set fillchars+=vert:│
highlight clear SignColumn

" gui
if has('gui_running') || exists('neovim_dot_app')
  colorscheme Tomorrow-Night-Eighties
endif
