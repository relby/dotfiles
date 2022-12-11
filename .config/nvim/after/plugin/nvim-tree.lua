vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup()

vim.keymap.set('n', '<C-n>', '<CMD>NvimTreeFindFileToggle<CR>', { silent = true })
vim.keymap.set('n', '<C-A-Left>', '<CMD>NvimTreeResize -1<CR>', { silent = true })
vim.keymap.set('n', '<C-A-Right>', '<CMD>NvimTreeResize +1<CR>', { silent = true })
