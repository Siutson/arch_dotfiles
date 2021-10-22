let mapleader = " "

" fzf
nnoremap <C-p> :Files<CR>

" markdown
autocmd FileType markdown inoremap ;- <ESC>xxa<Tab><Tab>-<Space>
autocmd FileType markdown inoremap ;h #<Space>
autocmd FileType markdown inoremap ;sh ##<Space>
autocmd FileType markdown inoremap ;ssh ###<Space>
autocmd FileType markdown inoremap ;1 <ESC>xxa<Tab><Tab>1.<Space>
autocmd FileType markdown inoremap ;n1 <ESC>k0vf.yjph<C-a>A<Space>
autocmd FileType markdown inoremap ;b ****<Space><ESC>2hi
autocmd FileType markdown inoremap ;i **<Space><ESC>hi
autocmd FileType markdown inoremap ;eb ******<Space><ESC>3hi
autocmd FileType markdown inoremap ;pic ![Title](path/to/file.png)<ESC>0wcw
autocmd FileType markdown inoremap ;c ``<Space><ESC>hi

autocmd FileType tex inoremap ;dc \documentclass[a4paper,12pt]{article}<Enter>
autocmd FileType tex inoremap ;bd \begin{document}<Enter><Enter><Enter><Enter>\end{document}<ESC>2ki
autocmd FileType tex inoremap ;t \title{}<Enter><Enter>\maketitle<Enter><ESC>3k$i
autocmd FileType tex inoremap ;a \author{Daniel Siutkowski}<Enter>
autocmd FileType tex inoremap ;d \date{\today}<Enter>
autocmd FileType tex inoremap ;p \usepackage{}<ESC>i
autocmd FileType tex inoremap ;s \section{}<ESC>i
autocmd FileType tex inoremap ;t \begin{tabular}{  }<Enter>\hline<Enter><Enter>\end{tabular}<Esc>3k$hi


" --- tabs ---
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>o :bp<CR>
nmap <leader>p :bn<CR>
nmap <leader>w :bd<CR>

nmap <leader>l <C-w>l<CR>
nmap <leader>k <C-w>h<CR>

nmap <leader>k <C-w>l<CR>
nmap <leader>j <C-w>h<CR>

" --- running python code with F9 shortcut ---
"imap <F9> <Esc>:w<CR>:!clear;python %<CR>
"imap <F9> <Esc>:w<CR>:!python %<CR>
"map <F9> <Esc>:w<CR>:!node %<CR>
"autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

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
"nnoremap <leader>tf <cmd>Telescope find_files<cr>
" live grep all files for specified thing
"nnoremap <leader>tg <cmd>lua require('telescope.builtin').live_grep()<cr>
