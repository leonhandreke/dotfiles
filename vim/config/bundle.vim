if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-scripts/restore_view.vim'
Plug 'mileszs/ack.vim'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/gitignore'
Plug 'tpope/vim-sleuth'
Plug 'ledger/vim-ledger'
Plug 'overcache/NeoSolarized'

Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'vim-scripts/iptables'
Plug 'uarun/vim-protobuf'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'rosstimson/scala-vim-support'
Plug 'peterhoeg/vim-qml'
Plug 'jamessan/vim-gnupg'
Plug 'vim-latex/vim-latex'

" Completions
"Plug 'Shougo/deoplete.nvim'
"Plug 'zchee/deoplete-jedi'
"Plug 'zchee/deoplete-go', { 'do': 'make'}
"Plug 'Shougo/neco-syntax'

call plug#end()

