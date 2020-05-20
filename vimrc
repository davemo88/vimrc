call plug#begin('~/.vim/plugged')

Plug 'sickill/vim-monokai'

Plug 'scrooloose/nerdtree'

Plug 'rust-lang/rust.vim'

" Plug 'racer-rust/vim-racer'

Plug 'Valloric/YouCompleteMe'

Plug 'universal-ctags/ctags'

Plug 'majutsushi/tagbar'

Plug 'Raimondi/delimitMate'

call plug#end()

syntax enable
colorscheme garbage 

let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '~/.local/bin/ctags',
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
" autocomplete parens and the like and insert a newline 
let delimitMate_expand_cr = 1
" 
" use 4 spaces instead of tabs
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" open a NERDTree window on start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" toggle NERDTRee window
map <C-n> :NERDTreeToggle<CR>
" make it a lil bigger
let g:NERDTreeWinSize=42

nmap <F8> :TagbarToggle<CR>
set pastetoggle=<F2>

augroup YcmGoto
    autocmd!
    autocmd FileType rust nnoremap <silent> gd :YcmCompleter GoToDefinition<CR>
    autocmd FileType rust nnoremap <silent> <leader>gd :YcmCompleter GetDoc<CR>
augroup END

let g:ycm_goto_buffer_command='split-or-existing-window'

" show which syntax rules are used under the cursor.
" :call SynStack()
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
