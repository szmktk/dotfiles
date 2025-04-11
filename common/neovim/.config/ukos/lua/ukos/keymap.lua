local map = vim.keymap.set
local del = vim.keymap.del

vim.g.mapleader = " "
map("n", "Q", "<nop>")

-- neovim 11 introduced new default keymaps, see: https://gpanders.com/blog/whats-new-in-neovim-0-11/#more-default-mappings
del("n", "grn")
del("n", "grr")
del("n", "gri")
del("n", "gra")

-- quick escape from INSERT mode
map("i", "jk", "<ESC>")

-- quick exit (works best with "autowriteall" option, without it a "!" is necessary)
map("n", "QQ", "<cmd>qa<CR>", { noremap = false })

-- this was replaced by <C-L> in nvim 0.6.0 but "vim-tmux-navigator" plugin already occupies <C-L>
map("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>")

-- keep my buffer centered when navigating vertically
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- move lines in VISUAL mode with "J" & "K"
map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- more convenient horizontal navigation
map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "L", "$")

-- keymaps for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- keymaps for resizing splits
-- also remember about these default keymaps: "<C-w>_" & "<C-w>|"
map("n", "<C-w>,", "<cmd>vertical resize -10<CR>", { noremap = true, silent = true })
map("n", "<C-w>.", "<cmd>vertical resize +10<CR>", { noremap = true, silent = true })
map("n", "<C-w>-", "<cmd>resize -10<CR>", { noremap = true, silent = true })
map("n", "<C-w>+", "<cmd>resize +10<CR>", { noremap = true, silent = true })

-- very useful keymaps for clipboard management
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- replace the word under cursor in the scope of the current buffer
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("x", "<leader>s", [["hy:%s/<C-r>h/<C-r>h/gc<Left><Left><Left>]])

-- diagnostic keymaps
-- vim.diagnostic.open_float is triggered by <C-W><C-D> & <C-W>d
vim.keymap.set("n", "<leader>e", function()
  local current = vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = not current })
end, { desc = "Toggle diagnostic messages as virtual_lines" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- buffer navigation
map("n", "[b", "<cmd>bprev<CR>", { desc = "Go to previous buffer", noremap = true, silent = true })
map("n", "]b", "<cmd>bnext<CR>", { desc = "Go to next buffer", noremap = true, silent = true })

-- prettify and minify json with `jq`
map("n", "<leader>jp", "<cmd>%!jq<CR>", { desc = "[J]son [P]arse", noremap = true, silent = true })
map("n", "<leader>jm", "<cmd>%!jq -c<CR>", { desc = "[J]son [M]inify", noremap = true, silent = true })

-- noice keymaps
map("n", "<leader>nn", "<cmd>NoiceDismiss<CR>", { desc = "[N]oice dismiss all", noremap = true, silent = true })
map("n", "<leader>na", "<cmd>NoiceAll<CR>", { desc = "Show [N]oice [A]ll notifications", noremap = true, silent = true })
map("n", "<leader>nt", "<cmd>NoiceTelescope<CR>", { desc = "Show [N]oice in [T]elescope", noremap = true, silent = true })

-- cellular-automaton keymaps
map("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")
map("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
map("n", "<leader>fml", "<cmd>CellularAutomaton scramble<CR>")

-- various plugin launchers
map("n", "<leader>lg", "<cmd>LazyGit<CR>")
map("n", "<leader>ll", "<cmd>LazyGitLog<CR>")
map("n", "<leader>lf", "<cmd>LazyGitLogFile<CR>")
map("n", "<leader>gdv", "<cmd>DiffviewOpen<CR>")
map("n", "<leader>gdm", "<cmd>DiffviewOpen origin/main...HEAD<CR>")
map("n", "<leader>gdc", "<cmd>DiffviewClose<CR>")
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>")
map("n", "<leader>6", "<cmd>TodoTrouble<CR>")
map("n", "<leader>tu", "<cmd>Telescope undo<CR>", { desc = "[T]elescope [U]ndo" })
map("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", { desc = "[U]ndotree [T]oggle" })

-- comments
map("n", "<C-_>", "<cmd>Commentary<CR>", { desc = "Comment a line with CTRL+/", noremap = true, silent = true })
map("n", "<leader>vbn", "<cmd>DuplicateAndCommentLine<CR>",
  { desc = "Duplicate and comment out a line", noremap = true, silent = true })
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add comment below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add comment above" })

-- invoke git blame (aka "annotate" feature)
map("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "[G]it [B]lame", noremap = true, silent = true })

-- a time-saver for Go development
map("n", "<leader>gie", "<cmd>GoIfErr<CR>", { desc = "[G]o [I]f [E]rror", noremap = true, silent = true })

-- center the screen when jumping to marks
map("n", "'a", "'azz", { noremap = true, silent = true })
map("n", "'s", "'szz", { noremap = true, silent = true })
map("n", "'d", "'dzz", { noremap = true, silent = true })
map("n", "'f", "'fzz", { noremap = true, silent = true })
map("n", "'A", "'Azz", { noremap = true, silent = true })
map("n", "'S", "'Szz", { noremap = true, silent = true })
map("n", "'D", "'Dzz", { noremap = true, silent = true })
map("n", "'F", "'Fzz", { noremap = true, silent = true })
map("n", "'1", "'1zz", { noremap = true, silent = true })
map("n", "'2", "'2zz", { noremap = true, silent = true })
map("n", "'3", "'3zz", { noremap = true, silent = true })
map("n", "'4", "'4zz", { noremap = true, silent = true })
map("n", "'5", "'5zz", { noremap = true, silent = true })
map("n", "'6", "'6zz", { noremap = true, silent = true })
map("n", "'7", "'7zz", { noremap = true, silent = true })
map("n", "'8", "'8zz", { noremap = true, silent = true })
map("n", "'9", "'9zz", { noremap = true, silent = true })

-- other keymaps
map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "[T]oggle word [W]rap", noremap = true, silent = true })
map("n", "<leader>sc", "<cmd>set spell!<CR>", { desc = "Toggle [S]pell [C]heck", noremap = true, silent = true })
map("n", "<leader>sl", "<cmd>SessionSearch<CR>", { desc = "[S]ession [L]ens", noremap = true, silent = true })
map("n", "<leader>rs", "<cmd>source Session.vim<CR>", { desc = "[R]estore [S]ession", noremap = true, silent = true })
map("n", "<leader>ms", "<cmd>mksession!<CR>", {
  desc = "[M]ake [S]ession",
  noremap = true,
  silent = true
})
