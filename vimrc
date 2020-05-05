set exrc

call plug#begin()

Plug 'sickill/vim-monokai'

Plug 'scrooloose/nerdtree'

Plug 'rust-lang/rust.vim'

Plug 'Valloric/YouCompleteMe'

Plug 'universal-ctags/ctags'

Plug 'majutsushi/tagbar'

" Plug 'tpope/vim-sensible'

" Plug 'Shougo/vimproc'

" Plug 'Raimondi/delimitMate'
"
call plug#end()

" " sweet colorscheme like sublime text :D
colorscheme monokai
"syntax enable

"
let g:ycm_language_server =
  \ [
  \   {
  \     'name': 'rust',
  \     'cmdline': [ 'rust-analyzer' ],
  \     'filetypes': [ 'rust' ],
  \     'project_root_files': [ 'Cargo.toml' ]
  \   }
  \ ]

let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/local/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }
" 
" " autocomplete parens and the like and insert a newline 
" let delimitMate_expand_cr = 1
" 
" " use 4 spaces instead of tabs
" set tabstop=8
" set softtabstop=0
" set expandtab
" set shiftwidth=2
" set smarttab
" 
" fix background color when scrolling
" http://superuser.com/questions/457911/in-vim-background-color-changes-on-scrolling
set t_ut=
" 
" open a Tagbar window on start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | TagbarOpen | endif
" open a NERDTree window on start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" toggle NERDTRee window
map <C-n> :NERDTreeToggle<CR>
" make it a lil bigger
let g:NERDTreeWinSize=42

nmap <F8> :TagbarToggle<CR>
" 
" " turn off vim-latex marking
" let g:Imap_UsePlaceHolders = 0
" let g:Tex_DefaultTargetFormat='pdf'
" 
" " toggle paste mode
" set pastetoggle=<F2>
