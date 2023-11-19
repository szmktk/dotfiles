-- https://www.reddit.com/r/neovim/comments/xj3blh/how_to_set_a_neovim_keymap_to_work_for_only/
-- https://www.reddit.com/r/neovim/comments/x3zp6t/usage_of_afterftplugin_directory_for/

vim.keymap.set("n", "<leader>oi", "<cmd>!isort % --profile black<CR>", { buffer = 0 })
vim.keymap.set("n", "<leader>fp", "<cmd>!black % -q --line-length 120 --skip-string-normalization --target-version py38 --target-version py39<CR>", { buffer = 0 })
