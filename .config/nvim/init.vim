:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set nohlsearch
:set nowrap
:set scrolloff=8
:set signcolumn=yes

:colorscheme gruvbox
hi Normal guibg=None ctermbg=NONE

" ----------------
" ----PLUGINS-----
" ----------------
call plug#begin()
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim' " Focus mode for vim
Plug 'nvim-lua/plenary.nvim' " Telescope - Files finder
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc

Plug 'lervag/vimtex'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
set encoding=UTF-8
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

nnoremap <C-f> :NvimTreeFocus<CR>

" telescope remaps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" LaTeX settings
let g:coc_filetype_map = {'tex': 'latex'}
let g:vimtex_view_method = 'sioyek'
let g:vimtex_quickfix_open_on_warning = 0

let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#spell#enabled = 0

" -------------------------
" ------LUA SETTINGS-------
" -------------------------
lua << EOF
require("toggleterm").setup{}
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        -- { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

" -------------------------
" ----PLUGINS COMMANDS-----
" -------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Enable tab for Coc
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

augroup pandoc_syntax
	    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
