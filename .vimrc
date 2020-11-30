" I want all the new vim things!
set nocompatible

" UTF-8
set encoding=utf-8

" Behaviour of backspace
set backspace=indent,eol,start

" Colorize all the things!
syntax on
colorscheme default
filetype on

" Display line numbers
set number
highlight LineNr ctermfg=grey

" Search settings
set hlsearch
:nnoremap <silent> <F3> :nohl<Bar>:echo<CR>

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4
set expandtab
