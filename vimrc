call plug#begin()
Plug 'tpope/vim-sensible'

" On-demand loading
Plug 'scrooloose/nerdtree'

Plug 'Shougo/vimproc'

Plug 'Raimondi/delimitMate'

Plug 'sickill/vim-monokai'

" Plug 'Valloric/YouCompleteMe'

" Plug 'Rip-Rip/clang_complete'

call plug#end()

" sweet colorscheme like sublime text :D
syntax enable
colorscheme monokai

" autocomplete parens and the like and insert a newline 
let delimitMate_expand_cr = 1

" use 4 spaces instead of tabs
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab

" fix background color when scrolling
" http://superuser.com/questions/457911/in-vim-background-color-changes-on-scrolling
set t_ut=

" open a NERDTree window with vi
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" toggle NERDTRee window
map <C-n> :NERDTreeToggle<CR>
" make it a lil bigger
let g:NERDTreeWinSize=42

" turn off vim-latex marking
let g:Imap_UsePlaceHolders = 0
let g:Tex_DefaultTargetFormat='pdf'

" toggle paste mode
set pastetoggle=<F2>

" let g:clang_library_path="/usr/lib/llvm-5.0/lib/libclang.so.1"
