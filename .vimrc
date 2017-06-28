" ----- BEGIN BASE CONFIGURATION ----- "

" Load Vundle stuff
source ~/.bundles.vim

" Load altercmd
call altercmd#load()

syntax enable

" Generic sets
set showcmd    " Shows the latest command entered in the very bottom right
set cursorline " Draws a horizontal highlight on the line the cursor is on
set hlsearch   " Highlights all isntances of a search
set incsearch  " Start searching before pressing enter
set number     " Line numbers
set wildmenu   " Autocompleting of filenames when you :e
set nowrap     " Don't wrap lines
set autoindent " Always set autoindenting on
set copyindent " Copy the previous indentation on autoindenting
set showmatch  " Show matching parenthesis
set ignorecase " Ignore case when searching
set smartcase  " Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab   " Insert tabs on the start of a line according to shiftwidth, not tabstop
set hidden     " Used to hide scratchbuffers

set history=1000    " Remember up to 1000 commands and search history
set undolevels=1000 " Lots of undo levels
set spelllang=en_us " Default language is en_us

set laststatus=2 "Enables statusline everywhere"

set showtabline=0 "Turns off tablines

let mapleader = "," "Setting map leader

" Tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Folding
" ' Then you can toggle folding with za. You can fold everything with zM and
" unfold everything with zR. zm and zr can be used to get those folds just
" right. Always remember the almighty help file at “help :folding” if you get
" stuck. '
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default

" Folding
hi Folded ctermbg=233   "Set the folded bg color to be less harsh
hi Folded ctermfg=19    "Set the folded fg color to be less harsh

" 256 Color
set t_Co=256
set foldlevel=0         "this is just what i use

" ----- END BASE CONFIGURATION ----- "

" ----- BEGIN REMAPS ----- "

" ,, command to turn off search highlighting
nmap <silent> ,, :nohlsearch<CR>

" gV to highlight last inserted text
nnoremap gV `[v`]`

" Key combo to use <Space> to toggle folding
nnoremap <Space> za

" Press enter to insert newlilne below current
nnoremap <silent><CR> o<Esc>k

" Change wa to ww
AlterCommand ww wa

" Open nerdtree with ,t
nmap <silent> <leader>t :NERDTreeToggle<CR>

" Toggle spell checking with ,s
nmap <silent> <leader>s :set spell!<CR>

" Key combo to:
" 'So if I type {, delimitMate will insert } after my cursor, then I can
" execute my binding that will insert a new line in the middle of the two
" ready to receive some code.'
imap <C-c> <CR><Esc>O

" vim-ctrlspace fuzzy search with Ctrl-P
nnoremap <silent><C-p> :CtrlSpace O<CR>

" Ctrl-w--Ctrl-m to maximize current split, Ctrl-= to revert
nnoremap <C-W>m :wincmd _<Bar>wincmd <Bar><CR>


" ----- END REMAPS ----- "

" ----- BEGIN CUSTOM FUNCTIONS ----- "

" Copy and uncopy commands
function! DoCopy()
  set nonumber
  :IndentLinesDisable
  :GitGutterDisable
endfunction

function! DoUncopy()
  set number
  :IndentLinesEnable
  :GitGutterEnable
endfunction

command! -n=? -complete=dir -bar Copy :call DoCopy()
command! -n=? -complete=dir -bar Uncopy :call DoUncopy()

" ----- END CUSTOM FUNCTIONS ----- "


" ----- BEGIN PLUGIN CONFIGURATION ----- "

" indentLine colors
let g:indentLine_color_term = 239

" Syntastic config "
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height= 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1

" This is for having vim-jsx not require a .jsx extension to function properly
let g:jsx_ext_required = 0

" Web spacing
autocmd Filetype html       setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby       setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd FileType python     setlocal ts=4 sts=4 sw=4 tw=0
autocmd FileType css        setlocal ts=2 sts=2 sw=2

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\.pyc$', '\~$']

" Cosco configuration
autocmd FileType javascript,css nmap <silent> ; <Plug>(cosco-commaOrSemiColon)

" AirlineTheme configuration
let g:airline_theme='hybridline'
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 150,
    \ 'x': 150,
    \ 'y': 88,
    \ 'z': 45,
    \ 'warning': 80,
    \ 'error': 80,
    \ }

" vim-ctrlspace use silver searcher
if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
  let g:ctrlspace_glob_command = 'ag -l --nocolor -g ""'
endif

" Rainbow parentheses enable
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

" ----- END PLUGIN CONFIGURATION ----- "

