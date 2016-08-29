" Set leader key
let mapleader="\<Space>"

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Type <Space>o to open a new file:
nnoremap <Leader>o :CtrlP<CR>

" Type <Space>w to save file (a lot faster than :w<Enter>):
nnoremap <Leader>w :w<CR>
"Copy & paste to system clipboard with <Space>p and <Space>y:
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nnoremap <Leader>m :set paste!<CR>

"Stop that stupid window from popping up:
map q: :q

"" Previous - Next buffer with Ctrl + Shift + Left/Right
map <C-S-Left> :bprev<CR>
map <C-S-Right> :bnext<CR>

" Strip trailing whitespace from file with leader + s
function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map <Leader>s :call StripWhitespace ()<CR>
