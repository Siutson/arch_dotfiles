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

" LaTeX preview
let g:livepreview_previewer = 'zathura'

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
