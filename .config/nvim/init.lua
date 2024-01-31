----------------------
-- General settings --
----------------------

local set = vim.opt -- Shortcut to set options

set.autoindent = true
set.encoding = 'utf-8'
set.hlsearch = true
set.mouse = 'a'
set.number = true
set.relativenumber = true
set.scrolloff = 8
set.shiftwidth = 4
set.signcolumn = 'yes'
set.smarttab = true
set.softtabstop = 4
set.tabstop = 4
set.wrap = true

-- Theme settings
set.background = 'dark'
vim.cmd('colorscheme kanagawa')
-- vim.cmd("colorscheme gruvbox")
vim.cmd [[hi Normal guibg=None ctermbg=NONE]]

-- Key Mappings
local map = vim.api.nvim_set_keymap -- Shortcut to set keymaps
local opts = { noremap = true }     -- Reuse options for noremap
vim.g.mapleader = ' '

-- Moving lines in visual mode
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Moving between splits
map('', '<C-j>', '<C-W>j', opts)
map('', '<C-k>', '<C-W>k', opts)
map('', '<C-h>', '<C-W>h', opts)
map('', '<C-l>', '<C-W>l', opts)

vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true }) -- auto close brackets
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true }) -- auto close parentheses

--------------------------
-- Plugin configuration --
--------------------------
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Theme
	use 'rebelot/kanagawa.nvim'

	-- Alignment and text manipulation
	use 'junegunn/vim-easy-align'
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- required
			{
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' },
			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
		}
	}

	-- File searching and navigation
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim' -- required by telescope
	use 'preservim/nerdtree'
	use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
	--

	-- Markdown and LaTeX
	use {
		"iamcco/markdown-preview.nvim",
		run = 'vim.fn["mkdp#util#install"]()'
	}
	use 'img-paste-devs/img-paste.vim'
	use 'lervag/vimtex'
	use 'jbyuki/nabla.nvim'
	--

	use { 'stevearc/vim-arduino' }
	use { 'weirongxu/plantuml-previewer.vim' }
	use { 'tyru/open-browser.vim' }
	use { 'aklt/plantuml-syntax' }
	use { 'Pocco81/true-zen.nvim' }
end)

------------------------------------------
-- Plugin specific keymaps and settings --
------------------------------------------

-- Buffer tabs
vim.opt.termguicolors = true
require("bufferline").setup {
	options = {
		buffer_close_icon = '',
	}
}

-- LSP
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	lsp_zero.default_keymaps({ buffer = bufnr })
	-- lsp_zero.buffer_autoformat()
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'clangd', 'pyright', 'texlab' },
	handlers = {
		lsp_zero.default_setup,
	},
})

-- to fix the issue with the encodings error
require('lspconfig').clangd.setup {
	cmd = { "clangd", "--offset-encoding=utf-16" },
}

-- remove error messages from pycodestyle
require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
			-- enabled = false,
          ignore = {'W391', 'E501', 'E128'},
          -- maxLineLength = 100
        }
      }
    }
  }
}

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', opts)

-- NERDTree
map('n', '<leader>n', ':NERDTreeFocus<CR>', opts)
map('n', '<C-n>', ':NERDTree<CR>', opts)
map('n', '<C-t>', ':NERDTreeToggle<CR>', opts)
map('n', '<C-f>', ':NERDTreeFind<CR>', opts)

-- LaTeX
vim.g.vimtex_view_method = 'sioyek'
vim.g.vimtex_quickfix_open_on_warning = 0
map('n', '<leader>m', "<cmd>:lua require('nabla').popup({border = 'rounded'})<cr>", opts)

-- Markdown
map('n', '<leader>mp', '<cmd>MarkdownPreview<cr>', opts)
map('n', '<leader>mps', '<cmd>MarkdownPreviewStop<cr>', opts)
vim.g.mkdp_theme = 'light'
vim.cmd [[
  autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
]]

-----------------------
-- Utility functions --
-----------------------

-- Open file in new tmux pane
local function open_file_in_tmux()
	local selection = require('telescope.actions.state').get_selected_entry()
	local cmd = 'tmux split-window -h "nvim ' .. selection.path .. '"'
	vim.cmd('silent !' .. cmd)
end

-- Set keymapping for the tmux pane opening function
map('n', '<leader>t', '<cmd>lua open_file_in_tmux()<cr>', opts)
