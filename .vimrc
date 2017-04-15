
set ignorecase      " Do case insensitive matching
set incsearch       " Incremental search
set hlsearch " Highligh search results

" Map "set paste" to F10
set pastetoggle=<F10>

set nocompatible              " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'hynek/vim-python-pep8-indent'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'easymotion/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'dkprice/vim-easygrep'
Plugin 'leafgarland/typescript-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=","
"split navigations
nnoremap <C-S-J> <C-W><C-J>
nnoremap <C-S-K> <C-W><C-K>
nnoremap <C-S-L> <C-W><C-L>
nnoremap <C-S-H> <C-W><C-H>

" FOLDING
"""""""""
" Enable folding
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=0

autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" IDENTATION
""""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4

autocmd BufNewFile,BufRead *.py,wscript
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

autocmd BufNewFile,BufRead wscript setfiletype python

autocmd BufNewFile,BufRead *.js,*.html,*.css,*.yaml,*.json,*.rst
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" AUTOCOMPLETE
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_server_python_interpreter='/usr/bin/python3'
" Collect suggestions from strings and comments as well
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" See here why we need to use execute:
" http://stackoverflow.com/a/27206531/360390
execute "set <A-g>=\eg"
nnoremap <A-g>  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Open GoTo* commands in new tab
let g:ycm_goto_buffer_command = 'new-tab'


" python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(open(activate_this).read(), dict(__file__=activate_this))
EOF

" SYNTAX CHECKING
syntax on
let python_highlight_all=1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
" My script that checks version of the `python` executable and invokes proper flake 8
let g:syntastic_python_flake8_exe='flake8.sh'
let g:syntastic_python_flake8_args='--max-line-length=120'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" You can use sphinx here, but it compiles the whole docs directory on every save
let g:syntastic_rst_checkers = []

" COLORSCHEME
set t_Co=256
colorscheme zenburn

" FILE BROWSING
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-t> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
map <leader>f :NERDTreeFind<cr>

" Enable status line by default
set laststatus=2
" If using airline - enable it to use powerline fonts
"let g:airline_powerline_fonts=1

" update time for vim-gitgutter
set updatetime=250

" Tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Enable bad whitespaces on open
autocmd VimEnter * ShowBadWhitespace

" TagBar outline
nnoremap <F8> :TagbarToggle<CR>

" CtrlP plugin config
"""""""""""""""""""""
" Show currently open buffers
nnoremap <leader>b :CtrlPBuffer<CR>"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Disable line wrapping
set nowrap
noremap <leader>q :q<cr>
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
