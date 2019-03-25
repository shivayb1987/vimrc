set encoding=utf-8
" template files
autocmd BufNewFile index.js 0r ~/index.js

" set term=screen-256color

set suffixesadd+=.js
set suffixesadd+=.jsx

set path+=$PWD/**/
set nobackup
set nowritebackup
set noswapfile

set autoread
set shortmess+=I
" Enable syntax highlighting
syntax on

" Always display a status line (it gets hidden sometimes otherwise).
 set laststatus=2

" Show last command in the status line.
 set showcmd

"color scheme
set background=light
colorscheme solarized8

" Better command-line completion
set wildmode=longest,list

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set incsearch
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
packadd minpac
call minpac#init()
call minpac#add('easymotion/vim-easymotion')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-vinegar')
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-fugitive')
call minpac#add('Valloric/YouCompleteMe', {'do': {-> system('./install.py')}})
call minpac#add('NLKNguyen/papercolor-theme')
call minpac#add('vim-syntastic/syntastic')
call minpac#add('w0rp/ale')
call minpac#add('MarcWeber/vim-addon-mw-utils')
call minpac#add('tomtom/tlib_vim')
call minpac#add('garbas/vim-snipmate')
call minpac#add('honza/vim-snippets')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('bronson/vim-trailing-whitespace')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('kien/rainbow_parentheses.vim')
call minpac#add('nelstrom/vim-visual-star-search')
call minpac#add('mtth/scratch.vim')
call minpac#add('lifepillar/vim-solarized8')
call minpac#add('mhinz/vim-grepper')
call minpac#add('/usr/local/opt/fzf')
call minpac#add('junegunn/fzf')

let g:plug_timeout = 300  " Increase vim-plug timeout for YouCompleteMe.

nnorema	<Leader>p :<C-u>FZF<CR>

" minpac update and clean commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Scratch buffer automatically closes when inactive
let g:scratch_autohide = &hidden
let g:scratch_insert_autohide = 1

" autocmd vimenter * NERDTree

" let g:NERDTreeDirArrows=0
" let g:NERDTreeNodeDelimiter = "\u00a0"


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

" set autochdir
set tags=tags;  " Look for a tags file recursively in parent directories.
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

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

let g:grepper       = {}
let g:grepper.tools = ['grep', 'git', 'rg']

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <Plug>(GrepperOperator)
xmap gs <Plug>(GrepperOperator)

" Open Grepper-prompt for a particular grep-alike tool
nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>

" utility function makes it easy to set up an abbreviation that only expands at the start of the command line
function! SetupCommandAlias(input, output)
  exec 'cabbrev <expr> '.a:input
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
        \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias("grep", "GrepperGrep")
set grepprg=rg\ -H\ --no-heading\ --vimgrep
set grepformat=$f:$l:%c:%m

" terminal buffer switching key-bindings
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l
if has('nvim')
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
endif

if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
