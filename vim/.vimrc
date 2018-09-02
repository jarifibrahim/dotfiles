
" Source: http://stackoverflow.com/questions/164847/what-is-in-your-vimrc [1]
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

"""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""

call plug#begin('~/dev/tools/vim/plugins')

Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
 \| Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter', { 'on': 'Gblame' }
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
" Plug 'vim-scripts/c.vim'  don't need default annoying templates
Plug 'ntpeters/vim-better-whitespace'

Plug 'jiangmiao/auto-pairs'

Plug 'Shougo/vimproc.vim', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make',
    \     'linux' : 'make',
    \     'unix' : 'gmake',
    \    },
    \ }


Plug 'vim-scripts/L9'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
" Plug 'vim-scripts/FuzzyFinder'
Plug 'vim-scripts/delimitMate.vim'
Plug 'mitsuhiko/vim-jinja'
Plug 'Yggdroot/indentLine'
Plug 'jwhitley/vim-matchit'
Plug 'vim-scripts/editorconfig-vim'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'

Plug 'Valloric/YouCompleteMe', {
    \ 'for': [
    \    'python', 'javascript', 'ruby',
    \    'sh', 'cpp', 'bash', 'html'
    \ ],
    \ 'build' : {
    \     'linux' : './install.py --clang-completer --tern-completer --gocode-completer',
    \    },
    \ }

Plug 'marijnh/tern_for_vim', {'for': ['javascript'], 'do': 'npm install'}


" Plug 'klen/python-mode', { 'for': ['python'] }
Plug 'python-mode/python-mode', {'branch': 'develop', 'for': ['python']}
Plug 'vim-scripts/html-xml-tag-matcher', { 'for': ['html', 'xml', 'erb'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'pangloss/vim-javascript', { 'for': ['js', 'html', 'css'] }
Plug 'dbakker/vim-projectroot'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/unite-outline'

" try fzf
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/neomru.vim'
Plug 'fidian/hexmode'
Plug 'sjl/gundo.vim'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'stephpy/vim-yaml'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6', { 'for': ['js', 'es6'] }

Plug 'supermomonga/vimshell-pure.vim'
 \| Plug 'Shougo/vimshell.vim'

Plug 'MattesGroeger/vim-bookmarks'
Plug 'fatih/vim-go'

"""""""""""""""""""""""""""""""
" Include user's extra bundle
"""""""""""""""""""""""""""""""
if filereadable(expand("~/.nvimrc.local"))
  source ~/.nvimrc.local
endif
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""
" Vim behaviours
"""""""""""""""""""""""""""
set nowrap

"turn off the annoying mouse
set mouse=v

" map leader from default \ to , for easy keypress
let mapleader = ','

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set fileencodings=utf-8,latin1
    set fileencoding=utf-8
endif

"" Fix backspace indent
" set backspace=indent,eol,start vim-sensible

if has('nvim')
    runtime! plugin/python_setup.vim
endif

" current buffer need not be saved e# just works
set hidden

" no swaps and backups
set noswapfile
set nobackup

" Key bindings
"use ;<x> instead of :<x>
nnoremap ; :

" vim * ingores swp and .o files
set wildignore=*.swp,*.o,.svn,.git,*.a,*.class,*.obj,*.jgp,*.png,*.pyc

" <tab> complete only up to the point of ambiguity
" also show the possible completion list
" set wildmenu sensible
set wildmode=longest:list,list:full

" show filename in xterm's title
set title

" This shows what you are typing as a command.  I love this!
set showcmd

" Folding Stuf
set foldmethod=manual

""""""""""""""""""""""""""""""""
" clipboard
""""""""""""""""""""""""""""""""
" allow copy-paste from clipboard
set clipboard=unnamed

vnoremap YY "+y<CR>
noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" allow deleting selection without updating the clipboard (yank buffer)
" vnoremap x "_x
" vnoremap X "_X

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Visual Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

""""""""""""""""""""""""""""
" Line numbers
""""""""""""""""""""""""""""
" set ruler sensible
set numberwidth=3
set cpoptions+=n

nmap <c-l> :set invnumber<CR>
"nnoremap <c-m> :set invrelativenumber<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color column > 80
""""""""""""""""""""""""""""""""
let &colorcolumn="80,".join(range(101,999),",")
call matchadd('ColorColumn', '\%81v', 55)


""""""""""""""""""""""""
"  searching
""""""""""""""""""""""""

" ignorecase while search unless there is a change in the case
set ignorecase
set smartcase

set hlsearch
" set incsearch vim-sensible
set showmatch

" press leader-n to disable the highlighted search
nmap <silent> <leader>s :silent :nohlsearch<CR>

""""""""""""""""""""""""""""""""""""""
" indentation
""""""""""""""""""""""""""""""""""""""
" NOTE: use editorconfig plugin and .editorconfig file
set noautoindent smartindent
set expandtab
set nojoinspaces
set shiftround
" started getting comfortable with 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

" shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" use w!! to sudo save file
cmap w!! w !sudo tee % >/dev/null



""""""""""""""""""""""""""""
" history
""""""""""""""""""""""""""""
" set history=1000  vim-sensible
set undolevels=1000

" terminal emulation
nnoremap <silent> <leader>ss :VimShell<CR>
inoremap <f8> <esc>:VimShell<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""
" Custom filetypes syntax highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""

if &diff
    " only interested in diff colours
    syntax off
endif

"syntax highlight shell scripts as per POSIX,
"not the original Bourne shell which very few use
let g:is_posix = 1


""""""""""""""""""""""""""
" scroll faster
""""""""""""""""""""""""""
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


""""""""""""""""""""""""""""""""""""""""""
"  use buffer instead of tabs
""""""""""""""""""""""""""""""""""""""""""
" To open a new empty buffer
nmap <leader>n :enew<cr>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>x :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>


" sort
vnoremap <Leader>^ :sort<cr>

""""""""""""""""""""""""""""""""""
" whitespace
""""""""""""""""""""""""""""""""""
" NOTE: MUST be inserted BEFORE the colorscheme command

",w catch trailing whitespace press <leader>w
nmap <silent> <leader>w :set nolist!<CR>

" Insert date by pressing <F2>
inoremap <F2> <C-R>=strftime("%a %d/%b/%y %X")<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" Emmet
let g:user_emmet_leader_key='<C-Z>'

"*****************************************************************************
" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocmd Rules
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Enable just for html/css
augroup vimrc-emmet
    autocmd FileType erb,html,css EmmetInstall
augroup END


""""""""""""""""""""""""""""""
" auto spellcheck for docs
"""""""""""""""""""""""""""""
augroup vimrc-autospell-check
  au BufNewFile,BufRead COMMIT_EDITMSG  setlocal spell
  autocmd FileType wiki,md,rst,txt,adoc setlocal spell
  autocmd ColorScheme * highlight SpellBad ctermbg=124 guibg=magenta
augroup END


autocmd FileType j2 set filetype=jinja
autocmd FileType yml set filetype=yaml

" Automatically reload .nvimrc when it changes
augroup vimrc-autoreload-nvimrc
  autocmd! BufWritePost .nvimrc source %
augroup END

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

augroup vimrc-whitespace
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=124 guibg=magenta
  au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  au InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

  " Remove any trailing whitespace that is in the file
  autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
augroup END

" Box is fast enough, do syntax highlight syncing from start
" augroup vimrc-sync-fromstart
"   autocmd!
"   autocmd BufEnter * :syntax sync fromstart
" augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
  autocmd BufRead,BufNewFile *.md call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"" make/cmake
augroup vimrc-vagrantfile
  autocmd!
  autocmd BufNewFile,BufRead Vagrantfile setlocal filetype=ruby
augroup END

" reload the file if it changes outside vim
" set autoread  vim-sensible


""""""""""""""""""""""""""""
" zenburn
""""""""""""""""""""""""""""
" set t_Co=256
" let g:zenburn_high_Contrast=1
" let g:zenburn_alternate_Visual=1
" colors  zenburn


""""""""""""""""""""""""""""""
" theme stuff "
""""""""""""""""""""""""""""""
" colorscheme jellybeans
"set background=dark

""""""""""""""""""""""""""""""
" vimwiki stuff "
""""""""""""""""""""""""""""""

" Run multiple wikis "
let g:vimwiki_list = [
    \{'path': '/home/sthaha/dev/data/private/docs/vim-wiki/work.wiki'},
    \{'path': '/home/sthaha/dev/data/private/docs/vim-wiki/developer.wiki'},
    \{'path': '/home/sthaha/dev/data/private/docs/vim-wiki/personal.wiki'},
\]

au BufRead,BufNewFile *.wiki set filetype=vimwiki
" :autocmd FileType vimwiki nmap <leader>d :VimwikiMakeDiaryNote

function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction

:autocmd FileType vimwiki nmap <leader>c :call ToggleCalendar()<CR>

""""""""""""""""""""""""""""""
" history: gundo
""""""""""""""""""""""""""""""
nnoremap <F5> :GundoToggle<CR>


""""""""""""""""""""""""""""""
" nerdcommenter
""""""""""""""""""""""""""""""
let NERDSpaceDelims = 1

""""""""""""""""""""""""""""""
" NertTree
""""""""""""""""""""""""""""""
map <Leader>t <esc>:NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" Git gutter
""""""""""""""""""""""""""""""
map <Leader>g <esc>:GitGutterToggle<CR>
let g:gitgutter_enabled = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

""""""""""""""""""""""""""""""
" jedi-vim don't show doc
""""""""""""""""""""""""""""""
autocmd FileType * setlocal completeopt-=preview

"""""""""""""""""""""""""""""""
" You Complete Me
"""""""""""""""""""""""""""""""

" do not load ycm for ruby

" augroup plug_xtype
  " autocmd FileType * if expand('<amatch>') != 'ruby' | call plug#load('YouCompleteMe') | execute 'autocmd! plug_xtype' | endif
" augroup END

let g:ycm_min_num_of_chars_for_completion = 3
" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]

let g:UltiSnipsSnippetDirectories=[$HOME.'/dev/tools/vim/data/ultisnips']
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-s>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""""""""""""""""""""""""""""""""
" Vim airline
""""""""""""""""""""""""""""""""
" set laststatus=2 sensible
"
" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_theme = 'ubaryd'
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

"""""""""""""""""""""""""""""
" syntastic
"""""""""""""""""""""""""""""
let g:syntastic_enable_signs            = 1
let g:syntastic_error_symbol            = '✗✗'
let g:syntastic_warning_symbol          = '⚠⚠'
let g:syntastic_style_error_symbol      = '✗'
let g:syntastic_style_warning_symbol    = '⚠'
"
let g:syntastic_auto_loc_list           = 1 " Close the location-list when errors are gone
let g:syntastic_auto_loc_list           = 0
let g:syntastic_check_on_open           = 0
let g:syntastic_check_on_wq             = 0

let g:syntastic_disabled_filetypes      = ['py']
let g:syntastic_loc_list_height         = 5

highlight SyntasticError   ctermbg=darkred ctermfg=white
highlight SyntasticWarning ctermbg=131 ctermfg=255
"
" shell checkers
let g:syntastic_sh_checkers           = ['shellcheck', 'checkbashisms', 'sh']
let g:syntastic_sh_checkbashisms_args = '-x'

" ruby
let g:syntastic_ruby_checkers         = ['mri', 'rubocop']
if executable('rubocop.sh')
    let g:syntastic_ruby_rubocop_exec   = 'rubocop.sh'
endif
let g:syntastic_ruby_rubocop_args     = '--display-cop-names'

" let g:syntastic_enable_perl_checker = 0
" let g:syntastic_perl_checkers = ['perlcritic', 'perl', 'podchecker']


"""""""""""""""""""""""""""""""""
"  Ack.vim
"""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""
"  fzf.vim
"""""""""""""""""""""""""""""""""

nmap <space>s :Buffers<CR>
nmap <space>a :Files<CR>
nmap <space>r :Tags<CR>
" """""""""""""""""""""""""""""""""
""  Unite.vim
"""""""""""""""""""""""""""""""""""
"
"let g:unite_enable_start_insert = 1
"let g:unite_split_rule = "botright"
"let g:unite_force_overwrite_statusline = 0
"let g:unite_winheight = 12
"let g:unite_source_history_yank_enable = 1
"
""let g:unite_abbr_highlight = 'normal'
"call unite#filters#matcher_default#use(['matcher_fuzzy', 'sorter_rank'])
"call unite#custom#profile('default', 'context', { 'marked_icon':'✓'})
"call unite#custom_default_action('directory,directory_mru', 'cd')
"
"nnoremap <space>F :<C-u>Unite -start-insert -auto-resize file<CR>
"nnoremap <space>U :<C-u>Unite -buffer-name=mru  -start-insert file_mru<cr>
"nnoremap <space>s :<C-u>Unite -start-insert -auto-resize buffer<CR>
"nnoremap <space>r :<C-u>Unite register<CR>
"nnoremap <space>y :<C-u>Unite history/yank<CR>
"
"nnoremap <space>e :<C-u>UniteWithBufferDir -start-insert -auto-resize file_rec<CR>
"
"nnoremap <space>a :<C-u>UniteWithProjectDir -buffer-name=files -auto-resize -start-insert file_rec/async:!<cr>
"nnoremap <space>f :<C-u>UniteWithProjectDir -start-insert -auto-resize file_rec/async:!<CR>
"nnoremap <space>B :<C-u>UniteWithProjectDir -start-insert -auto-resize buffer<CR>
"nnoremap <space>g :<C-u>UniteWithProjectDir -start-insert grep:.<cr>
"nnoremap <space>o :<C-u>UniteWithProjectDir -auto-resize outline<CR>
"nnoremap <space>u :<C-u>UniteWithProjectDir -buffer-name=mru  -start-insert file_mru<cr>
"
"call unite#custom_source(
"  \ 'file_rec,file_rec/async,file_mru,file,buffer,grep',
"  \ 'ignore_pattern', join([
"        \ '\.git/',
"        \ '\.sass-cache/',
"        \ 'node_modules/',
"        \ 'tmp/',
"        \ 'bower_components/',
"        \ 'LOCAL_INSTALL/',
"        \ '\.ropeproject/',
"        \ '\.tox/',
"        \ '\.cache/',
"        \ '\.__pycache__/',
"        \ '\.d',
"    \ ], '\|')
"\)
"
"function! s:unite_settings()
"  " Play nice with supertab
"  let b:SuperTabDisabled=1
"
"  " Enable navigation with control-u and control-i in insert mode
"  imap <buffer> <C-u>   <Plug>(unite_select_next_line)
"  imap <buffer> <C-i>   <Plug>(unite_select_previous_line)
"  nmap <buffer> <ESC> <Plug>(unite_exit)
"
"  let b:actually_quit = 0
"  setlocal updatetime=2
"  au! InsertEnter <buffer> let b:actually_quit = 0
"  au! InsertLeave <buffer> let b:actually_quit = 1
"  au! CursorHold  <buffer> if exists('b:actually_quit') && b:actually_quit | close | endif
"endfunction
"
""Custom mappings for the unite buffer
"autocmd FileType unite call s:unite_settings()
"
"function! Unite_ctrlp()
"    execute ':Unite  -buffer-name=files -start-insert buffer file_rec/async:'.ProjectRootGuess().'/'
"endfunction
"nnoremap <C-P> :call Unite_ctrlp()<cr>
"
""""""""""""""""""""""""""
" py-mode
""""""""""""""""""""""""""
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"  Rope mode on unless I am using Jedi vim
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pylint,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

let g:pymode_rope_project_root = "~/tmp/vim/pymode/rope"

" Javascript use flow
let g:syntastic_javascript_checkers = [ 'flow']
let g:syntastic_javascript_flow_exe = 'flow'


" Now we just enable the menu and pydoc preview to get the most useful
" information out of the code completion
set completeopt=menuone,longest,preview


""""""""""""""""""""""""""""""""""""
" Yggdroot/indentLine
""""""""""""""""""""""""""""""""""""
let g:indentLine_char = '┆'
let g:indentLine_first_char = '│'
let g:indentLine_color_term = 236
let g:indentLine_showFirstIndentLevel = 0

highlight ColorColumn ctermbg=235 guibg=#2c2d27

""""""""""""""""""""""""""""""""""""
" MattesGroeger/vim-bookmarks
""""""""""""""""""""""""""""""""""""
nmap <Leader>ff <Plug>BookmarkToggle
" nmap <Leader>i <Plug>BookmarkAnnotate
" nmap <Leader>a <Plug>BookmarkShowAll
" nmap <Leader>j <Plug>BookmarkNext
" nmap <Leader>k <Plug>BookmarkPrev
" nmap <Leader>c <Plug>BookmarkClear
" nmap <Leader>x <Plug>BookmarkClearAll
" nmap <Leader>kk <Plug>BookmarkMoveUp
" nmap <Leader>jj <Plug>BookmarkMoveDown
" nmap <Leader>g <Plug>BookmarkMoveToLine
