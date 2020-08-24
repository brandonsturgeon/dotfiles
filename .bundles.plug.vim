" ----- BEGIN PLUG SETTINGS -----
set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')

" Load plugins on insert
augroup load_on_insert
    autocmd!
    autocmd InsertEnter * call plug#load('VimCompletesMe', 'delimitMate') | autocmd! load_on_insert
augroup END

augroup load_on_write
    autocmd!
    autocmd BufWritePost * call plug#load('vim-fugitive', 'vim-signify') | autocmd! load_on_write
augroup END

augroup load_post_read
    autocmd!
    autocmd BufReadPost * call plug#load('ale', 'vim-searchindex', 'bufexplorer', 'vim-airline', 'vim-airline-themes', 'tmuxline.vim') | autocmd! load_post_read

    let g:airline#extensions#ale#enabled = 1
    let g:ale_lint_on_save = 0
augroup END

" ----- BEGIN PLUGINS -----
Plug 'Yggdroot/indentLine'                      " Visual ASCII lines to show indentation
Plug 'EinfachToll/DidYouMean'                   " Vim plugin which asks for the right file to open
Plug 'Valloric/MatchTagAlways'                  " Always highlights the tags that enclose your cursor
Plug 'tpope/vim-surround'                       " Surround with tags, words, quotes using [c,y]s[i[w,p]]
Plug 'mtth/scratch.vim'                         " Unobtrusive scratchbuffers. Open with gs
Plug 'terryma/vim-multiple-cursors'             " Multiple cursors
Plug 'ryanoasis/vim-devicons'                   " Special devicons for various plugins
Plug 'dense-analysis/ale'                       " Async linting
Plug 'ludovicchabant/vim-gutentags'             " Tag stuff for auto complete
Plug 'universal-ctags/ctags'                    " Tag stuff for auto complete

Plug 'mxw/vim-jsx',                             { 'for': 'javascript' }  " Vim JSX support
Plug 'pangloss/vim-javascript',                 { 'for': 'javascript' }  " vim-javascript is required for synastic/vim-jsx to work
Plug 'vim-scripts/JavaScript-Indent',           { 'for': 'javascript' }  " Proper indentation for .js
Plug 'lfilho/cosco.vim',                        { 'for': 'javascript' }  " Semicolon insertion bliss
Plug 'othree/javascript-libraries-syntax.vim',  { 'for': 'javascript' }  " Highlighting for more JS libraries
Plug 'tpope/vim-markdown',                      { 'for': 'markdown' }    " Forces Markdown highlighting
Plug 'leafo/moonscript-vim',                    { 'for': 'moonscript' }  " Moonscript Syntax
Plug 'slim-template/vim-slim',                  { 'for': 'slim' }        " .slim syntax highlighting

Plug 'tpope/vim-endwise',                       { 'for': ['ruby', 'lua'] }               " Automatic adding of ends in various languages
Plug 'lukaszb/vim-web-indent',                  { 'for': ['javascript', 'html', 'css'] } " Proper indentation for .html .js .css

Plug 'scrooloose/nerdtree',                     { 'on': 'NERDTreeToggle' } " Tree explorer
Plug 'Xuyuanp/nerdtree-git-plugin',             { 'on': 'NERDTreeToggle' } " Git status in NerdTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' } " NerdTree icon highlighting
Plug 'metakirby5/codi.vim',                     { 'on': 'Codi' }           " Interactive scratchpad. Enable with Codi [filetype]
Plug 'vim-ctrlspace/vim-ctrlspace',             { 'on': 'CtrlSpace' }      " Vim ctrlspace
Plug 'mbbill/undotree',                         { 'on': 'UndoTreeToggle' } " UndoTree

" Loaded on BufReadPost
Plug 'google/vim-searchindex',                  { 'on': [] }               " Shows match information at bottom line when searching
Plug 'jlanzarotta/bufexplorer',                 { 'on': [] }               " Explore vim buffer with 'be' 'bt' 'bs' and 'bv'
Plug 'vim-airline/vim-airline',                 { 'on': [] }               " Nice statusline
Plug 'vim-airline/vim-airline-themes',          { 'on': [] }               " Airline themes
Plug 'edkolev/tmuxline.vim',                    { 'on': [] }               " Airline for tmux

" Loaded on InsertEnter
Plug 'Raimondi/delimitMate',                    { 'on': [] }               " DelimitMate for auto bracket/quote closing
Plug 'ajh17/VimCompletesMe',                    { 'on': [] }               " Code Completion

" Loaded on BufWritePos
Plug 'tpope/vim-fugitive',                      { 'on': [] }               " In-vim Git wrapper
Plug 'mhinz/vim-signify',                       { 'on': [] }               " Similar to git gutter
" -----  END PLUGINS  -----

call plug#end()
