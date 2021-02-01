call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-vinegar'

Plug 'rust-lang/rust.vim'

Plug 'arzg/vim-rust-syntax-ext'

Plug 'davemo88/rust-fade'

Plug 'Valloric/YouCompleteMe'

call plug#end()

syntax enable
colorscheme fade 

" show which syntax rules are used under the cursor.
" :call SynStack()
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" use 4 spaces instead of tabs
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

set pastetoggle=<F2>

let g:ycm_goto_buffer_command='split-or-existing-window'
let g:ycm_autoclose_preview_window_after_insertion = 1

augroup vimrc_autocmd
    autocmd!
    autocmd FileType rust nnoremap <silent> gd :YcmCompleter GoToDefinition<CR>
    autocmd FileType rust nnoremap <silent> <leader>gd :YcmCompleter GetDoc<CR>
augroup END

let mapleader = ","
nnoremap <silent> <leader>f :FZF<cr>
