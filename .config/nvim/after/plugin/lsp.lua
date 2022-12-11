require('mason').setup({
    ui = {
        border = 'single',
    },
})
local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
    ensure_installed = {
        'sumneko_lua',
        'rust_analyzer',
        'clangd',
        'pyright',
        'tsserver',
    },
})

mason_lspconfig.setup_handlers({
    -- Default configurations for all installed servers
    function(server_name)
        require('lspconfig')[server_name].setup({})
    end,
    ['sumneko_lua'] = function()
        require('lspconfig')['sumneko_lua'].setup({
            settings = {
                Lua = {
                    diagnostics = {
                        enable = true,
                        globals = { 'vim' }
                    },
                },
            },
        })
    end,
    ['rust_analyzer'] = function()
        require("rust-tools").setup({})
    end,
    ['clangd'] = function()
        require('lspconfig')['clangd'].setup({
            init_options = {
                fallbackFlags = {
                    '-std=c++17',
                    '-pedantic',
                    '-Wall',
                    '-Wextra',
                    '-Wswitch-enum',
                },
            },
        })
    end
})
--[[ UI Settings ]]
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {
        border = 'single',
    }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {
        border = 'single',
    }
)
-- Diagnostics
vim.diagnostic.config({
    float = {
        border = 'single'
    }
})

local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({ name = 'DiagnosticSignError', text = '' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignHint', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })

--[[ Keymaps ]]
-- General
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<F2>', vim.lsp.buf.rename)
vim.keymap.set('n', '<C-.>', vim.lsp.buf.code_action)

-- Diagnostics
vim.keymap.set('n', '<leader>ds', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>df', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>db', vim.diagnostic.goto_prev)
