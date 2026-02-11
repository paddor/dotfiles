-- visual mode: make Y copy into X11 CLIPBOARD register
-- if vim.keymap then
-- 	vim.keymap.set('v', 'Y', '"+y')
-- end

-- vim.o.termguicolors = true
-- vim.o.background = 'dark'

local status, solarized = pcall(require, 'solarized')

if(status) then
  solarized.setup {
    variant = 'spring',
    -- variant = 'summer',
    -- variant = 'autumn',
    -- variant = 'winter',

    -- palette = 'selenized',
  }
  vim.cmd.colorscheme 'solarized'
end


-- snippets
-- local ls = require("luasnip")
--  vim.keymap.set({"i"}, "<Tab>", function() ls.expand() end, {silent = true})
--  vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump( 1) end, {silent = true})
--  vim.keymap.set({"i", "s"}, "<C-K>", function() ls.jump(-1) end, {silent = true})
--  vim.keymap.set({"i", "s"}, "<C-E>", function()
--   if ls.choice_active() then
--     ls.change_choice(1)
--   end
--  end, {silent = true})
