" Set leader key
let mapleader=","


"" Previous - Next buffer with Ctrl + Shift + Left/Right
map <C-S-Left> :bprev<CR>
map <C-S-Right> :bnext<CR>

" Strip trailing whitespace from file with leader + s
function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
map <Leader>s :call StripWhitespace ()<CR>
