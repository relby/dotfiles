local opts = { noremap=true, silent=true }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end

local lsp_flags = {
    debounce_text_changes = 150,
}

local servers = { 'pyright' } 

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
  }
end

