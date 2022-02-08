call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-vinegar'

Plug 'rust-lang/rust.vim'

Plug 'arzg/vim-rust-syntax-ext'

Plug 'davemo88/rust-fade'

Plug 'Valloric/YouCompleteMe'

Plug 'leafgarland/typescript-vim'

Plug 'tomlion/vim-solidity'

call plug#end()

syntax enable
syntax on
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

" remember to install rust analyzer for the toolchain:
" e.g. rustup +nightly component add rust-analyzer-preview
 let g:ycm_rust_toolchain_root=$HOME."/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/"
"let g:ycm_rust_toolchain_root=$HOME."/.rustup/toolchains/nightly-2021-11-12-x86_64-unknown-linux-gnu/"
let g:ycm_always_populate_location_list = 1

let mapleader = ","
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
let $FZF_DEFAULT_COMMAND='fd --type f'
command W w
command Q q
map <silent> <leader>/ :s/^/\/\//<cr>
