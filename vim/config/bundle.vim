filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle take care of itself
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'MarcWeber/vim-addon-local-vimrc'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'Shougo/deoplete.nvim'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/restore_view.vim'
Bundle 'mileszs/ack.vim'
Bundle 'terryma/vim-expand-region'
Bundle 'vim-scripts/gitignore'
Bundle 'tpope/vim-sleuth'
Bundle 'ledger/vim-ledger'
Bundle 'icymind/NeoSolarized'

" Syntax support
Bundle 'Glench/Vim-Jinja2-Syntax'
Bundle 'fatih/vim-go'
Bundle 'rodjek/vim-puppet'
Bundle 'vim-scripts/iptables'
Bundle 'uarun/vim-protobuf'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'rosstimson/scala-vim-support'
Bundle 'peterhoeg/vim-qml'

Bundle 'rainbow_parentheses.vim'

" Dependency for vim-textobj-quote
"Bundle 'kana/vim-textobj-user'
"Bundle 'reedes/vim-textobj-quote'
"
" If installed using git
set rtp+=~/Development/fzf
Bundle 'Alok/notational-fzf-vim'

Bundle 'vim-latex/vim-latex'

Plugin 'reedes/vim-pencil'

filetype on
filetype plugin indent on
