filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle take care of itself
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'MarcWeber/vim-addon-local-vimrc'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'vim-scripts/restore_view.vim'
Bundle 'mileszs/ack.vim'

" Syntax support
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'jnwhiteh/vim-golang'
Bundle 'rodjek/vim-puppet'
Bundle 'vim-scripts/iptables'
Bundle 'uarun/vim-protobuf'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'rosstimson/scala-vim-support'

Bundle 'rainbow_parentheses.vim'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'

filetype on
filetype plugin indent on
