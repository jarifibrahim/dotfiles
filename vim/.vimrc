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
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-airline/vim-airline'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Color scheme (theme)
colorscheme molokai

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

" Search from the project root instead of cwd
"let g:ag_working_path_mode="r"

" Start search by pressing \
nnoremap \ :Rg<CR>

set tabstop=2
set shiftwidth=2
set autoindent
