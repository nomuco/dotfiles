set nocompatible

filetype off

set rtp+=~/dotfiles/vimfiles/vundle.git

call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'

filetype plugin indent on    " required!

syntax on

set nowrap

set hlsearch
set ignorecase
set smartcase

set autoindent

set ruler
set number
set list
set wildmenu
set showcmd

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab

set clipboard=unnamed
