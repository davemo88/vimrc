call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'rust-lang/rust.vim'

Plug 'arzg/vim-rust-syntax-ext'

Plug 'Valloric/YouCompleteMe'

Plug 'davemo88/rust-fade'

call plug#end()

syntax enable
colorscheme fade 

" use 4 spaces instead of tabs
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

" make it a lil bigger
let g:NERDTreeWinSize=42

set pastetoggle=<F2>

let g:ycm_goto_buffer_command='split-or-existing-window'
let g:ycm_autoclose_preview_window_after_insertion = 1

augroup vimrc_autocmd
" open a NERDTree window on start
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"    autocmd FileType rust nnoremap <silent> gd :YcmCompleter GoToDefinition<CR>
"    autocmd FileType rust nnoremap <silent> <leader>gd :YcmCompleter GetDoc<CR>
augroup END
" toggle NERDTRee window
map <C-n> :NERDTreeToggle<CR>

" show which syntax rules are used under the cursor.
" :call SynStack()
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
