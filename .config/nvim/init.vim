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

call plug#begin('~/.vim/plugged')

" nerdcommenter
Plug 'preservim/nerdcommenter'

" telescope
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

Plug 'morhetz/gruvbox'
"Plug 'danilo-augusto/vim-afterglow'

" Plug 'neovim/nvim-lspconfig'

" barbar (tabs)
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'romgrk/barbar.nvim'

" nerdtree
Plug 'preservim/nerdtree'

" colorizer
Plug 'norcalli/nvim-colorizer.lua'

" coc-nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Discord presence
Plug 'andweeb/presence.nvim'

" airLINE
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" snippets
Plug 'SirVer/ultisnips'


call plug#end()

" the bestest colorscheme
colorscheme gruvbox
let g:airline_theme='gruvbox'

if (has("termguicolors"))
    set termguicolors
endif


" nerdcommenter
filetype plugin on

let mapleader = " "
" nnoremap <leader>ff :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<CR>
" nnoremap <leader>ff <cmd>Telescope find_files<cr>

" barbar
"nnoremap <leader>p    <cmd> :BufferPrevious<CR>
"nnoremap <leader>n    <cmd> :BufferNext<CR>
"nnoremap <leader>x    <cmd> :BufferClose<CR>

" pyright LSP

" NERDTree
let NERDTreeQuitOnOpen=1
nmap <leader>f :NERDTreeToggle<CR>
"nnoremap <leader>f :let NERDTreeQuitOnOpen = 1<bar>NERDTreeToggle<CR>

" colorizer
lua require'colorizer'.setup()

" tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>o :bp<CR>
nmap <leader>p :bn<CR>
nmap <C-w> :bd<CR>

" CoC
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" coc - prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" nerdcommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>

" telescope
"nnoremap <leader>ff <cmd>Telescope find_files<cr>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup SIUTSON
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
