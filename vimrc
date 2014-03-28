set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'tfnico/vim-gradle'
Bundle 'plasticboy/vim-markdown'

filetype plugin indent on     " required

set tabstop=4
set nu
set shiftwidth=4
set expandtab
syntax on

map <Leader> <Plug>(easymotion-prefix)
