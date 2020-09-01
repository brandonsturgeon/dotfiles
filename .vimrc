" ----- BEGIN BASE CONFIGURATION ----- "

" Load Vundle
"source ~/.bundles.vim

" Load Plug
source ~/.bundles.plug.vim

syntax enable

" Generic sets
set showcmd     " Shows the latest command entered in the very bottom right
set cursorline  " Draws a horizontal highlight on the line the cursor is on
set hlsearch    " Highlights all instances of a search
set incsearch   " Start searching before pressing enter
set number      " Line numbers
set wildmenu    " Autocompleting of file names when you :e
set nowrap      " Don't wrap lines
set autoindent  " Always set autoindenting on
set copyindent  " Copy the previous indentation on autoindenting
set showmatch   " Show matching parenthesis
set ignorecase  " Ignore case when searching
set smartcase   " Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab    " Insert tabs on the start of a line according to shiftwidth, not tabstop
set hidden      " Used to hide scratchbuffers
set splitbelow  " Sets default horizontal split to appear below
set splitright  " Sets default vertical split to appear to the right

set history=2000    " Remember up to 2000 commands and search history
set undolevels=2000 " Lots of undo levels
set spelllang=en_us " Default language is en_us

set laststatus=2 "Enables statusline everywhere

set showtabline=0 "Turns off tablines

set backspace=2 "Make backspace behave normally

let mapleader = "," "Setting map leader

" Tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" 256 Color
set t_Co=256

" Folding "
" ' Then you can toggle folding with za. You can fold everything with zM and
" unfold everything with zR. zm and zr can be used to get those folds just
" right. Always remember the almighty help file at “help :folding” if you get stuck. '
set foldmethod=indent   " Fold based on indent
set foldnestmax=10      " Deepest fold is 10 levels
set nofoldenable        " Don't fold by default
set foldlevel=0

" Set the folded fg/bg color to be less harsh
hi Folded ctermbg=0
hi Folded ctermfg=30
" Alternate fg colors: 6, 8, 10, 12, 14, 30

" Spellcheck design "
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=9

" Change gutter background "
hi SignColumn ctermbg=none

set directory=$TEMP/.vim/.dir//

" Set backup directory to $TEMP
set backup
set backupdir=$TEMP/.vim/.backup//
if has("persistent_undo")
    set undodir=$TEMP/.vim/.undo//
    set undofile
endif

"set guifont=FuraCodeNerdFont:h18
set guifont=FuraMonoNerdFontComplete-Medium:h18

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" ----- END BASE CONFIGURATION ----- "

" ----- BEGIN REMAPS ----- "

" <leader><leader> command to turn off search highlighting
nmap <silent> <leader><leader> :nohlsearch<CR>

" gV to highlight last inserted text
nnoremap gV `[v`]`

" Key combo to use <Space> to toggle folding
nnoremap <Space> za

" Press enter to insert newlilne below current
nnoremap <silent><CR> o<Esc>k

" Open nerdtree with <leader>t
nmap <silent> <leader>t :NERDTreeToggle<CR>

" Toggle spell checking with <leader>s
nmap <silent> <leader>s :set spell!<CR>

" Open UndoTree with U
nnoremap U :UndotreeToggle<CR>

" Key combo to:
" 'So if I type {, delimitMate will insert } after my cursor, then I can
" execute my binding that will insert a new line in the middle of the two
" ready to receive some code.'
imap <C-c> <CR><Esc>O

" vim-ctrlspace fuzzy search with Ctrl-P
nnoremap <silent><C-p> :CtrlSpace O<CR>

" Ctrl-w m to maximize current split, Ctrl-w = to revert
nnoremap <C-W>m :wincmd _<Bar>wincmd <Bar><CR>
nnoremap <C-W>- :wincmd _<Bar>wincmd <Bar><CR>

" Remedy lazy shift finger
command W w
command Q q
command Wa wa
command Wq wq
command Wqa wqa

" Next Ale Error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ----- END REMAPS ----- "

" ----- BEGIN CUSTOM FUNCTIONS ----- "

" Copy and uncopy commands
function! DoCopy()
  set nonumber
  :IndentLinesDisable
  :SignifyDisable
endfunction

function! DoUncopy()
  set number
  :IndentLinesEnable
  :SignifyEnable
endfunction

" Auto highlight lines that go over 100 characters.
" Disabled because I can't figure out if I like it.
"augroup vimrc_autocmds
"  autocmd BufEnter * highlight OverLength ctermfg=9
"  autocmd BufEnter * match OverLength /\%>99v.\+/
"augroup END

command! -n=? -complete=dir -bar Copy :call DoCopy()
command! -n=? -complete=dir -bar Uncopy :call DoUncopy()

" ----- END CUSTOM FUNCTIONS ----- "


" ----- BEGIN PLUGIN CONFIGURATION ----- "

" indentLine colors
let g:indentLine_color_term = 239

" Sets sign colors for use in other applications
hi DiffAdd           cterm=bold ctermbg=none ctermfg=119
hi DiffDelete        cterm=bold ctermbg=none ctermfg=167
hi DiffChange        cterm=bold ctermbg=none ctermfg=227

" Sets sign colors for vim gutter specifically
hi SignifySignAdd    cterm=bold ctermbg=none  ctermfg=119
hi SignifySignDelete cterm=bold ctermbg=none  ctermfg=167
hi SignifySignChange cterm=bold ctermbg=none  ctermfg=227

" Change signify's delete character
let g:signify_sign_delete            = '-'

" Update on insert mode too
let g:signify_cursorhold_normal = 1
let g:signify_cursorhold_insert = 1

hi Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

" This is for having vim-jsx not require a .jsx extension to function properly
let g:jsx_ext_required = 0

" Web spacing
autocmd Filetype html       setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby       setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype jsx        setlocal ts=4 sts=4 sw=4
autocmd FileType python     setlocal ts=4 sts=4 sw=4 tw=0
autocmd FileType css        setlocal ts=2 sts=2 sw=2
autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 expandtab

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\.pyc$', '\~$']

" Cosco configuration
autocmd FileType javascript,css nmap <silent> ; <Plug>(cosco-commaOrSemiColon)

" AirlineTheme configuration
let g:airline_theme='hybridline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#stl_format_err = "%E{[%e #%fe]}"
let g:airline#extensions#syntastic#stl_format_warn = "%W{[%w #%fw]}"
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 150,
    \ 'x': 150,
    \ 'y': 88,
    \ 'z': 45,
    \ 'warning': 80,
    \ 'error': 80,
    \ }

" vim-ctrlspace use silver searcher
if executable("rg")
  let g:CtrlSpaceGlobCommand = 'rg -l --max-depth 50 test --color never ""'
  let g:ctrlspace_glob_command = 'rg -l --max-depth 50 test --color never ""'
endif

" Make gutentags use the .git dir for the tags file
let g:gutentags_ctags_tagfile = '.git/tags'

" ----- END PLUGIN CONFIGURATION ----- "
