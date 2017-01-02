call plug#begin()
Plug 'tpope/vim-sensible'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'Quramy/tsuquyomi'

Plug 'Shougo/vimproc'

Plug 'leafgarland/typescript-vim'

Plug 'Raimondi/delimitMate'

Plug 'sickill/vim-monokai'

Plug 'ervandew/supertab'

call plug#end()

syntax enable
colorscheme monokai

let delimitMate_expand_cr = 1

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
