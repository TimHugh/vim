set nocompatible
syntax on
set encoding=utf8
set term=screen-256color
colorscheme delek
set noerrorbells novisualbell

let mapleader=","
inoremap jj <esc>


""" START VUNDLE CONFIG
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages itself
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-endwise'
Plugin 'kien/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/StripWhiteSpaces'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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
""" END VUNDLE CONFIG


""" START PLUGIN CONFIG

" tagbar config
nnoremap <leader>R :TagbarOpenAutoClose<CR>

" vim-jsx config
let g:jsx_ext_required = 0

" nerdtree config
map <leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" ctrlp.vim config
let g:ctrlp_map = '<leader>t'
let g:ctrlp_show_hidden=1
nnoremap <leader>r :CtrlPBufTag<CR>
let g:ctrlp_buftag_types = {
\   'go' : '--language-force=go --go-types=d'
\ }
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" StripWhiteSpaces config
let g:strip_trailing_lines = 1

" vim-fugitive config
nnoremap <leader>gl :Glog<CR>:copen<CR>

""" END PLUGIN CONFIG


" toggle word wrap
set nowrap
nnoremap <leader>W :set wrap!<CR>

" auto display line numbers in active buffer
set relativenumber
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained * set relativenumber
"   autocmd BufLeave,FocusLost * set norelativenumber
" augroup END

" tab stuff
set tabstop=2
set shiftwidth=2
set expandtab autoindent smartindent

" more natural backspace behaviour
set backspace=indent,eol,start

" set swap file directory to keep git working directories clean
set directory=$HOME/.vim/swapfiles//

" default to system clipboard
set clipboard=unnamed

" search settings
set hlsearch incsearch ignorecase
nmap <silent> <leader>/ :nohlsearch<CR>

" Use ag for search
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
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

" .vimrc editing shortcuts
noremap <leader>ev :tabnew $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>
" autocmd BufWritePost .vimrc source %
