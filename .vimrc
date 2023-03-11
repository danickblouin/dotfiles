set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set nohlsearch
set nowrap
set scrolloff=8
set signcolumn=yes
syntax on
set encoding=UTF-8

set background=dark
let g:gruvbox_contrast_dark='soft'

:colorscheme gruvbox
" hi Normal guibg=None ctermbg=NONE

" ----------------
" ----PLUGINS-----
" ----------------
call plug#begin()
	Plug 'junegunn/goyo.vim' " Focus mode for vim

	Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
	Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc

	Plug 'lervag/vimtex'
	Plug 'junegunn/vim-easy-align'

	Plug 'vim-pandoc/vim-pandoc'
	Plug 'vim-pandoc/vim-pandoc-syntax'

	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" -------------
" ----MAPS-----
" -------------

" set mapleader to space
let mapleader = " "

" move line up or down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" maps to move between splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ctrl-a to select all
map <C-a> <esc>ggVG<CR>

" ------------------------------
" ----PLUGINS SETTINGS/MAPS-----
" ------------------------------

nnoremap <leader>G <cmd>Goyo<cr>

" LaTeX settings
let g:vimtex_view_method = 'sioyek'
let g:vimtex_quickfix_open_on_warning = 0


" -------------------------
" ----PLUGINS COMMANDS-----
" -------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
