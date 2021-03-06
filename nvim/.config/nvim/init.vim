set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin("~/.vim/plugged")
" Plugin for Git
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
" Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-rhubarb'
" Highlight unique character in every line.
Plug 'unblevable/quick-scope'

" Plugin for Golang
Plug 'fatih/vim-go'
Plug 'ycm-core/YouCompleteMe'

Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'

Plug 'morhetz/gruvbox'
Plug 'fatih/molokai'
Plug 'vim-airline/vim-airline'

call plug#end()

" Color scheme (theme)
" colorscheme gruvbox
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
" Highlight only on some keys.
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:go_fmt_command = "goimports"   " Run goimports along gofmt on each save
let g:go_auto_type_info = 1          " Automatically get signature/type info for object under cursor
" Highlight build constraints
" https://github.com/fatih/vim-go-tutorial#beautify-it
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" Use nvim terminal instead of background job.
let g:go_term_enabled = 1
let g:go_term_close_on_exit = 0

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
" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
set colorcolumn=100

let mapleader = " "

" Disable arrow keys
noremap <Up>	<Nop>
noremap <Down>	<Nop>
noremap <Left>	<Nop>
noremap <Right>	<Nop>

nnoremap <F3> :set hlsearch!<CR>
noremap <c-p> :Files<CR>
inoremap <c-f> <ESC>:BLines<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
" Vim-go
noremap <leader>o :GoDeclsDir<CR>
" leader d is by default mapped to YcmShowDetailedDiagnostic
noremap <leader>d :GoDecls<CR>
noremap <leader>r :GoReferrers<CR>
noremap <leader>t :GoTestFunc<CR>

" Vim-fugitive
noremap <leader>v :Gbrowse<CR>
noremap <leader>b :Gblame<CR>
noremap <leader>gs :G<CR>
noremap <leader>w :GoBuild<CR>
noremap <leader>gd :G diff<CR>
noremap <leader>gca :G checkout -- .<CR>

"
noremap <leader>f :R<CR>
" Use leader y to copy to system clipboard
" noremap <Leader>y "+y
" noremap <Leader>p "+p
set clipboard+=unnamedplus

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"https://github.com/fatih/vim-go-tutorial#vimrc-improvements-4
" autocmd BufNewFile,BufRead *.go setlocal
set autoindent noexpandtab tabstop=4 shiftwidth=4

" Gdiff vertically
set diffopt+=vertical

"let g:ycm_autoclose_preview_window_after_insertion = 1

" show smarter tab line
let g:airline#extensions#tabline#enabled = 1

let $FZF_DEFAULT_COMMAND="rg --files"
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

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

" Enable vim hardtime which blocks repeated characters
" let g:hardtime_default_on = 1
" let g:hardtime_showmsg=1

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
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Highlight text as you type the substitute ":s/.../"
set inccommand=nosplit

" Consider all numerals as decimal
" Useful in <c-x> and <c-a>
set nrformats=

" Give more space for displaying messages.
set cmdheight=1

" Open vsplit on right.
set splitright

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
