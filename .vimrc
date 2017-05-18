execute pathogen#infect()
filetype plugin indent on

" specify terminal (fixes conflicts with tmux)
set term=screen-256color

" syntax highlighting
syntax on

" always show status bar
set laststatus=2

" line numbers
set number
set relativenumber

" .vimrc shortcuts
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" TODO: autoreload on save ?

" set theme
colo delek

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

