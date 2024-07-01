-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
-- vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()



-- vim.g.clipboard = {
--   name = 'OSC 52',
--   copy = {
--     ['+'] = require('vim.ui.clipboard.osc52').copy('+'), -- works
--     ['*'] = require('vim.ui.clipboard.osc52').copy('*'), -- does not work
--   },
--   paste = {
--     ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
--     ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
--   },
-- }

-- vim.keymap.set('n', '<leader>c', '"+y')
-- vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
-- vim.keymap.set('v', '<leader>c', '"+y') -- too slow
vim.keymap.set('v', 'Y', '"+y')
