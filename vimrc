set nocompatible
filetype off
set laststatus=2

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'nvie/vim-flake8'
Plugin 'fatih/vim-go'
Plugin 'dense-analysis/ale'
Plugin 'maxmellon/vim-jsx-pretty'

call vundle#end()

set encoding=utf-8
set ffs=unix,dos,mac

" backspace
set backspace=indent,eol,start

" how many commands vim should remember
set history=500

" filetype plugins
filetype plugin indent on

" refresh a file automatically when it changes outside of vim
set autoread

" keep lines above/below the cursor
set so=3

" list items in context menus
set wildmenu

" always show current position
set ruler

" make searching great again
set ignorecase
set smartcase
set hlsearch
set incsearch
nmap X :noh<Return>

" regexes are magic
set magic

" show matching brackets for .2 seconds
set showmatch
set mat=2

" no annoying sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" increase left margin
set foldcolumn=1

" make it look purdy
set t_Co=256
syntax enable
"colorscheme CandyPaper
"colorscheme slate
"colorscheme triplejelly
colorscheme tropikos
set background=dark

" no backups/swap files
set nobackup
set nowb
set noswapfile

" line numbers
set number
"set relativenumber

" tab stuff
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set textwidth=79
set autoindent
set fileformat=unix

" indent stuff
set ai
set si
set wrap

" code folding
set foldmethod=indent
set foldlevel=99
" fold/unfold with space
nnoremap <space> za

" treat long lines as break lines
map j gj
map k gk

" insert newline without entering edit mode
nmap <CR> o<Esc>

" splits
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
map <Up> :resize +1<CR>
map <Down> :resize -1<CR>
map <Left> :vertical resize -1<CR>
map <Right> :vertical resize +1<CR>
set splitbelow
set splitright

" nerdtree
nmap <silent> <C-N> :NERDTreeToggle<CR>

" ALE
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
