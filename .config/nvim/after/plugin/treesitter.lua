require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'help',
        'lua',
        'python',
        'rust',
        'javascript',
        'typescript',
        'go',
        'c',
        'cpp',
    },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true }
})

--require('treesitter-context').setup({
--})
