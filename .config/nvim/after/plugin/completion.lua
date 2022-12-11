local lspkind = require('lspkind')
lspkind.init()

local cmp = require('cmp')

cmp.setup({
    mapping = {
        -- Move up and down in a completion menu
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

        -- TODO: Figure out what these are
        -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-u>'] = cmp.mapping.scroll_docs(4),

        ['<C-f>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
        ['<Enter>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
        -- Open up a completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- This enables tab for comepletion and moving in snippets
        -- ['<Tab>'] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   elseif luasnip.expand_or_jumpable() then
        --     luasnip.expand_or_jump()
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' }),
        -- ['<S-Tab>'] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   elseif luasnip.jumpable(-1) then
        --     luasnip.jump(-1)
        --   else
        --     fallback()
        --   end
        -- end, { 'i', 's' }),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    -- Note: Sorted by priority (descending)
    -- config fields: keyword_length, priority, max_item_count
    sources = {
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'cmp_tabnine', keyword_length = 5 },
        { name = 'buffer', keyword_length = 5 },
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[lsp]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
                cmp_tabnine = "[TabNine]",
            },
        }),
    },
    experimental = {
        ghost_text = true,
    },
    window = {
        -- Use cmp.config.window.bordered() to see
        -- all default window settings
        completion = {
            border = 'single'
        },
        documentation = {
            border = 'single'
        },
    }
})
