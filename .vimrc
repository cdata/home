" Turn on line numbering. Turn it off with 'set nonu' 
set nu 

" Fix backspace when on the terminal...
set backspace=2

" Set plugin / syntax required options...
set nocompatible
filetype plugin on
syntax on

" Set personalized key settings...
let NERDComInsertMap='<c-c>'
let mapleader=","
nnoremap <F3> :let @/ = ""<CR>
set whichwrap+=<,>,h,l,[,]

" Indent automatically depending on filetype
filetype indent on
set autoindent

" 'Smart' case insensitive search
set ic
set sc

" Set tabs to four spaces + smart indentation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Add row / columnn information
set ruler

" Higlhight search
set hls

" Wrap text instead of being on one line
set lbr

" Change colorscheme from default to delek
set background=dark
colorscheme ir_black
