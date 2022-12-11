-- Leader
vim.g.mapleader = ' '

-- Ignore files
vim.opt.wildignore = '__pycache__'
vim.opt.wildignore:append({ '*.o', '*.pyc', 'Cargo.lock' })

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars:append('tab:> ')
vim.opt.wrap = false
vim.opt.colorcolumn = '80'

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true
