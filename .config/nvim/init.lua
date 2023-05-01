-- General Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = 'a'
vim.opt.wrap = true
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
    -- Packer
    use 'wbthomason/packer.nvim'
    
    -- Markdown
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}
	use 'img-paste-devs/img-paste.vim'
	-- use {'godlygeek/tabular'}
	-- use {'preservim/vim-markdown'}
    
    -- Alignment and commenting
    use 'junegunn/vim-easy-align'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    
    -- File navigation and search
    use {'nvim-telescope/telescope.nvim', tag = '0.1.1'}
    use 'nvim-lua/plenary.nvim' -- required by telescope

    -- LaTeX
    use 'lervag/vimtex'
    
    -- Arduino
    use {'stevearc/vim-arduino'}
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
-- vim.api.nvim_set_keymap('', '<C-a>', '<esc>ggVG<CR>', {})

-- Plugin settings/maps

-- Telescope remaps
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help _tags<cr>', {noremap = true})

-- LaTeX settings
vim.g.coc_filetype_map = {tex = 'latex'}
vim.g.vimtex_view_method = 'sioyek'
vim.g.vimtex_quickfix_open_on_warning = 0

-- Arduino settings
vim.api.nvim_buf_set_keymap(0, "n", "<leader>aa", ":ArduinoAttach<CR>", {silent = true})
vim.api.nvim_buf_set_keymap(0, "n", "<leader>am", ":ArduinoVerify<CR>", {silent = true})
vim.api.nvim_buf_set_keymap(0, "n", "<leader>au", ":ArduinoUpload<CR>", {silent = true})
vim.api.nvim_buf_set_keymap(0, "n", "<leader>aus", ":ArduinoUploadAndSerial<CR>", {silent = true})
vim.api.nvim_buf_set_keymap(0, "n", "<leader>as", ":ArduinoSerial<CR>", {silent = true})
vim.api.nvim_buf_set_keymap(0, "n", "<leader>ab", ":ArduinoChooseBoard<CR>", {silent = true})
vim.api.nvim_buf_set_keymap(0, "n", "<leader>ap", ":ArduinoChooseProgrammer<CR>", {silent = true})

-- Markdown remaps
vim.api.nvim_set_keymap('n', '<leader>mp', '<cmd>MarkdownPreview<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>mps', '<cmd>MarkdownPreviewStop<cr>', {noremap = true})
vim.g.mkdp_theme = 'light'

vim.cmd([[
  autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
]])

vim.g.mdip_imgdir = 'img'
vim.g.mdip_imgname = 'image'


-- Define function to open file in new tmux pane
function open_file_in_tmux()
    local selection = require('telescope.actions.state').get_selected_entry()
    local cmd = 'tmux split-window -h "nvim ' .. selection.path .. '"'
    vim.cmd('silent !' .. cmd)
end

-- Set keymapping for opening file in new tmux pane
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>lua open_file_in_tmux()<cr>', { noremap = true })
