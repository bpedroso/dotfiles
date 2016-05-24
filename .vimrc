set nocompatible
filetype off

execute pathogen#infect()
call pathogen#helptags()

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" Plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-pathogen'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scroolose/nerdtree'

" NERDTree
map <silent> <C-n> :NERDTreeFocus<CR>
let g:nerdtree_tabs_open_on_console_startup=0
