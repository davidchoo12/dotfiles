set nocompatible

" disable splashscreen
set shortmess=I

call plug#begin('~/.local/share/nvim/plugged')
" run :PlugInstall after adding new plugin below to install
" :PlugUpdate to update
" run :PlugClean after deleting Plug command below to uninstall
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" autopairs, fzf, ... check donjar/vim-workshop
" the plugin below was installed and is yet to be removed, the installation took a long time and has many dependencies, so i decided to use a more lightweight autocomplete plugin
" to use it, just uncomment
" Plug 'valloric/youcompleteme'
" Plug 'ajh17/vimcompletesme'
" Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" vim-colors-solarized
set background=dark
let g:solarized_termcolors=256
" let g:solarized_visibility="high"
colorscheme solarized

" closing special chars
function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if a:open == a:close && strpart(getline('.'), col('.') - 1, 1) == a:open
    return "\<right>"
  elseif col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endf
inoremap <expr> ' ConditionalPairMap('''', '''')
inoremap <expr> " ConditionalPairMap('"', '"')
" inoremap " ""<left>
" inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
" inoremap ' ''<left>
" inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
" inoremap ( ()<left>
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" inoremap [ []<left>
inoremap <expr> [ ConditionalPairMap('[', ']')
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
" inoremap { {}<left>
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap {<CR> {<CR>}<ESC>O

" map ctrl n to nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

" map ctrl backspace to delete word
" inoremap <del> <esc>dbi

" map all mode C-s to save
noremap <C-s> <esc>:w<cr>
" map normal mode H to home
nnoremap H ^

" map normal mode ; to end
nnoremap ; A

" map for moving lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" map for jumping more lines
nnoremap <S-j> 7j
nnoremap <S-k> 7k
vnoremap <S-j> 7j
vnoremap <S-k> 7k

" autocomplete css
set omnifunc=syntaxcomplete#Complete

" auto reload files
set autoread

" use mouse
set mouse=a

" show file name
" set title titlestring=%<%F%=%l/%L-%P titlelen=70
set title titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

" always use system clipboard for copy pasting
set clipboard+=unnamedplus

" tab navigation like browser
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
" nnoremap <C-w>     :tabclose<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
" inoremap <C-w>     <Esc>:tabclose<CR>
nnoremap <C-1> 1gt
nnoremap <C-2> 2gt
nnoremap <C-3> 3gt
nnoremap <C-4> 4gt
nnoremap <C-5> 5gt
nnoremap <C-6> 6gt
nnoremap <C-7> 7gt
nnoremap <C-8> 8gt
nnoremap <C-9> 1gtgT

" space for repeating macros at q
nnoremap <space> @q

""  Preserve history.
""
""  Set history cap to 10,000 entries back.
""
set history=10000

""  Improve literacy.
""
""  Turn syntax highlighting on.
""
syntax on

""  Improve feedback.
""
""  Show matching parentheses and brackets upon hover.
""
set showmatch
""  Show the last command entered in the bottom right corner.
""
set showcmd
""  Draw a horizontal highlight on the line the cursor is 
""  currently on.
""
set cursorline
highlight CursorLine term=bold cterm=bold
""  Provide graphical menu of matches in searches.
""
set wildmenu

""  Improve search
" search ignore case
""
set ignorecase
""  Search as characters are entered.
""
set incsearch
""  Highlight search matches.
""
set hlsearch

""  Improve performance
""
""  Only redraw the screen when you need to.
""
set lazyredraw

""  Help me read fast.
""
""  Set text width to 80 characters wide.
""  (This options wraps at word boundaries.)
""
" set textwidth=80
""  Wrapping text using textwidth requires "t" in formatoptions.
""  It is by default, but add "t" just in case needed.
""
set formatoptions+=t
""  A long line already longer than the text width is not wrapped
""  when text is added if formatoptions contains "l".
""  Remove "l" from formatoptions so long lines will be wrapped.
""
set formatoptions-=l
""  Borders.
""
""  Set the wrap margin to 2 characters wide.
""
" set wrapmargin=2
""  Set soft wrapping on.
""
set wrap
set linebreak

""  Turn on line numbering.
""
set number

""  Turn on relative numbering.
""
set relativenumber

""  Set the line numbers to 4 spaces.
""
set numberwidth=4

""  Hide windows (instead of closing) when opening new ones.
""
set hidden

""  You use tabs? Ew.
""
""  Set number of visual spaces per TAB to 4.
""
set tabstop=2
""  Set number of spaces inserted per TAB when editing to 2.
""
set softtabstop=0
""  Use the TAB key to insert spaces, not TAB characters (a cardinal sin).
""
set shiftwidth=2
set expandtab
set autoindent
set smarttab
set list
set listchars=eol:↓,tab:>-,space:·,trail:·,nbsp:‡,extends:»,precedes:«

""  Origami.
""
""  Show all folds.
""
set foldenable
""  Open most folds by default by setting the starting fold level
""  to 10.
""
set foldlevelstart=10
""  Set maximum number of nested folds to 10.
""
set foldnestmax=10
""  Fold based on indentation.
""  (**May need to change this to marker for C and Hoon**.)
""
set foldmethod=indent

""  Mappings
""
""  Speed
""
""  Map leader key to ";" .
""
let mapleader=";"
""  Press 'fd' fast in insert and visual mode to escape.
""
inoremap fd <esc>
vnoremap fd <esc>
""  Set time length for mapped sequence to complete to 50ms.
""
set timeoutlen=1000
""  Set time length for key-code sequence to complete to 50ms.
""
set ttimeoutlen=50
""  Feedback
""
""  Visually select the block of characters added the last time
""  I was in insert mode.
""
nnoremap gV `[v`]
""  Search
""
""  Clear search highlight.
""
" nnoremap <leader><space> :nohlsearch<CR>
""  Folding
""
""  Open/close folds.
""
" nnoremap <space> za

