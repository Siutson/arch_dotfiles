set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor= " fat cursor
set relativenumber
set nu " better look at line you're currently on
set nohlsearch " don't highlight searched phrase all the time
set noerrorbells
"set hidden
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8 " keeps scrolling 8 lines away from top/bottom
set signcolumn=yes
set clipboard+=unnamedplus

" python provider path
let g:python3_host_prog = "/usr/bin/python3"

" LaTeX preview
let g:livepreview_previewer = 'zathura'

" python syntax highlight
let g:python_highlight_all = 1

" ctrlp
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_user_command = 'find %s -type f'

" --- devicons ---
set encoding=UTF-8

" --- nerdcommenter ---
filetype plugin on
"set omnifunc=syntaxcomplete#Complete

" --- colorizer ---
lua require'colorizer'.setup()

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup SIUTSON
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
