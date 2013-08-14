" Tab and indenting rules
autocmd FileType python		set textwidth=0 expandtab tabstop=4 shiftwidth=4
autocmd FileType python		let &colorcolumn=join(range(81,999),",")
autocmd FileType javascript 	set expandtab tabstop=4 shiftwidth=4
autocmd FileType coffee 	set expandtab tabstop=2 shiftwidth=2
autocmd FileType jade 	set expandtab tabstop=2 shiftwidth=2
autocmd FileType html 		set expandtab tabstop=2 shiftwidth=2 textwidth=0
autocmd FileType htmldjango	set expandtab tabstop=2 shiftwidth=2 textwidth=0
autocmd FileType ruby 		set expandtab tabstop=2 shiftwidth=2
autocmd FileType gitcommit	set textwidth=72
autocmd FileType pandoc		set textwidth=0 nofoldenable
autocmd FileType mail		set textwidth=80
