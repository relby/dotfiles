-- Normal mode
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-s>', ':w<CR>')

vim.keymap.set('n', '<A-f>', function()
    vim.lsp.buf.format()
end)

vim.keymap.set('n', '<leader>sa', 'GVgg')

-- Move between windows
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

-- Paste and copy from clipboard
vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('x', '<leader>p', '"+p')
vim.keymap.set('x', '<leader>P', '"+P')
vim.keymap.set('x', '<leader>y', '"+y')

-- Insert mode
vim.keymap.set('i', 'kj', '<Esc>:w<CR>')
vim.keymap.set('i', 'Kj', '<Esc>:w<CR>')
vim.keymap.set('i', 'KJ', '<Esc>:w<CR>')
vim.keymap.set('i', '<A-BS>', '<C-w>')
