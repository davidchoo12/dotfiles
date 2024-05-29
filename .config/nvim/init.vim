set nocompatible

" disable splashscreen
set shortmess=I

" Figure out the system Python for Neovim for UltiSnips to work, src https://github.com/neovim/neovim/issues/1887#issuecomment-280653872
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

call plug#begin('~/.local/share/nvim/plugged')
" run :PlugInstall after adding new plugin below to install
" :PlugUpdate to update
" run :PlugClean after deleting Plug command below to uninstall
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
" Plug 'morhetz/gruvbox'
" Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" autopairs, fzf, ... check donjar/vim-workshop
" the plugin below was installed and is yet to be removed, the installation took a long time and has many dependencies, so i decided to use a more lightweight autocomplete plugin
" to use it, just uncomment
" Plug 'valloric/youcompleteme'
" Plug 'ajh17/vimcompletesme'
" Plug 'mattn/emmet-vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" tsx syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'eslint/eslint'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'SirVer/ultisnips'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf'

call plug#end()

" onedark colorscheme, alternate option gruvbox
colorscheme onedark
" vim-colors-solarized
" set background=dark
" let g:solarized_termcolors=256
" let g:solarized_visibility="high"
" colorscheme solarized

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
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" show hidden files
let g:NERDTreeShowHidden = 1

" ale configs
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'typescript': ['eslint'],
\  'typescriptreact': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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

" map for navigating splits
noremap <C-h> <esc><C-w>h
noremap <C-j> <esc><C-w>j
noremap <C-k> <esc><C-w>k
noremap <C-l> <esc><C-w>l

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
" set relativenumber

""  Set the line numbers to 4 spaces.
""
set numberwidth=4

""  Hide windows (instead of closing) when opening new ones.
""
set hidden

"" Indentation

" see https://vim.fandom.com/wiki/Indenting_source_code
" insert spaces instead of tabs
set expandtab
" number of spaces to use for each step of (auto)indent
set shiftwidth=2
" number of spaces between tabs not at start of line
" eg pressing 123<tab>1<tab> with following settings:
" softtabstop=2:^123 1 $
" softtabstop=5:^123  1    $
set softtabstop=2
" number of spaces that a tab char accounts for, set equal to shiftwidth else pressing tab will insert mix of tab and space
set tabstop=2
" copy indent from current line when starting a new line
set autoindent
" show whitespaces
set list
set listchars=eol:↓,tab:>-,space:·,trail:·,nbsp:‡,extends:»,precedes:«
" filetype specific indentation settings
filetype plugin indent on
autocmd FileType python setlocal softtabstop=2 shiftwidth=2
autocmd FileType cpp setlocal softtabstop=4 shiftwidth=4
autocmd FileType go setlocal softtabstop=2 shiftwidth=2 noexpandtab

" press 'fd' fast in insert and visual mode to escape.
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

" persistent undo history
set undofile
set undodir=~/.config/nvim/undo

" allow left/right keys to navigate to prev/next lines at start/end of lines
set whichwrap=b,s,h,l,<,>
" vsplit on right side
set splitright
" scroll offset - lines to preview at top and bottom of buffer when navigating up and down, big number to keep cursor in middle
set scrolloff=999
" disable adding newline on end of file on save
set nofixendofline
