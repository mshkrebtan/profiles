" Filetype: gitcommit
autocmd BufRead,BufNewFile gitcommit setfiletype gitcommit
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal textwidth=72
if version >= 703
  autocmd FileType gitcommit setlocal colorcolumn=72
endif
