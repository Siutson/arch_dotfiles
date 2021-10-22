syntax on
colorscheme onedark

if (has("termguicolors"))
    set termguicolors
endif

let g:airline_theme='onedark'

let g:onedark_color_overrides = {
\ "black": {"gui": "#2F343F", "cterm": "235", "cterm16": "0" },
\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
\}
