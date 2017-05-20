execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on

" specify terminal (helps with tmux and colors)
set term=screen-256color

" syntax highlighting
syntax on

" always show status bar
set laststatus=2

" line numbers
set number
set relativenumber

" tab settings
set tabstop=2
set expandtab

" extra settings for CtrlP
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>r :CtrlPBufTag<CR>

" .vimrc shortcuts
noremap <leader>ev :tabnew $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>
" TODO: autoreload on save ?

" set theme
colo molokai

" highlight trailing whitespace
highlight ExtraWhiteSpace ctermbg=red
match ExtraWhiteSpace /\s\+$/
autocmd BufWinEnter * match ExtraWhiteSpace /\s\+$/
autocmd InsertEnter * match ExtraWhiteSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

" white space strip function
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

