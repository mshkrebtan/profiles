" Filetype: markdown
autocmd Filetype md,markdown call SetMarkdownOptions()

function! SetMarkdownOptions()
    setlocal spell
    if version >= 703
        setlocal colorcolumn=""
    endif
    setlocal showmode
    setlocal listchars=nbsp:·
endfunction
