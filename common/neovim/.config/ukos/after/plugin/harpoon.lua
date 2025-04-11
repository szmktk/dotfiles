local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
-- vim.keymap.set("n", "<leader>sm", ":Telescope harpoon marks<CR>",
--   { desc = "[S]earch Harpoon [M]arks", noremap = true, silent = true })

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon mark #1" })
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon mark #2" })
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon mark #3" })
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon mark #4" })
