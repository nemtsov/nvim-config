call plug#begin('~/.config/nvim/plugged')
Plug 'bpietravalle/vim-bolt', { 'for': 'bolt' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'neomake/neomake'
Plug 'mattn/emmet-vim', { 'for': ['html', 'vue'] }
Plug 'mhinz/vim-signify'
Plug 'mileszs/ack.vim'
Plug 'mustache/vim-mustache-handlebars', { 'for': ['html.mustache'] }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeFind', 'NERDTreeToggle'] }
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sirver/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'vim-scripts/tcd.vim'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  ['NERDTreeFind', 'NERDTreeToggle'] }
Plug 'yonchu/accelerated-smooth-scroll'
call plug#end()

filetype plugin indent on

let mapleader = ","

" view
set autoread
set shell=/bin/sh
set lazyredraw
set nofoldenable
set number
set tabstop=2
set shiftwidth=2
set expandtab
set list " Show invisible characters
set listchars=tab:>.,trail:.,extends:>,precedes:\<
set noerrorbells visualbell t_vb=
set notimeout
set inccommand=split
let loaded_matchparen = 1

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
nnoremap <leader>w :w<CR>

" aliases / anti-temptation
ino <Up> <NOP>
ino <Right> <NOP>
ino <Down> <NOP>
ino <Left> <NOP>

" aliases / anit-annoyance
map <S-k> <NOP>
map <F1> <Esc>
imap <F1> <Esc>
imap <C-p> <NOP>

" aliases / buffers
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>k :bn<CR>

" aliases / tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt

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

" aliases / fzf
imap <leader><tab> <plug>(fzf-maps-i)
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nmap <leader>/ :Ag<CR>
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap <c-p> :FZF<CR>

autocmd VimEnter * command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)


" aliases / terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" plugins / nerdtree
let g:NERDTreeMouseMode=3
map <silent> <Leader>d :NERDTreeToggle<CR>
map <silent> <Leader>f :NERDTreeFind<CR>

" plugins / nerdcommenter
let g:ft = ''
fu! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        let syn = tolower(syn)
        exe 'setf '.syn
      endif
    endif
  endif
endfu
fu! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    g:ft
  endif
endfu
let g:NERDSpaceDelims = 1

" plugins / ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore=public/assets/css'
endif

" plugins / tern
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 1

" plugins / deoplete
set completeopt-=preview
let g:deoplete#enable_at_startup = 1

" plugins / neomake
let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_vue_enabled_makers = ['eslint_d']
autocmd! BufWritePost * Neomake

" plugin / accelerated-smooth-scroll
let g:ac_smooth_scroll_fb_sleep_time_msec = 3
let g:ac_smooth_scroll_du_sleep_time_msec = 3

" plugin / tcd
nnoremap <leader>cd call Tcd(getcwd())

" plugin / polyglot / jsx
let g:jsx_ext_required = 1

" auto watch vimrc
augroup myvimrc
  au!
  au BufWritePost init.vim,init.local.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" style
set termguicolors
set background=dark
set fillchars+=vert:│

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" style / statusline
set statusline=\ \ %f\ \ %#StatusLineNC#%=%r\ %0*\ \ %m\ \ %p%%\ \ \ 


" style/mouse-cursor
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" style/smooth scrolling
set scroll=5

if filereadable(expand('~/.nvim.local.vim'))
  source ~/.nvim.local.vim
endif

" style post local
if &background=="dark"
  colorscheme Tomorrow-Night-Eighties
  hi StatusLine guibg=#dddddd guifg=#4f4f4f
  hi StatusLineNC guibg=#666666 guifg=#333333
  hi TabLineFill guibg=#dddddd guifg=#333333
  hi TabLine guibg=#666666 guifg=#333333
  hi TabLineSel guibg=#cccccc guifg=#4f4f4f
  hi CursorLineNR guifg=#dddddd
else
  colorscheme Tomorrow
  hi StatusLine guibg=#222222 guifg=#B0B0B0
  hi StatusLineNC guibg=#999999 guifg=#CCCCCC
  hi TabLineFill guibg=#dddddd guifg=#CCCCCC
  hi TabLine guibg=#999999 guifg=#CCCCCC
  hi TabLineSel guibg=#333333 guifg=#B0B0B0
  hi CursorLineNR guifg=#dddddd
endif

hi clear SignColumn
hi DiffAdd gui=bold guibg=none guifg=green
hi DiffDelete gui=bold guibg=none guifg=red
hi DiffChange gui=bold guibg=none guifg=orange
hi VertSplit guibg=bg
hi Search guibg=#dddddd
