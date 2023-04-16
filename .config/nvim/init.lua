-- General Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = 'a'
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.encoding = 'UTF-8'
vim.opt.hlsearch = true

-- Theme settings
vim.opt.background = 'dark'
vim.cmd('colorscheme gruvbox')
vim.cmd('hi Normal guibg=None ctermbg=NONE')

-- Plugins
local plugins = require('packer').startup(function()
	use 'wbthomason/packer.nvim'
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
    use 'junegunn/vim-easy-align'
    use {'nvim-telescope/telescope.nvim', tag = '0.1.1'}
	use 'nvim-lua/plenary.nvim' -- required by telescope

    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'

    use 'lervag/vimtex'

    -- use 'vim-pandoc/vim-pandoc'
    -- use 'vim-pandoc/vim-pandoc-syntax'
end)

-- Maps
vim.g.mapleader = ' '

-- Move line up or down in visual mode
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true})
vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', {noremap = true})

-- Maps to move between splits
vim.api.nvim_set_keymap('', '<C-j>', '<C-W>j', {})
vim.api.nvim_set_keymap('', '<C-k>', '<C-W>k', {})
vim.api.nvim_set_keymap('', '<C-h>', '<C-W>h', {})
vim.api.nvim_set_keymap('', '<C-l>', '<C-W>l', {})

-- Ctrl-a to select all
vim.api.nvim_set_keymap('', '<C-a>', '<esc>ggVG<CR>', {})

-- Plugins settings/maps
vim.api.nvim_set_keymap('n', '<leader>G', '<cmd>Goyo<cr>', {noremap = true})

-- Telescope remaps
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help _tags<cr>', {noremap = true})

-- LaTeX settings
vim.g.coc_filetype_map = {tex = 'latex'}
vim.g.vimtex_view_method = 'sioyek'
vim.g.vimtex_quickfix_open_on_warning = 0

vim.g.pandoc_modules_disabled = {'folding'}
vim.g.pandoc_spell_enabled = 0


-- Define function to open file in new tmux pane
function open_file_in_tmux()
  local selection = require('telescope.actions.state').get_selected_entry()
  local cmd = 'tmux split-window -h "nvim ' .. selection.path .. '"'
  vim.cmd('silent !' .. cmd)
end

-- Set keymapping for opening file in new tmux pane
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>lua open_file_in_tmux()<cr>', { noremap = true })

