" GUndo to Ctrl + U
nnoremap <C-u> :GundoToggle<CR>

" Powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'

" Indent Guides
let g:indent_guides_enable_on_vim_startup=1

let g:ctrlp_clear_cache_on_exit = 0

let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_lint_ignore = "E501,E261,E126,E302"

let g:ycm_autoclose_preview_window_after_completion = 1

let g:EclimCompletionMethod = 'omnifunc'
nmap <Leader>o :JavaImportOrganize<CR>
nmap <Leader>i :JavaImport<CR>
nmap <Leader>s :JavaSearchContext<CR>
nmap <Leader>r :JavaRename

let g:ctrlp_regexp = 1
