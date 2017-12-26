" show line numbers
set number

" configure syntax highlighting
syntax on
colorscheme desert

" handle whitespace
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


"""""""""""""""""""""""""""""" Vundle Settings """"""""""""""""""""""""""""""""
" be iMproved, required
set nocompatible
" required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on
