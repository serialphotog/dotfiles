" Plug
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'gkapfham/vim-vitamin-onec'
Plug 'terryma/vim-smooth-scroll'
Plug 'rstacruz/vim-closer'
call plug#end()

" Add fzf
set rtp+=~/.fzf

" Colors
syntax enable
set termguicolors
colorscheme vitaminonec

" Spaces & Tabs
set shiftwidth=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab 
set autoindent
set copyindent
set nowrap
filetype plugin indent on

" UI
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch
set ruler
set cc=80
set title
set noerrorbells
set laststatus=2

" Searching
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase
set smartcase

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Persistent undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" w!! to write a file using sudo
cmap w!! w !sudo tee % >/dev/null

" History
set history=1000
set undolevels=1000

" Enable mouse support
set mouse=a

" Keys
set backspace=indent,eol,start
map <C-n> :NERDTreeToggle<CR> " Open NERDTree with Ctrl+N
map ; :Files<CR> " Open FZF with ;

" Lightline
let g:lightline = {
    \ 'colorscheme': 'vitaminonec'
    \ }
