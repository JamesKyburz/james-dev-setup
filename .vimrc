"
" ________
"< .vimrc >
" --------
"        \   ^__^
"         \  (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||

if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'othree/es.next.syntax.vim'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'elzr/vim-json'
NeoBundle 'vim-scripts/searchfold.vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'ramitos/jsctags'
NeoBundle 'moll/vim-node'
NeoBundle 'ntpeters/vim-better-whitespace'
NeoBundle 'wincent/command-t'
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'w0rp/ale'
NeoBundle 'iandoe/vim-osx-colorpicker'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'cespare/vim-toml'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

set backspace=indent,eol,start
set t_Co=256
set mouse=a
set spelllang=en_us
set noswapfile
set hidden
set nowrap
set hlsearch
set incsearch
set ignorecase
set smartcase
set number

set encoding=utf-8
syntax on

set modeline
set modelines=10
set showcmd

set foldmethod=syntax
set foldlevelstart=2

set tabstop=2 shiftwidth=2 expandtab
set smarttab smartindent autoindent

"set listchars=tab:▸\ ,eol:\ ,trail:·
"set fillchars=fold:\

set foldmethod=indent
set foldnestmax=2
set nofoldenable
set foldlevel=1

let &stl="%.50F"
let &stl.="%=%1*%{&modified ? ' + ' : ''}%0* "
let &stl.="%c:%l/%L "

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

map <c-l> <Esc>:CtrlPBuffer<CR>
map <c-f> :Ack
map <Tab> <C-W>w

:command WQ wq
:command Wq wq
:command W w
:command Qa qall!
:command Q qall!

map <C-n> :NERDTreeToggle<CR>
map <C-t> :CommandT<CR>

let g:NERDTreeUpdateOnWrite = 1
let NERDTreeMinimalUI = 1

colorscheme minimalist

highlight ColorColumn ctermbg=235 guibg=#2c2d27

let g:ale_fixers = {'javascript': ['prettier_standard']}
let g:ale_linters = {'javascript': ['']}
let g:ale_fix_on_save = 1

let g:vim_json_syntax_conceal = 0

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set laststatus=2
set noequalalways

map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

set backspace=indent,eol,start

filetype plugin indent on

map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

imap jj <Esc>

nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

let g:JSLintHighlightErrorLine = 0
let macvim_hig_shift_movement = 1

runtime! macros/matchit.vim

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_return               = "⏎"
let g:javascript_conceal_arrow_function       = "⇒"
set conceallevel=1
