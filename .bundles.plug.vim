" ----- BEGIN PLUG SETTINGS -----
set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')

" Load plugins on insert
augroup load_on_insert
    autocmd!
    autocmd InsertEnter * call plug#load('vim-sleuth') | autocmd! load_on_insert
augroup END

augroup load_on_write
    autocmd!
    autocmd BufWritePost * call plug#load('vim-fugitive', 'vim-signify') | autocmd! load_on_write
augroup END

augroup load_post_read
    autocmd!
    autocmd BufReadPost * call plug#load('vim-searchindex', 'vim-visual-multi') | autocmd! load_post_read

    let g:airline#extensions#ale#enabled = 1
    let g:ale_lint_on_save = 0
augroup END

" ----- BEGIN PLUGINS -----
" Plug 'ackyshake/VimCompletesMe',                 " Code Completion
Plug 'github/copilot.vim', { 'do': 'nvm use 18 &' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons',
Plug 'nvim-tree/nvim-web-devicons',
Plug 'EinfachToll/DidYouMean',                   " Vim plugin which asks for the right file to open
Plug 'Yggdroot/indentLine',                      " Visual ASCII lines to show indentation
Plug 'Valloric/MatchTagAlways',                  " Always highlights the tags that enclose your cursor
Plug 'nvim-tree/nvim-tree.lua',
Plug 'tpope/vim-surround',                       " Surround with tags, words, quotes using [c,y]s[i[w,p]]
Plug 'mtth/scratch.vim',                         " Unobtrusive scratchbuffers. Open with gs
Plug 'dense-analysis/ale',                       " Async linting
Plug 'nvim-lualine/lualine.nvim',
Plug 'romgrk/barbar.nvim',                       " Bufferline/Tabline

Plug 'nvim-lua/plenary.nvim',
Plug 'nvim-telescope/telescope.nvim',            { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter',          { 'do': ':TSUpdate'}

Plug 'mxw/vim-jsx',                             { 'for': 'javascript' }  " Vim JSX support
Plug 'pangloss/vim-javascript',                 { 'for': 'javascript' }  " vim-javascript is required for synastic/vim-jsx to work
Plug 'lfilho/cosco.vim',                        { 'for': 'javascript' }  " Semicolon insertion bliss
Plug 'othree/html5.vim',                        { 'for': 'html' }
Plug 'evanleck/vim-svelte',                     { 'for': ['javascript', 'svelte'], 'branch': 'main' }
Plug 'hashivim/vim-terraform',                  { 'for': ['terraform', 'tf'] }

Plug 'tpope/vim-markdown',                      { 'for': 'markdown' }    " Forces Markdown highlighting
Plug 'leafo/moonscript-vim',                    { 'for': 'moonscript' }  " Moonscript Syntax
Plug 'slim-template/vim-slim',                  { 'for': 'slim' }        " .slim syntax highlighting
Plug 'fatih/vim-go',                            { 'for': 'go', 'do': ':GoUpdateBinaries' }

Plug 'tpope/vim-endwise',                       { 'for': ['ruby'] }               " Automatic adding of ends in various languages
" Plug 'lukaszb/vim-web-indent',                  { 'for': ['javascript', 'html', 'css'] } " Proper indentation for .html .js .css

Plug 'cfc-servers/gluafixer.vim',               { 'for': 'lua' }                         " GMod Lua Linting for ALE

Plug 'metakirby5/codi.vim',                     { 'on': 'Codi' }                         " Interactive scratchpad. Enable with Codi [filetype]
Plug 'mbbill/undotree',                         { 'on': 'UndoTreeToggle' }               " UndoTree

" Loaded on BufReadPost
Plug 'google/vim-searchindex',                  { 'on': [] }                             " Shows match information at bottom line when searching
Plug 'mg979/vim-visual-multi',                  { 'on': [] }                             " Multiple cursors

" Loaded on InsertEnter
Plug 'tpope/vim-sleuth',                        { 'on': [] }

" Loaded on BufWritePos
Plug 'tpope/vim-fugitive',                      { 'on': [] }  " In-vim Git wrapper
Plug 'mhinz/vim-signify',                       { 'on': [] }  " Similar to git gutter

" -----  END PLUGINS  -----

call plug#end()
