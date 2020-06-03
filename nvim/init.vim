"Vundle Initialization
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

" let Vundle manage vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin for Git
Plugin 'tpope/vim-fugitive'
Plugin 'machakann/vim-highlightedyank'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'wakatime/vim-wakatime'
Plugin 'tpope/vim-rhubarb'

" Plugin for Golang
Plugin 'fatih/vim-go'
Plugin 'ycm-core/YouCompleteMe'

Plugin 'SirVer/ultisnips'
Plugin 'takac/vim-hardtime'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Color scheme (theme)
colorscheme gruvbox

let g:go_fmt_command = "goimports"   " Run goimports along gofmt on each save
let g:go_auto_type_info = 1          " Automatically get signature/type info for object under cursor

set relativenumber number ruler hlsearch incsearch smartcase ignorecase


" Move to the start of the line
"noremap H ^
" Move to the end of the line
"noremap L g_

" Use ; instead of :
noremap ; :
noremap , ;
noremap : ,

" highlight the current line number
hi CursorLineNR guifg=#ffffff

" highlight text over 100 characters
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
let mapleader = " "

" Disable arrow keys
noremap <Up>	<Nop>
noremap <Down>	<Nop>
noremap <Left>	<Nop>
noremap <Right>	<Nop>

nnoremap <F3> :set hlsearch!<CR>
noremap <c-p> :Files<CR>

noremap <leader>o :GoDeclsDir<CR>
noremap <leader>g :GoDecls<CR>
noremap <leader>r :GoReferrers<CR>
noremap <leader>f :R<CR>
" Use leader y to copy to system clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p

"https://github.com/fatih/vim-go-tutorial#vimrc-improvements-4
autocmd BufNewFile,BufRead *.go setlocal autoindent noexpandtab tabstop=4 shiftwidth=4

" Gdiff vertically
set diffopt+=vertical

"let g:ycm_autoclose_preview_window_after_insertion = 1

" show smarter tab line
let g:airline#extensions#tabline#enabled = 1

" Tab navigation like Firefox.
"noremap <C-s-tab> :bprev<CR>
"nnoremap <C-tab>  :bnext<CR>
let $FZF_DEFAULT_COMMAND="rg --files"

" Search for highlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Gopls for vim https://github.com/golang/tools/blob/master/gopls/doc/vim.md#vim-go
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'

"au filetype go inoremap <buffer> . .<C-x><C-o>

" Match autocomplete as characters are typed
" https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" Used by gopls and vim-go
" set completeopt=longest,menuone

" Reverse the direction of completion.
" let g:SuperTabDefaultCompletionType = "<c-n>"

" Disable preview https://github.com/junegunn/fzf.vim#preview-window
let g:fzf_preview_window = ''

" Highlight build constraints
" https://github.com/fatih/vim-go-tutorial#beautify-it
let g:go_highlight_build_constraints = 1

" Enable vim hardtime which blocks repeated characters
let g:hardtime_default_on = 1
let g:hardtime_showmsg=1

" Run meta linter => autosave_enabled doesn't seem to work. It runs errCheck
" always.
" https://github.com/fatih/vim-go-tutorial#check-it
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_deadline = "5s"
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']

" Show info about the indentifier
"https://github.com/fatih/vim-go/wiki/Tutorial#identifier-resolution
set updatetime=100

" From https://stackoverflow.com/a/22253548
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Highlight text as you type the substitute ":s/.../"
set inccommand=nosplit

" Consider all numerals as decimal
" Useful in <c-x> and <c-a>
set nrformats=
