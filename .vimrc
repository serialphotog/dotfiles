" Pathogen
execute pathogen#infect()

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
set title
set visualbell
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

" History
set history=1000
set undolevels=1000

" Keys
set backspace=indent,eol,start
map <C-n> :NERDTreeToggle<CR> " Open NERDTree with Ctrl+N
map ; :Files<CR> " Open FZF with ;

" Lightline
let g:lightline = {
    \ 'colorscheme': 'vitaminonec'
    \ }
