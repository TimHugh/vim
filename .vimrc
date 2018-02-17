set nocompatible
syntax on
set nowrap
set encoding=utf8

""" Vundle configuration

" Vundle requires filetype off
filetype off

" add Vundle dir to path and init
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages itself
Plugin 'VundleVim/Vundle.vim'

Plugin 'jiangmiao/auto-pairs'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-endwise'
Plugin 'kien/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'

" language support
Plugin 'rhysd/vim-crystal'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ngmy/vim-rubocop'
Plugin 'fatih/vim-go'

" enhanced selectors
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'lucapette/vim-textobj-underscore'

call vundle#end()

filetype plugin indent on

let mapleader=","

" specify terminal (helps with tmux and colors)
set term=screen-256color
colorscheme elflord

set noerrorbells novisualbell

set laststatus=2
set ruler number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" TODO: make these language-specific
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start

" set swap file directory to keep git working directories clean
set directory=$HOME/.vim/swapfiles//

" default to system clipboard
set clipboard=unnamed

" search settings
set hlsearch
set incsearch
set ignorecase
" shortcut to clear search results aka visual clutter
nmap <silent> <leader>/ :nohlsearch<CR>

" improved search with 'ag' executable
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0

  command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

" search cwd for highlighted word
nnoremap <leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" join lines with comma delimiter
nnoremap <leader>J :s/\n/, /<CR>

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

" open git log in quickfix
nnoremap <leader>gl :Glog<CR>:copen<CR>

" tagbar settings
nnoremap <leader>R :TagbarOpenAutoClose<CR>

" netrw settings
nnoremap <leader>v :Vex<CR>
let g:netrw_browse_split = 4
let g:netrw_winsize = 15
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_preview = 1
let g:netrw_altv = 1

" .vimrc shortcuts
noremap <leader>ev :tabnew $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>
autocmd BufWritePost .vimrc source %

" highlight trailing whitespace
highlight ExtraWhiteSpace ctermbg=DarkRed
match ExtraWhiteSpace /\s\+$/
autocmd BufWinEnter * match ExtraWhiteSpace /\s\+$/
autocmd InsertEnter * match ExtraWhiteSpace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/

" auto trim white space on file save
function! TrimWhiteSpace()
  " TODO: newline at end of file
  " TODO: maintain cursor position
	%s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" auto run rubocop when saving ruby files
if executable('rubocop')
  " autocmd BufWritePost *.rb :RuboCop
  let g:vimrubocop_extra_args = '-D'
endif

" allow JSX syntax in .JS files
let g:jsx_ext_required = 0

" Highlight word under cursor
nnoremap <leader>h :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: on'
    return 1
  endif
endfunction
