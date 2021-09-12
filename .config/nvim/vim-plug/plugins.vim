call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'

" js-highlighting
Plug 'yuezk/vim-js'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'jiangmiao/auto-pairs'

Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
"Plug 'danilo-augusto/vim-afterglow'

" Plug 'neovim/nvim-lspconfig'

" barbar (tabs)
"Plug 'kyazdani42/nvim-web-devicons'
"Plug 'romgrk/barbar.nvim'

" ctrlp/fuzzyfinder
"Plug 'ctrlpvim/ctrlp.vim'

" nerdtree
"Plug 'preservim/nerdtree'

" colorizer
Plug 'norcalli/nvim-colorizer.lua'

Plug 'ryanoasis/vim-devicons'

" coc-nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Discord presence
"Plug 'andweeb/presence.nvim'

" airLINE
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'lervag/vimtex'

" markdown preview
Plug 'JamshedVesuna/vim-markdown-preview'
call plug#end()
