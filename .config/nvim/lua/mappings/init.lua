local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Normal mode
map('n', '<C-n>', ':NvimTreeToggle<cr>', opts)
map('n', '<C-s>', ':wa<cr>', opts)
map('n', '<C-q>', ':qa<cr>', opts)
map('n', '<F5>', ':luafile %<cr>', opts)

-- Insert mode
map('i', 'kj', '<esc>', opts)
map('i', '<C-s>', '<esc>:wa<cr>', opts)

