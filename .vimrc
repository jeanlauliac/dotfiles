
set number
set ruler
set laststatus=2

set incsearch
set hlsearch

let mapleader=','

"set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set autoindent
"set smartindent

set ignorecase
set smartcase

set backspace=2 " make backspace work like most other apps

set colorcolumn=80

call pathogen#infect()
syntax enable
filetype plugin indent on
au BufNewFile,BufRead *._coffee set filetype=coffee
au BufNewFile,BufRead *.adoc set filetype=asciidoc

set t_Co=16
set background=dark
color solarized

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
set wildignore+=*/.git/*,*/.hg/*

map <leader>y :CtrlPBuffer<cr>

set ttimeoutlen=10

