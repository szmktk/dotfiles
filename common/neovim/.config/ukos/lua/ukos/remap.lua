local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "Q", "<nop>")

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

-- remaps for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- remaps for resizing splits
-- also remember about these default remaps: "<C-w>_" & "<C-w>|"
map("n", "<C-w>,", ":vertical resize -10<CR>", { noremap = true, silent = true })
map("n", "<C-w>.", ":vertical resize +10<CR>", { noremap = true, silent = true })
map("n", "<C-w>-", ":resize -10<CR>", { noremap = true, silent = true })
map("n", "<C-w>+", ":resize +10<CR>", { noremap = true, silent = true })

-- very useful remaps for clipboard management
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- replace the word under cursor in the scope of the current buffer
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("x", "<leader>s", [["hy:%s/<C-r>h/<C-r>h/gc<left><left><left>]])

-- diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- try those out once LSP is fully functional ("quick-fix list navigation")
map("n", "<leader>qn", "<cmd>cnext<CR>zz")
map("n", "<leader>qp", "<cmd>cprev<CR>zz")
-- map("n", "<leader>k", "<cmd>lnext<CR>zz")
-- map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- prettify and minify json with `jq`
map("n", "<leader>jp", "<cmd>%!jq<CR>", { desc = "[J]son [P]arse", noremap = true, silent = true })
map("n", "<leader>jm", "<cmd>%!jq -c<CR>", { desc = "[J]son [M]inify", noremap = true, silent = true })

-- cellular-automaton remaps
map("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")
map("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
map("n", "<leader>fml", "<cmd>CellularAutomaton scramble<CR>")

-- various plugin launchers
map("n", "<leader>lg", "<cmd>LazyGit<CR>")
map("n", "<leader>ll", "<cmd>LazyGitLog<CR>")
map("n", "<leader>lf", "<cmd>LazyGitLogFile<CR>")
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>")
map("n", "<leader>6", "<cmd>TodoTrouble<CR>")
map("n", "<leader>tu", "<cmd>Telescope undo<CR>", { desc = "[T]elescope [U]ndo" })
map("n", "<leader>ut", "<cmd>UndotreeToggle<CR>", { desc = "[U]ndotree [T]oggle" })

-- comment out a single line with CTRL+/
map("n", "<C-_>", "<cmd>Commentary<CR>", { noremap = true, silent = true })
-- duplicate and comment out a line
map("n", "<leader>vbn", "<cmd>DuplicateAndCommentLine<CR>", { noremap = true, silent = true })

-- invoke git blame (aka "annotate" feature)
map("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "[G]it [B][L]ame", noremap = true, silent = true })

-- a time-saver for Go development
map("n", "<leader>gie", "<cmd>GoIfErr<CR>", { desc = "[G]o [I]f [E]rror", noremap = true, silent = true })

-- other remaps
map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "[T]oggle word [W]rap", noremap = true, silent = true })
map("n", "<leader>sc", "<cmd>set spell!<CR>", { desc = "Toggle [S]pell [C]heck", noremap = true, silent = true })
map("n", "<leader>nn", "<cmd>NoiceDismiss<CR>", { noremap = true, silent = true })
map("n", "<leader>sl", "<cmd>SearchSession<CR>", { desc = "[S]ession [L]ens", noremap = true, silent = true })
map("n", "<leader>rs", "<cmd>source Session.vim<CR>", { desc = "[R]estore [S]ession", noremap = true, silent = true })
map("n", "<leader>ms", "<cmd>NvimTreeClose | mksession! | NvimTreeOpen<CR>", {
  desc = "[M]ake [S]ession",
  noremap = true,
  silent = true
})
