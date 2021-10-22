set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor= " fat cursor
set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20
set relativenumber
set nu " better look at line you're currently on
set nohlsearch " don't highlight searched phrase all the time
set noerrorbells
set hidden
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8 " keeps scrolling 8 lines away from top/bottom
set signcolumn=yes
set clipboard+=unnamedplus
set timeoutlen=1000
set ttimeoutlen=5
"hi Normal guibg=NONE ctermbg=NONE


" --- nerdcommenter ---
filetype plugin on
"set omnifunc=syntaxcomplete#Complete



"let g:markdown_folding = 1
"let g:tex_fold_enabled = 1
"let g:fastfold_savehook = 1
" vimwiki conf - notes
"let g:vimwiki_list = [{'path': '~/workspace/dox/notes/',
                      "\ 'syntax': 'markdown', 'ext': '.md'}]

" snippets
let g:UltiSnipsExpandTrigger="<C-s>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<C-l>"

" html live preview
let g:bracey_eval_on_save = 1
let g:bracey_auto_start_server = 1

" vim markdown - disable folding
let g:vim_markdown_folding_disabled = 1

" change cursor look in insert mode
":set guicursor=i:block
":autocmd InsertEnter,InsertLeave * set cul!

" html closing tags

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
" end of html close tags

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


" --- colorizer ---
lua require'colorizer'.setup()

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup markdown
    au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
    au BufNewFile,BufFilePre,BufRead *.md set wrap
augroup END

augroup SIUTSON
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
