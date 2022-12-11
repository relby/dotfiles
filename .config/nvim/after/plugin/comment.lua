require('Comment').setup()

local api = require('Comment.api')

-- Map comment on <ctrl-slash>
vim.keymap.set('n', '<C-_>', api.toggle.linewise.current)
vim.keymap.set('x', '<C-_>', function()
    local esc = vim.api.nvim_replace_termcodes(
        '<ESC>', true, false, true
    )
    vim.api.nvim_feedkeys(esc, 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
end)
