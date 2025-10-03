set nocompatible
set showcmd

filetype on
filetype indent on
filetype plugin on
syntax on
set encoding=utf-8
scriptencoding=utf-8
set autoindent
set wrap
set linebreak
set nolist 
set backspace=indent,eol,start
set hidden


set path+=**

set clipboard=unnamedplus

set mouse=a

set number
set relativenumber

set laststatus=2
set ruler

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set foldmethod=marker

set nobackup
set undodir=~/.vim/undodir
set undofile
set noswapfile

set viminfofile=~/.vim/info
set scrolloff=10

set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set shortmess-=S

set showcmd

set showmode

set wildmenu
set wildmode=list:longest

" Wildignore

function! SetupWildignore()
    " Office documents
    set wildignore=*.docx,*.pdf,*.xlsx

    " Image files
    set wildignore+=*.jpg,*.png,*.gif,*.img

    " Temporary, backup, and swap files
    set wildignore+=*.log,*.tmp,*.bak,*.cache,*.swp,*.swo,*.swn

    " Python files and environments
    set wildignore+=*.pyc
    set wildignore+=*/__pycache__/*,*/venv/*,*/.venv/*

    " JavaScript / Node / Frontend folders
    set wildignore+=*/node_modules/*,*/dist/*
    " Java files and build outputs
    set wildignore+=*.class,*.war,*.ear
    set wildignore+=*/target/*,*/build/*

    " Compiled and binary files
    set wildignore+=*.exe,*.out,*.bin
    set wildignore+=*.o,*.obj,*.a,*.lib,*.so,*.dll
    set wildignore+=*.gch,*.pch,*.d,*.dep
endfunction

call SetupWildignore()

set wildoptions=pum

set complete-=i
set complete+=kspell

set termguicolors
set t_Co=256

set background=dark
colorscheme slate


" Java syntax highlight 
let java_highlight_functions = 1
let java_highlight_all = 1
let java_highlight_java_util= 1
let g:java_highlight_java_io = 1
let g:java_highlight_functions = "style"
let g:java_highlight_signature = 1
let g:java_highlight_generics = 1
let g:java_highlight_java_lang_ids = 1
highlight link javaScopeDecl Statement
highlight link javaType Type
highlight link javaDocTags PreProc

set cursorline

" MAPPINGS {{{
let mapleader=","

" Esc map
inoremap <Space><leader> <Esc>
vnoremap <Space><leader> <Esc>

" Disable search highlight
nnoremap <leader>m :nohl<CR><C-l>

" Retain visual selection after indent
vnoremap < <gv
vnoremap > >gv

" Move text 
map <Esc>j <A-j>
map <Esc>k <A-k>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>=gv
vnoremap <A-k> :m '<-2<CR>=gv
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

" Buffers
nnoremap <S-Up> :resize -2<CR> 
nnoremap <S-Down> :resize +2<CR>
nnoremap <S-Left> :vertical resize -2<CR>
nnoremap <S-Right> :vertical resize +2<CR>
nnoremap <S-l> :bnext <CR>
nnoremap <S-h> :bprevious <CR>

" File explorers
nnoremap <leader>e :Ex<CR>
nnoremap <leader>l :Lex 20<CR>

"}}}
