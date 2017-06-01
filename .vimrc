execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on

" let mapleader=" "

" specify terminal (helps with tmux and colors)
set term=screen-256color

set laststatus=2
set ruler

set noerrorbells
set novisualbell

set number
set relativenumber

" TODO: make these language-specific
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" set swap file directory
set directory=$HOME/.vim/swapfiles//

syntax on
set hlsearch
set incsearch
set ignorecase
nmap <silent> ,/ :nohlsearch<CR>

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" more natural window splitting
set splitbelow
set splitright
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" extra settings for CtrlP
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>r :CtrlPBufTag<CR>
let g:ctrlp_show_hidden=1

" tagbar settings
nnoremap <leader>T :TagbarOpenAutoClose<CR>

" .vimrc shortcuts
noremap <leader>ev :tabnew $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>
" TODO: autoreload on save ?

" highlight trailing whitespace
highlight ExtraWhiteSpace ctermbg=red
match ExtraWhiteSpace /\s\+$/
autocmd BufWinEnter * match ExtraWhiteSpace /\s\+$/
autocmd InsertEnter * match ExtraWhiteSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

" white space strip function
function! TrimWhiteSpace()
  " TODO: newline at end of file
  " TODO: maintain cursor position
	%s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

