let g:ale_emit_conflict_warnings = 0
call plug#begin('~/.config/nvim/bundle')
Plug 'xolox/vim-easytags' | Plug 'xolox/vim-misc'
Plug 'tpope/vim-sensible'
Plug 'critiqjo/lldb.nvim'
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer' }
Plug 'yggdroot/indentline'
Plug 'SirVer/ultisnips'
Plug 'vim-syntastic/syntastic'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'zchee/deoplete-jedi'
Plug 'trevordmiller/nova-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
" Plug 'tpope/vim-dispatch'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Colorcheme
Plug 'NLKNguyen/papercolor-theme'
Plug 'Heorhiy/VisualStudioDark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }

" Python Folding
Plug 'tmhedberg/SimpylFold'
" Bootstrap4 snippets
Plug 'jvanja/vim-bootstrap4-snippets'
"Plug 'suan/instant-markdown-d'
" css syntax
Plug 'hail2u/vim-css3-syntax'
" Surroundings
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
" Repeate . command for plugins
Plug 'tpope/vim-repeat'
" tmux nav
Plug 'christoomey/vim-tmux-navigator'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Markdown Plugs
"Plug 'suan/vim-instant-markdown'
" Call PlugInstall to install new plugins
" :SearchTasks TODO...
Plug 'gilsondev/searchtasks.vim'
" cmake support
Plug 'vhdirk/vim-cmake'
call plug#end()

" css3 syntax fix highlight problem
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" Basics
filetype plugin indent on
syntax on
set number relativenumber
set incsearch
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set so=8 " Set 8 lines to the cursor - when moving vertically using j/k
set magic "for regex
set colorcolumn=79 " higlight 79's column
let g:loaded_python3_provider=1

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_postsave_hook = 'TagsGenerate'  " this will run :TagsGenerate after each save

" Colorschemes
set t_Co=256
" Terminal
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=light
"colorscheme PaperColor
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

" Preferences
inoremap jk <ESC>
let mapleader = "\<Space>"
set pastetoggle=<F2>
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv
" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$
" Navigate split screens easily
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
" vim + ctags + ctrlp
nnoremap <leader>. :CtrlPTag<cr>

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" Change spacing for language specific
"
" _______________ctrlp_______________________________
" Ignore files and dirs
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"let g:ctrlp_working_path_mode = ''
"let g:ctrlp_root_directory = '~/' " It's not working..
"let g:ctrlp_root_markers = ['.ctrlp', '~/Documents', '~/.config/nvim']




autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
" Execute python script
autocmd FileType python noremap <silent><F5> :wall \| !clear; echo "% is running..."; python3 %<CR>

autocmd FileType c noremap <F4> :wall \| !clear; echo "% is compiling..."; gcc -std=c99 -Wall -Werror % -lm<CR>

" Plugin settings

" Deoplete
let g:deoplete#enable_at_startup = 1
" Use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Theme
syntax enable
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set termguicolors
" set background=dark 
" NERDTree
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" jsx
let g:jsx_ext_required = 0


" ----------------------------------------------
" Syntastic

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Tmux airline config
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}
"let g:tmuxline_preset = {
      "\'a'    : '#S',
      "\'c'    : ['#(whoami)', '#(uptime | cut -d " " -f 1,2,3)'],
      "\'win'  : ['#I', '#W'],
      "\'cwin' : ['#I', '#W', '#F'],
      "\'x'    : '#(date)',
      "\'y'    : ['%R', '%a', '%Y'],
      "\'z'    : '#H'}
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

" Ale configuration
let g:ale_fixers = {
\   'python3': ['pylint3'],
\}
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_use_deprecated_neovim = 1
" SEARCHTASKS
let g:searchtasks_list=["TODO", "FIXME", "XXX"]
