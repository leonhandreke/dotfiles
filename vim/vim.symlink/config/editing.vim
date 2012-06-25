" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set textwidth=120

" Set the tab to be 4 spaces wide by default
set shiftwidth=4
set tabstop=4

" Remember the position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Do not create annoying temporary and backup files
set noswapfile
set nobackup

" Use bash like autocompletion behaviour to enable more bashing of the tab key
set wildmode=list:longest

" Enable syntax highlighting
syntax on
