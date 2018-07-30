" GUndo to Ctrl + U
nnoremap <C-u> :GundoToggle<CR>

" Powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'

" Indent Guides
let g:indent_guides_enable_on_vim_startup=1

let g:pymode_lint = 0
let g:pymode_rope = 0
let g:pymode_lint_ignore = "E501,E261,E126,E302"

let g:ycm_autoclose_preview_window_after_completion = 1

"let g:deoplete#enable_at_startup = 1

"let g:EclimCompletionMethod = 'omnifunc'
"nmap <Leader>o :JavaImportOrganize<CR>
"nmap <Leader>i :JavaImport<CR>
"nmap <Leader>s :JavaSearchContext<CR>
"nmap <Leader>r :JavaRename

let g:ctrlp_regexp = 1

let g:ctrlp_use_caching = 0

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

" fzf fuzzy finding
let g:nv_use_short_pathnames = 1
let g:nv_search_paths = ['~/Dropbox/notes']
nnoremap <silent> <c-s> :NV
