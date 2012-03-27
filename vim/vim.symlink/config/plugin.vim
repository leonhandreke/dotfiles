""" NERDTree
nmap <silent> <C-D> :NERDTreeToggle<CR>

" FuzzyFinder
nnoremap <Leader>ff :FufFile<CR>
nnoremap <Leader>fb :FufBuffer<CR>

" shows the tagbar on the right
nmap <Leader>o :TagbarToggle<CR>

" GUndo to Ctrl + U
nnoremap <C-u> :GundoToggle<CR>

" Snipmate snippets directory
let g:snippets_dir = "~/.vim/bundle/snipmate-snippets"

" fugitive vim commands
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gl :Glog<CR>

" Powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'

" Indent Guides
let g:indent_guides_enable_on_vim_startup=1

