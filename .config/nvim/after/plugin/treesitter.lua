require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'python', 'rust', 'c', 'cpp' },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
    },
})

--require('treesitter-context').setup({
--})
