require('zen-mode').setup({
    window = {
        width = 95,
    }
})

vim.keymap.set("n", "<leader>zz", function()
    vim.cmd [[ ZenMode ]]
    vim.opt.wrap = false
    vim.opt.number = true
    vim.opt.relativenumber = true
end)
