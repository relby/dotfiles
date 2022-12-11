local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    -- Colorschemas
    use('folke/tokyonight.nvim')
    use('ellisonleao/gruvbox.nvim')
    use('EdenEast/nightfox.nvim')
    use('rose-pine/neovim')
    -- Development
    use('nvim-tree/nvim-tree.lua')
    use('nvim-treesitter/nvim-treesitter-context')
    use('nvim-tree/nvim-web-devicons')
    use('nvim-treesitter/nvim-treesitter')
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } },
    })
    use('nvim-telescope/telescope-ui-select.nvim')
    use('folke/zen-mode.nvim')
    use('numToStr/Comment.nvim')
    use({
        'akinsho/toggleterm.nvim',
        tag = '*',
    })
    -- LSP
    use('neovim/nvim-lspconfig')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')
    use('simrat39/rust-tools.nvim')
    -- Completion
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-nvim-lua')
    use('hrsh7th/cmp-nvim-lsp')
    use('saadparwaiz1/cmp_luasnip')
    use('onsails/lspkind.nvim')
    use({ 'tzachar/cmp-tabnine', run = './install.sh' })
    -- Snippets
    use('L3MON4D3/LuaSnip')

    -- Cool stuff
    use('eandrju/cellular-automaton.nvim')
    use('j-hui/fidget.nvim')
    -- UI
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })
    use('lewis6991/gitsigns.nvim')

    if packer_bootstrap then
        require('packer').sync()
    end
end)
