" ----- BEGIN BASE CONFIGURATION ----- "

" Load Vundle stuff
source ~/.bundles.vim

" Load altercmd
call altercmd#load()

syntax enable

" Generic sets
set showcmd    " Shows the latest command entered in the very bottom righ
set cursorline " Draws a horizontal highlight on the line the cursor is on
set hlsearch   " Highlights all isntances of a search
set incsearch  " Start searching before pressing enter
set number     " Line numbers
set wildmenu   " Autocompleting of filenames when you :e
set lazyredraw " Only redraw when we need it
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
hi Folded ctermbg=242   "Set the folded bg color to be less harsh
hi Folded ctermfg=17    "Set the folded fg color to be less harsh

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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

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

" Rainbow Parentheses configuration
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Cosco configuration
autocmd FileType javascript,css nmap <silent> ; <Plug>(cosco-commaOrSemiColon)

" ----- END PLUGIN CONFIGURATION ----- "

