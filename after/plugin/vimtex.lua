vim.cmd([[
filetype plugin on

syntax enable

let g:vimtex_view_method = 'skim'

autocmd User VimtexEventQuit VimtexClean
]])
