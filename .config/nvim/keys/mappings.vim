let mapleader = " "


" --- tabs ---
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>o :bp<CR>
nmap <leader>p :bn<CR>
nmap <leader>w :bd<CR>

nmap <leader>l <C-w>l<CR>
nmap <leader>k <C-w>h<CR>


" --- CoC ---
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent>gd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" --- coc - prettier ---
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" --- nerdcommenter ---
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>

" --- telescope ---
 "nnoremap <leader>ff :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<CR>

" finds files in current dir
nnoremap <leader>tf <cmd>Telescope find_files<cr>
" live grep all files for specified thing
nnoremap <leader>tg <cmd>lua require('telescope.builtin').live_grep()<cr>
