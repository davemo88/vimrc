call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'rust-lang/rust.vim'

Plug 'peitalin/vim-jsx-typescript'

Plug 'Raimondi/delimitMate'

call plug#end()

syntax enable
colorscheme garbage 

" autocomplete parens and the like and insert a newline 
let delimitMate_expand_cr = 1

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

set pastetoggle=<F2>

augroup YcmGoto
    autocmd!
    autocmd FileType rust nnoremap <silent> gd :YcmCompleter GoToDefinition<CR>
    autocmd FileType rust nnoremap <silent> <leader>gd :YcmCompleter GetDoc<CR>
augroup END

let g:ycm_goto_buffer_command='split-or-existing-window'
let g:ycm_autoclose_preview_window_after_insertion = 1

" show which syntax rules are used under the cursor.
" :call SynStack()
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:ycm_language_server =
\ [
\   {
\     'name': 'rust',
\     'cmdline': ['rust-analyzer'],
\     'filetypes': ['rust'],
\     'project_root_files': ['Cargo.toml']
\   }
\ ]
