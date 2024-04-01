vim.cmd([[
filetype plugin on

syntax enable

let g:vimtex_view_method = 'skim'

nmap <localleader>ls <Plug>(vimtex-compile-ss)

autocmd User VimtexEventQuit VimtexClean
]])
