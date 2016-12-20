" Filetype: markdown
autocmd FileType md,markdown setlocal spell

if version >= 703
    autocmd FileType md,markdown setlocal colorcolumn=""
endif

autocmd FileType md,markdown setlocal showmode
