" ~/.vimrc
"
" Author: Russell Parker

"--------------------
" general
"--------------------
set cursorline                  " add underline on current line 
set showcmd                     " not totally sure
set lazyredraw                  " redraw only when necessary, for performance
set nowrap

"--------------------
" line numbering
"--------------------
set number relativenumber       " number lines relatively
augroup numbertoggle            " toggle relative off when no focus
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set modelines=0                 " avoid security vulnerability
set showmode

"--------------------
" syntax highlighting
"--------------------
syntax on
colorscheme desert              " use a built-in colorscheme
set showmatch                   " highlight matching parens

"--------------------
" search
"--------------------
set incsearch
set hlsearch

"--------------------
" whitespace
"--------------------
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
"set cindent
"filetype indent on

"--------------------
" navigation
"--------------------
set wildmenu                    " visual autocomplete

"--------------------
" bell
"--------------------
set visualbell
set t_vb=

"--------------------
" netrw
"--------------------
let g:netrw_liststyle = 3       " use hierarchy style
let g:netrw_banner = 0          " no banner in netrw view
let g:netrw_browse_split = 1   " open files in new horizontal split 
let g:netrw_winsize = 25        " let netrw take up 25% of screen width

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
