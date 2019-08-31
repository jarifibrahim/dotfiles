"Vundle Initialization
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin for Git
Plugin 'tpope/vim-fugitive'
" Molokai theme for vim
Plugin 'fatih/molokai'
" Plugin for Golang
Plugin 'fatih/vim-go'
" Plugin for golang auto-completion
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
Plugin 'airblade/vim-gitgutter'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-airline/vim-airline'
Plugin 'morhetz/gruvbox'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:gruvbox_contrast_dark='hard'
" Color scheme (theme)
colorscheme gruvbox
set background=dark    " Setting dark mode

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"

set relativenumber number ruler hlsearch incsearch smartcase ignorecase

" exit insert, dd line, enter insert
inoremap <c-d> <esc>ddi

" Move to the start of the line
noremap H ^
" Move to the end of the line
noremap L g_

" Use ; instead of :
noremap ; :

" highlight the current line number
hi CursorLineNR guifg=#ffffff

" Use ag for searches
"let g:ackprg = 'ag --vimgrep --smart-case'

" highlight text over 100 characters
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)

" Disable arrow keys
noremap <Up>	<Nop>
noremap <Down>	<Nop>
noremap <Left>	<Nop>
noremap <Right>	<Nop>

nnoremap <F3> :set hlsearch!<CR>

noremap <c-p> :Files<CR>

set tabstop=2
set shiftwidth=2
set autoindent

" Gdiff vertically
set diffopt+=vertical

" Use leader y to copy to system clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p

"let g:ycm_autoclose_preview_window_after_insertion = 1

" show smarter tab line
let g:airline#extensions#tabline#enabled = 1

" Tab navigation like Firefox.
noremap <c-s-tab> :bprev<CR>
nnoremap <c-tab>   :bnext<CR>
