" ~/.vimrc
"
" Author: Russell Parker

"--------------------
" general
"--------------------
set number

"--------------------
" syntax highlighting
"--------------------
syntax on
colorscheme koehler

"--------------------
" whitespace
"--------------------
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"--------------------
" bell
"--------------------
set visualbell
set t_vb=

"--------------------
" Vundle setup
"--------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on
