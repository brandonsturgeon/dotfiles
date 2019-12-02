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
"Plugin 'klen/python-mode'              " Python Mode for easy vim handling
Plugin 'slim-template/vim-slim'         " .slim syntax highlighting
Plugin 'lukaszb/vim-web-indent'         " Proper indentation for .html .js .css
Plugin 'vim-scripts/JavaScript-Indent'  " Proper indentation for .js
Plugin 'Yggdroot/indentLine'            " Visual ASCII lines to show indentation
Plugin 'Valloric/YouCompleteMe'         " Code completion
Plugin 'tpope/vim-fugitive'             " In-vim Git wrapper
Plugin 'mhinz/vim-signify'              " Similar to git gutter
Plugin 'scrooloose/nerdtree'            " Tree explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'    " Git status in NerdTree
Plugin 'EinfachToll/DidYouMean'         " Vim plugin which asks for the right file to open
Plugin 'Valloric/MatchTagAlways'        " Always highlights the tags that enclose your cursor
Plugin 'google/vim-searchindex'         " Shows match information at bottom line when searching
"Plugin 'jlanzarotta/bufexplorer'        " Explore vim buffer with 'be' 'bt' 'bs' and 'bv'
Plugin 'tpope/vim-markdown'             " Forces Markdown highlighting
Plugin 'lfilho/cosco.vim'               " Semicolon insertion bliss
Plugin 'tpope/vim-surround'             " Surround with tags, words, quotes using [c,y]s[i[w,p]]
Plugin 'terryma/vim-multiple-cursors'   " Multiple cursors
Plugin 'metakirby5/codi.vim'            " Interactive scratchpad. Enable with Codi [filetype]
Plugin 'mtth/scratch.vim'               " Unobtrusive scratchbuffers. Open with gs
Plugin 'vim-airline/vim-airline'        " Nice statusline
Plugin 'vim-airline/vim-airline-themes' " Airline themes
Plugin 'vim-ctrlspace/vim-ctrlspace'    " Vim ctrlspace
Plugin 'mbbill/undotree'                " UndoTree
Plugin 'tpope/vim-endwise'              " Automatic adding of ends in various languages
Plugin 'edkolev/tmuxline.vim'           " Airline for tmux
Plugin 'leafo/moonscript-vim'           " Moonscript Syntax


Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " NerdTree icon highlighting
Plugin 'othree/javascript-libraries-syntax.vim'  " Highlighting for more JS libraries
Plugin 'ryanoasis/vim-devicons'                  " Special devicons for various plugins
" -----  END PLUGINS  -----

call vundle#end()            " required
filetype plugin indent on    " required

" ----- END VUNDLE SETTINGS -----
