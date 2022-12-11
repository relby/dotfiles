require('gitsigns').setup({
    -- Try to configure it
})

vim.keymap.set('n', '<leader>gs', ':Gitsigns preview_hunk<CR>')
vim.keymap.set('n', '<leader>gf', ':Gitsigns next_hunk<CR>')
vim.keymap.set('n', '<leader>gb', ':Gitsigns prev_hunk<CR>')
