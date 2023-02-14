" ----- BEGIN PRE-PLUGIN CONFIGURATION ----- "

" ----- BEGIN PLUG CONFIGURATION ----- "
source ~/.bundles.plug.vim
" ----- END PLUG CONFIGURATION ------- "

" ----- BEGIN BASE CONFIGURATION ----- "

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
set encoding=utf-8

let mapleader = "," "Setting map leader

" Tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

set updatetime=300 " Faster completion

" 256 Color
set t_Co=256

" " Folding
" " ' Then you can toggle folding with za. You can fold everything with zM and
" " unfold everything with zR. zm and zr can be used to get those folds just
" " right. Always remember the almighty help file at “help :folding” if you get stuck. '
" set foldmethod=indent   " Fold based on indent
" set foldnestmax=10      " Deepest fold is 10 levels
" set nofoldenable        " Don't fold by default
" set foldlevel=0
" 
" " Set the folded fg/bg color to be less harsh
" hi Folded ctermbg=0
" hi Folded ctermfg=30
" " Alternate fg colors: 6, 8, 10, 12, 14, 30

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
"set guifont=FuraMonoNerdFontComplete-Medium:h18
"set guifont=FiraCodeRetina:style=Retina,Regular
"set guifont=FiraCodeRetina:h18
"set guifont=Fira\ Code,Fira\ Code\ Retina

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" ----- END BASE CONFIGURATION ----- "

" ----- BEGIN REMAPS ----- "

" <leader><leader> command to turn off search highlighting
nmap <silent> <leader><leader> :nohlsearch<CR>

" Open nvim tree with <leader>t
"nmap <silent> <leader>t :NvimTreeToggle<CR>

" Toggle spell checking with <leader>s
nmap <silent> <leader>s :set spell!<CR>

" Telescope keybinds
nnoremap <silent><C-i> :Telescope find_files<CR>
nnoremap <silent><C-o> :Telescope buffers<CR>
nnoremap <silent><C-p> :Telescope live_grep<CR>

" Ctrl-w m to maximize current split, Ctrl-w = to revert
nnoremap <C-W>m :wincmd _<Bar>wincmd <Bar><CR>
nnoremap <C-W>- :wincmd _<Bar>wincmd <Bar><CR>

" T for End-of-line
nnoremap T $

" Y for Beginning-of-line
nnoremap Y ^

" Remove the hyper-annoying Man Pages keybind
map <S-k> <Nop>

" Remedy lazy shift finger
command W w
command Q q
command Qa qa
command Wa wa
command Wq wq
command Wqa wqa
command WQa wqa
command WQA wqa

" Split into a new tab
noremap <C-t> :tabnew split<CR>

" H and L to navigate tabs
nnoremap H gT
nnoremap L gt

" Ctrl-j to jump down half a screen
nnoremap <C-j> <C-d>

" Ctrl-k to jump up half a screen
nnoremap <C-k> <C-u>

" ( to jump to previous cursor position
nnoremap ( <C-o>

" ) to jump to next cursor position
nnoremap ) <C-i>

" ----- END REMAPS ----- "

" ----- BEGIN CUSTOM FUNCTIONS ----- "

" Run a command if it exists
function! SafeRunCommand(command)
  if exists(a:command)
    execute a:command
  else
    echo "Error: The command '" . a:command . "' does not exist."
  endif
endfunction

" Copy and uncopy commands
function! DoCopy()
  set nonumber
  call SafeRunCommand(":IndentLinesDisable")
  call SafeRunCommand(":SignifyDisable")
endfunction

function! DoUncopy()
  set number
  call SafeRunCommand(":IndentLinesEnable")
  call SafeRunCommand(":SignifyEnable")
endfunction

" Auto highlight lines that go over 100 characters.
" Disabled because I can't figure out if I like it.
"augroup vimrc_autocmds
"  autocmd BufEnter * highlight OverLength ctermfg=9
"  autocmd BufEnter * match OverLength /\%>99v.\+/
"augroup END

command! -n=? -complete=dir -bar Copy :call DoCopy()
command! -n=? -complete=dir -bar Uncopy :call DoUncopy()

" Color the popup menu
hi Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

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

"hi Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

" This is for having vim-jsx not require a .jsx extension to function properly
autocmd FileType javascript let g:jsx_ext_required = 0

" Web spacing
autocmd FileType html       setlocal ts=2 sts=2 sw=2
autocmd FileType ruby       setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType jsx        setlocal ts=2 sts=2 sw=2
autocmd FileType svelte     setlocal ts=2 sts=2 sw=2
autocmd FileType python     setlocal ts=4 sts=4 sw=4 tw=0
autocmd FileType css        setlocal ts=2 sts=2 sw=2
autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 expandtab

set tags='tags'

let g:ale_virtualtext_cursor = 0

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')


" Use ctrl-space to trigger completion (only useful when completion is not triggered automatically)
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" endif

" Use enter to confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use tab to navigate completion menu
" function! CheckBackSpace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1] =~ '\s'
" endfunction
" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1):
"       \ exists('b:_copilot.suggestions') ? copilot#Accept("\<CR>") :
"       \ CheckBackSpace() ? "\<Tab>" :
"       \ coc#refresh()

" let $FZF_DEFAULT_COMMAND='rg -l --max-depth 50 --color always ""'

" ----- END PLUGIN CONFIGURATION ----- "
