set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vim Theme
Plugin 'morhetz/gruvbox'
Plugin 'flazz/vim-colorschemes'

" Plugins
" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Vim Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Vim Test
Plugin 'janko-m/vim-test'
Plugin 'benmills/vimux'

" Other Plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'

" Syntax Plugins
Plugin 'scrooloose/syntastic'
Plugin 'elixir-lang/vim-elixir'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'voithos/vim-python-syntax'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let mapleader = ','

syntax on
set number
set ruler
highlight ColorColumn ctermbg=2
set colorcolumn=81

set encoding=utf8
" set background=dark
" colorscheme gruvbox

" Tab settings
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2

" Mappings for easy navigation between panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" No backup/swap
set nobackup
set nowritebackup
set noswapfile

" Make it easier to run commands
noremap ; :

" Better movement between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Trim extra white space at end of the line
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Mouse Control
set mouse=a

" Hidden Files
set nohidden

" Search
set incsearch
set showcmd
set ignorecase
set smartcase
set hlsearch

" Show mode
set showmode
set showcmd
set ruler
set ttyfast
set backspace=indent,eol,start
set laststatus=2

" Vim Test Setup
let test#strategy = "vimux"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>f :TestFile<CR>
nmap <silent> <leader>r :TestSuite<CR>

" NERDTree show hidden files:
let NERDTreeShowHidden=1

" CtrlPBuffer Search
nnoremap ,b :CtrlPBuffer<CR>

" vim-multiple-cursors configuration
let g:multi_cursor_exit_from_visual_mode=1
let g:multi_cursor_exit_from_insert_mode=1

" Start NERDTree on VIMEnter
autocmd VimEnter * NERDTree

" Go fmt on save
let g:go_fmt_command = "goimports"
let g:go_version_warning = 0

