" ----- BEGIN VUNDLE SETTINGS -----
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" ----- BEGIN PLUGINS -----
Plugin 'VundleVim/Vundle.vim'           " let Vundle manage Vundle, required
Plugin 'mxw/vim-jsx'                    " Vim JSX support
Plugin 'pangloss/vim-javascript'        " vim-javascript is required for synastic/vim-jsx to work
Plugin 'scrooloose/syntastic'           " Syntastic
Plugin 'Raimondi/delimitMate'           " DelimitMate for auto bracket/quote closing
"Plugin 'klen/python-mode'               " Python Mode for easy vim handling
Plugin 'slim-template/vim-slim'         " .slim syntax highlighting
Plugin 'lukaszb/vim-web-indent'         " Proper indentation for .html .js .css
Plugin 'vim-scripts/JavaScript-Indent'  " Proper indentation for .js
Plugin 'Yggdroot/indentLine'            " Visual ASCII lines to show indentation
Plugin 'Valloric/YouCompleteMe'         " Code completion
Plugin 'tpope/vim-fugitive'             " In-vim Git wrapper
Plugin 'airblade/vim-gitgutter'         " Git diff in the gutter
Plugin 'scrooloose/nerdtree'            " Tree explorer
" -----  END PLUGINS  -----

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ----- END VUNDLE SETTINGS -----

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

set history=1000    " Remember up to 1000 commands and search history
set undolevels=1000 " Lots of undo levels

" Tabs to spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Remaps "
"
" ,, command to turn off search highlighting
nmap <silent> ,, :nohlsearch<CR>
" gV to highlight last inserted text
nnoremap gV `[v`]`
" Key combo to use <Space> to toggle folding
nnoremap <Space> za
" Pres Enter to insert newline below current. Shift-Enter for above
nmap <S-ENTER> O<Esc>j
nmap <CR> o<Esc>k
" Allows the user to select where they want to go in their previous jumps
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction
" Shortcut for GotoJump: \f
nmap <Leader>f :call GotoJump()<CR>


" Folding
" ' Then you can toggle folding with za. You can fold everything with zM and
" unfold everything with zR. zm and zr can be used to get those folds just
" right. Always remember the almighty help file at “help :folding” if you get
" stuck. '
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=0         "this is just what i use

" 256 Color
set t_Co=256

" indentLine colors
let g:indentLine_color_term = 239

" Key combo to:
" 'So if I type {, delimitMate will insert } after my cursor, then I can
" execute my binding that will insert a new line in the middle of the two
" ready to receive some code.'
imap <C-c> <CR><Esc>O

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

" Custom toggling commands
command Synt SyntasticToggleMode
command Lines IndentLinesToggle
