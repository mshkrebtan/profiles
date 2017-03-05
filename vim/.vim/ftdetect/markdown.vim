" Filetype: markdown
autocmd Filetype md,markdown call SetMarkdownOptions()

function! SetMarkdownOptions()
    setlocal spell
    setlocal textwidth=79
    if version >= 703
        setlocal colorcolumn=80
    endif
    setlocal showmode
    setlocal listchars=nbsp:·
    setlocal list
endfunction
