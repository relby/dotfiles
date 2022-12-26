local telescope = require('telescope')

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local themes = require('telescope.themes')

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
            },
        },
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }
    },
    extensions = {
        ['ui-select'] = {
            themes.get_cursor({
                borderchars = {
                    { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                    prompt = { '─', '│', ' ', '│', '┌', '┐', '│', '│' },
                    results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
                    preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                }
            })
        },
        -- ['file_browser'] = {
        --     hijack_netrw = true,
        -- }
    }
})

-- Extensions
telescope.load_extension('ui-select')
-- telescope.load_extension('file_browser')

-- Keybinds
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-A-p>', builtin.live_grep, {})
vim.keymap.set('n', '<leader><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>fg', builtin.git_status, {})
vim.keymap.set('n', '<leader>fb', builtin.builtin, {})
vim.keymap.set('n', '<leader>en', function() builtin.find_files({
        cwd = '~/.config/nvim/'
    })
end, {})
-- vim.keymap.set('n', '<leader>fn', telescope.extensions.notify.notify, {})
