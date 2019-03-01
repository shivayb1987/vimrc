set path=$PWD/**/

" Enable syntax highlighting
syntax on

" Always display a status line (it gets hidden sometimes otherwise).
 set laststatus=2

" Show last command in the status line.
 set showcmd

"color scheme
set background=dark
colorscheme PaperColor

" Better command-line completion
set wildmode=longest,list

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Set number
set nu

" Set tab and shift widths
set tabstop=2
set shiftwidth=2
set expandtab

" igonre case
set ignorecase
set smartcase


packloadall           " Load all plugins.
silent! helptags ALL  " Load help files for all plugins.

" Manage plugins with vim-plug.
call plug#begin()
" Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
let g:plug_timeout = 300  " Increase vim-plug timeout for YouCompleteMe.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'NLKNguyen/papercolor-theme'
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'bronson/vim-trailing-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'kien/rainbow_parentheses.vim'
call plug#end()

" autocmd vimenter * NERDTree

" let g:NERDTreeDirArrows=0
" let g:NERDTreeNodeDelimiter = "\u00a0"

set encoding=utf-8

" Fast split navigation with <Ctrl> + hjkl.
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" Easy motion
map <Leader> <Plug>(easymotion-prefix)
map <Leader>w <Plug>(easymotion-w)
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" map s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" map s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>b <Plug>(easymotion-b)
map <Leader>e <Plug>(easymotion-e)

" Use Ctrl+S to save file is edit and command modes
noremap <c-s> <c-o>:w<cr>
noremap <c-s> :w<cr>

" let NERDTreeHijackNetrw = 0

set autochdir
set tags=tags;  " Look for a tags file recursively in
                                     " parent directories.
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" Syntactic configurations
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" ALE configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" The mappings SnipMate uses
imap <C-J> <Plug>snipMateNextOrTrigger
" noremap <c-j> <Plug>(snipmatenextortrigger)

" if (exists('+colorcolumn'))
"   set colorcolumn=80
"   highlight ColorColumn ctermbg=9
" endif

let g:rbpt_colorpairs = [
  \ ['brown',       'RoyalBlue3'],
  \ ['Darkblue',    'SeaGreen3'],
  \ ['darkgray',    'DarkOrchid3'],
  \ ['darkgreen',   'firebrick3'],
  \ ['darkcyan',    'RoyalBlue3'],
  \ ['darkred',     'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['brown',       'firebrick3'],
  \ ['gray',        'RoyalBlue3'],
  \ ['black',       'SeaGreen3'],
  \ ['darkmagenta', 'DarkOrchid3'],
  \ ['Darkblue',    'firebrick3'],
  \ ['darkgreen',   'RoyalBlue3'],
  \ ['darkcyan',    'SeaGreen3'],
  \ ['darkred',     'DarkOrchid3'],
  \ ['red',         'firebrick3'],
  \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
