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

"let g:EclimCompletionMethod = 'omnifunc'
"nmap <Leader>o :JavaImportOrganize<CR>
"nmap <Leader>i :JavaImport<CR>
"nmap <Leader>s :JavaSearchContext<CR>
"nmap <Leader>r :JavaRename

let g:ctrlp_regexp = 1

let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif
