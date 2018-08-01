if &compatible
  set nocompatible
endif


"=====================================================
" PLUGINS
"=====================================================

"-----------------------------------------------------
" dein.vim
"-----------------------------------------------------
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein')
  call dein#add('Shougo/deoplete.nvim') "https://github.com/Shougo/deoplete.nvim
  call dein#add('yukpiz/cobalt')        "https://github.com/yukpiz/cobalt
  call dein#add('agude/vim-eldar')      "https://github.com/agude/vim-eldar
  call dein#add('fatih/vim-go')         "https://github.com/fatih/vim-go
  call dein#add('thinca/quickrun')      "https://github.com/thinca/vim-quickrun
  call dein#add('scrooloose/nerdtree')  "https://github.com/scrooloose/nerdtree
  call dein#add('yukpiz/committia.vim') "https://github.com/yukpiz/committia.vim

  call dein#end()
  call dein#save_state()
endif

"-----------------------------------------------------
" deoplete.nvim
"-----------------------------------------------------
let g:deoplete#enable_at_startup = 1

"-----------------------------------------------------
" vim-quickrun
"-----------------------------------------------------
let g:quickrun_config = {}
let g:quickrun_config.cpp = {
\  'command' : 'g++',
\  'cmdopt' : '-std=c++11',
\}
let g:quickrun_config.go = {
\  'command': 'go',
\}

"-----------------------------------------------------
" committia.vim
"-----------------------------------------------------
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    setl spell
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction


"=====================================================
" Neovim SETTINGS
"=====================================================
filetype plugin indent on
syntax enable

color cobalt

set encoding=utf-8
scriptencoding=utf8
set fileencoding=utf-8
set fileencodings=utf-8,sjis,ucs-bom,default,latin1
set fileformats=unix,dos,mac
set autoread
set binary noeol
set textwidth=0
set autoindent
set smartindent
set wrapscan
set ignorecase
set incsearch
set hlsearch
set imsearch=0
set wrap
set ambiwidth=double
set showmatch
set matchtime=3
set listchars=tab:>.
set list listchars+=trail:_
set display=uhex
set re=1
set t_Co=256
set clipboard+=unnamed,unnamedplus
set mouse=a
set cursorline


"=====================================================
" CUSTOM FUNCTIONS
"=====================================================
function! SwitchNumber()
  if &nu == 0
    set nu
  else
    set nonu
  endif
endfunction

"=====================================================
" LANGUAGE SETTINGS
"=====================================================

"-----------------------------------------------------
" Golang
"-----------------------------------------------------
autocmd FileType go set ts=4 noet
autocmd FileType go set completeopt=menu,preview

"-----------------------------------------------------
" Java
"-----------------------------------------------------
autocmd FileType java setl omnifunc=javacomplete#Complete
autocmd FileType java set sw=2 ts=2 et
let g:java_highlight_all = 1

"-----------------------------------------------------
" Ruby
"-----------------------------------------------------
autocmd FileType ruby set sw=2 ts=2 et

"-----------------------------------------------------
" VimScript
"-----------------------------------------------------
autocmd FileType vim set sw=2 ts=2 et

"-----------------------------------------------------
" kotlin
"-----------------------------------------------------
autocmd FileType kotlin set sw=2 ts=2 et

"-----------------------------------------------------
" JavaScript
"-----------------------------------------------------
autocmd FileType javascript set sw=2 ts=2 et

"-----------------------------------------------------
" XML
"-----------------------------------------------------
autocmd FileType xml set sw=2 ts=2 et

"-----------------------------------------------------
" YAML
"-----------------------------------------------------
autocmd FileType yaml set sw=2 ts=2 et

"-----------------------------------------------------
" eruby
"-----------------------------------------------------
autocmd FileType eruby set sw=2 ts=2 et

"-----------------------------------------------------
" scss
"-----------------------------------------------------
autocmd FileType scss set sw=2 ts=2 et

"-----------------------------------------------------
" css
"-----------------------------------------------------
autocmd FileType css set sw=2 ts=2 et

"-----------------------------------------------------
" SQL
"-----------------------------------------------------
autocmd FileType sql set sw=2 ts=2 et

"-----------------------------------------------------
" reStructuredText
"-----------------------------------------------------
autocmd FileType rst set sw=2 ts=2 et

"-----------------------------------------------------
" Python
"-----------------------------------------------------
autocmd FileType python set sw=4 ts=4 et

"-----------------------------------------------------
" CoffeeScript
"-----------------------------------------------------
autocmd FileType coffee set sw=4 ts=4 et

"-----------------------------------------------------
" Haskell
"-----------------------------------------------------
autocmd FileType haskell set sw=4 ts=4 et

"-----------------------------------------------------
" PHP
"-----------------------------------------------------
autocmd FileType php set sw=4 ts=4 et

"-----------------------------------------------------
" Shell
"-----------------------------------------------------
autocmd FileType sh set sw=4 ts=4 et

"-----------------------------------------------------
" HTML
"-----------------------------------------------------
autocmd FileType html set sw=4 ts=4 et

"-----------------------------------------------------
" terraform
"-----------------------------------------------------
autocmd FileType terraform set sw=4 ts=4 et

"-----------------------------------------------------
" Makefile
"-----------------------------------------------------
autocmd FileType make set sw=4 ts=4 et


"=====================================================
" KEYMAPS
"=====================================================
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

nnoremap <silent> <Esc><Esc> :noh<CR>

nnoremap ,nu :call SwitchNumber()<CR>
nnoremap ,nt :NERDTreeToggle<CR>
nnoremap ,e :vs ~/.config/nvim/init.vim<CR>




