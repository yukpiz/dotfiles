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
  call dein#add('neoclide/coc.nvim')
  "call dein#add('Shougo/deoplete.nvim')       "https://github.com/Shougo/deoplete.nvim
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('majutsushi/tagbar')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
    call dein#add('fatih/vim-go')               "https://github.com/fatih/vim-go
  else
    call dein#add('fatih/vim-go')               "https://github.com/fatih/vim-go
    "call dein#add('zchee/nvim-go', {'build': 'make'})
  endif
  call dein#add('yukpiz/cobalt')              "https://github.com/yukpiz/cobalt
  call dein#add('agude/vim-eldar')            "https://github.com/agude/vim-eldar
  call dein#add('Shougo/unite.vim')           "https://github.com/Shougo/unite.vim
  call dein#add('Shougo/unite-outline')       "https://github.com/Shougo/unite-outlinE
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
  call dein#add('tell-k/vim-autopep8')
  call dein#add('slim-template/vim-slim')
  call dein#add('cespare/vim-toml')
  call dein#add('kana/vim-fakeclip')
  call dein#add('bpietravalle/vim-bolt')
  call dein#add('aklt/plantuml-syntax')

  call dein#add('vim-scripts/SQLUtilities') "Depends on SQLUtilities
  call dein#add('vim-scripts/Align')
  "call dein#add('yuttie/comfortable-motion.vim')

  "https://github.com/plasticboy/vim-markdown
  call dein#add('plasticboy/vim-markdown', {'lazy': 1, 'on_ft': 'markdown'})

  "codereview
  call dein#add('junkblocker/patchreview-vim')
  call dein#add('codegram/vim-codereview')

  call dein#end()
  call dein#save_state()
endif

"-----------------------------------------------------
" comfortable-motion.vim
"-----------------------------------------------------
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

"-----------------------------------------------------
" vim-lsp
"-----------------------------------------------------
"let g:lsp_signs_enabled = 1         " enable signs
"let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
"if executable('go-langserver')
"  au User lsp_setup call lsp#register_server({
"    \ 'name': 'go-langserver',
"    \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio']},
"    \ 'whitelist': ['go'],
"    \ })
"endif

"-----------------------------------------------------
" vim-go
"-----------------------------------------------------
"let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
"set foldmethod=syntax

"-----------------------------------------------------
" tagbar
"-----------------------------------------------------
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
  \ }

"-----------------------------------------------------
" deoplete.nvim
"-----------------------------------------------------
"let g:deoplete#enable_at_startup = 1

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
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

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
set mouse=a
set cursorline
set title
set titlestring=neovim
"set foldmethod=marker
set foldopen+=jump
"set foldmarker={{{,}}}
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
" hog
"-----------------------------------------------------
autocmd FileType hog set ts=2 sw=2 et

"-----------------------------------------------------
" typescript
"-----------------------------------------------------
autocmd FileType typescript set ts=2 sw=2 et

"-----------------------------------------------------
" bolt
"-----------------------------------------------------
autocmd FileType bolt set ts=2 sw=2 et

"-----------------------------------------------------
" proto
"-----------------------------------------------------
autocmd FileType proto set ts=4 sw=4 et

"-----------------------------------------------------
" json
"-----------------------------------------------------
autocmd FileType json set ts=2 sw=2 et

"-----------------------------------------------------
" markdown
"-----------------------------------------------------
autocmd FileType markdown set ts=4 sw=4 noet
let g:vim_markdown_folding_disabled = 1

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
autocmd FileType go set foldexpr=MyFold(v:lnum)
autocmd FileType go set foldmethod=expr
autocmd FileType go set nocursorcolumn
autocmd FileType go syntax sync minlines=256
"autocmd FileType go set synmaxcol=300
autocmd FileType go set re=1

function! MyFold(lnum)
  let line = getline(a:lnum)
  if line =~ '^[func|type]'
    return '>1'
  elseif line =~ '^}'
    return '<1'
  endif
  return -1
endfunction

"set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
autocmd BufWritePost,FileWritePost *.go GoImports
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1

"-----------------------------------------------------
" PlantUML 
"-----------------------------------------------------
autocmd BufRead,BufNewFile *.uml setfiletype plantuml
autocmd FileType plantuml command! OpenUML :!xdg-open %
autocmd FileType plantuml set sw=2 ts=2 et

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
let g:autopep8_disable_show_diff=1
autocmd BufWritePre,FileWritePre *.py Autopep8

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
autocmd FileType html set sw=2 ts=2 et

"-----------------------------------------------------
" terraform
"-----------------------------------------------------
autocmd FileType terraform set sw=4 ts=4 et

"-----------------------------------------------------
" Makefile
"-----------------------------------------------------
autocmd FileType make set sw=4 ts=4 et

"=====================================================
" TERMINAL
"=====================================================

function! s:bufnew()
  if &buftype == "terminal" && &filetype == ""
    set filetype=terminal
  endif
endfunction

function! s:filetype()
  call feedkeys("i")
endfunction

augroup Terminal
  autocmd!
  autocmd BufNew * call timer_start(0, { -> s:bufnew() })
  autocmd FileType terminal call s:filetype()
augroup END

"=====================================================
" COMMANDS
"=====================================================

command! YukGitLog vsplit|vertical resize -100|:te git log
command! YukGitCommit vsplit|:te lazygit
command! YukGore vsplit|vertical resize -50|:te gore
command! YukTerm vsplit|:te

"=====================================================
" KEYMAPS
"=====================================================
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap j gj
nnoremap k gk
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

nnoremap <silent> <Esc><Esc> :noh<CR>

nnoremap ,tt :TagbarToggle<CR>
nnoremap ,nr :Unite file -start-insert<CR>
nnoremap ,nu :call SwitchNumber()<CR>
nnoremap ,nt :NERDTreeToggle<CR>
nnoremap ,tn :tabnew<CR>
nnoremap ,e :vs ~/.config/nvim/init.vim<CR>

nnoremap <C-Left> gT
nnoremap <C-Right> gt
inoremap <C-Left> <Esc>gT
inoremap <C-Right> <Esc>gt

set clipboard=unnamedplus