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
  call dein#add('Shougo/deoplete.nvim')       "https://github.com/Shougo/deoplete.nvim
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('yukpiz/cobalt')              "https://github.com/yukpiz/cobalt
  call dein#add('agude/vim-eldar')            "https://github.com/agude/vim-eldar
  call dein#add('Shougo/unite.vim')           "https://github.com/Shougo/unite.vim
  call dein#add('Shougo/unite-outline')       "https://github.com/Shougo/unite-outlinE
  call dein#add('fatih/vim-go')               "https://github.com/fatih/vim-go
  call dein#add('thinca/vim-quickrun')        "https://github.com/thinca/vim-quickrun
  call dein#add('scrooloose/nerdtree')        "https://github.com/scrooloose/nerdtree
  call dein#add('yukpiz/committia.vim')       "https://github.com/yukpiz/committia.vim
  call dein#add('vim-jp/vital.vim')           "https://github.com/vim-jp/vital.vim
  call dein#add('leafgarland/typescript-vim') "https://github.com/leafgarland/typescript-vim
  call dein#add('hashivim/vim-terraform')     "https://github.com/hashivim/vim-terraform
  call dein#add('previm/previm')              "https://github.com/previm/previm
  call dein#add('tyru/open-browser.vim')      "https://github.com/tyru/open-browser.vim

  call dein#add('LeafCage/foldCC')
  call dein#add('andymass/vim-matchup')
  call dein#add('lambdalisue/gina.vim')
  call dein#add('cohama/lexima.vim')
  call dein#add('machakann/vim-highlightedyank')
  call dein#add('aiya000/vim-fmap')

  "https://github.com/plasticboy/vim-markdown
  call dein#add('plasticboy/vim-markdown', {'lazy': 1, 'on_ft': 'markdown'})

  call dein#end()
  call dein#save_state()
endif

"-----------------------------------------------------
" deoplete.nvim
"-----------------------------------------------------
let g:deoplete#enable_at_startup = 1

"-----------------------------------------------------
" neocomplete.nvim
"-----------------------------------------------------
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#enable_ignore_case=1
let g:neocomplete#enable_camel_case=0
let g:neocomplete#max_list=14
let g:neocomplete#max_keyword_width=80
let g:neocomplete#min_keyword_length=2


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
let g:python_host_prog = ''

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
set title
set titlestring=neovim
set foldmethod=marker
set foldopen+=jump
set foldmarker={{{,}}}
set foldenable
set backspace=indent,eol,start
set scrolloff=3
set lazyredraw
set noerrorbells
set novisualbell
set visualbell t_vb=
set numberwidth=6
if has('wildmenu')
    set wildmenu
    set wildchar=<Tab>
    set wildmode=full
endif


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

function! SetCustomTitleString()
  let path = expand('%:p')
  echo path
endfunction

"=====================================================
" LANGUAGE SETTINGS
"=====================================================

"-----------------------------------------------------
" json
"-----------------------------------------------------
autocmd FileType json set ts=2 sw=2 et

"-----------------------------------------------------
" markdown
"-----------------------------------------------------
autocmd FileType markdown set ts=4 sw=4 noet

"-----------------------------------------------------
" C++
"-----------------------------------------------------
autocmd FileType cpp,c set ts=4 sw=4 noet
autocmd FileType cpp,c set matchpairs+=<:>
autocmd FileType cpp,c syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
autocmd FileType cpp,c highlight link boost_pp cppStatement
autocmd FileType cpp,c setlocal path=,/usr/include,/usr/local/include

"-----------------------------------------------------
" Golang
"-----------------------------------------------------
autocmd FileType go set ts=4 sw=4 noet
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

nnoremap ,nr :Unite file -start-insert<CR>
nnoremap ,nu :call SwitchNumber()<CR>
nnoremap ,nt :NERDTreeToggle<CR>
nnoremap ,e :vs ~/.config/nvim/init.vim<CR>

"filetype detect
"augroup filetypedetect
"  "autocmd BufNew,BufRead * call SetCustomTitleString()
"augroup END