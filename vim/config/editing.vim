" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Remember the position when reopening a file with restore_view.vim
set viewoptions=cursor,folds,slash,unix

" Do not create annoying temporary and backup files
set noswapfile
set nobackup

" Use bash like autocompletion behaviour to enable more bashing of the tab key
set wildmode=list:longest

" Disable Ex mode
nnoremap Q <nop>

" Enable syntax highlighting
syntax on

" Highlight search terms
set hlsearch

set undofile
set undodir=~/.vim/undodir

set autoread

set nospell
set spelllang=de
