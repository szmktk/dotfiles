local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "Q", "<nop>")

-- quick escape from INSERT mode
map("i", "jk", "<ESC>")

-- quick exit (works best with "autowriteall" option, without it a "!" is necessary)
map("n", "QQ", "<cmd>qa<enter>", { noremap = false })

map("n", "<leader>ve", "<cmd>vsplit $MYVIMRC<CR>", { desc = "[V]ertical [E]dit $MYVIMRC" })
map("n", "<leader>vs", "<cmd>source $MYVIMRC<CR>", { desc = "Source $MYVIMRC" })
map("n", "<leader>vev", "<cmd>vsplit ~/.vimrc<CR>", { desc = "[V]ertical [E]dit [V]imrc" })

map("n", "<leader>f", vim.lsp.buf.format, { desc = "Format current buffer with LSP" })

-- this was replaced by <C-L> in nvim 0.6.0 but "vim-tmux-navigator" plugin already occupies <C-L>
map("n", "<ESC><ESC>", "<cmd>nohlsearch<CR>")

-- keep my buffer centered when navigating vertically
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- move lines in VISUAL mode with "J" & "K"
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- more convenient horizontal navigation
map({ "n", "v" }, "H", "^")
map({ "n", "v" }, "L", "$")

-- fzf remaps
-- map("n", "<C-F>", "<cmd>Rg<CR>")  -- telescope got this
-- map("n", "<C-N>", "<cmd>GFiles<CR>")  -- telescope got this
map("n", "<leader>gc", "<cmd>GFiles?<CR>", { desc = "FZF show [G]it [C]hanged files" })
map("n", "<leader>af", "<cmd>Files<CR>", { desc = "FZF show [A]ll [F]iles" })
-- map("n", "<leader>a", "<cmd>Buffers<CR>")  -- telescope got this
-- map("n", "<leader>A", "<cmd>Windows<CR>")  -- conflicts with treesitter's swap_prev
map("n", "<leader>;", "<cmd>BLines<CR>", { desc = "FZF search lines in the current buffer" })
map("n", "<leader>o", "<cmd>BTags<CR>", { desc = "FZF show tags in the current buffer" })
map("n", "<leader>O", "<cmd>Tags<CR>", { desc = "FZF show tags in the project (ctags -R)" })
-- map("n", "<leader>?", "<cmd>History<CR>")  -- telescope got this
map("n", "<leader>gl", "<cmd>Commits<CR>", { desc = "FZF show [G]it commit [L]og" })
map("n", "<leader>ga", "<cmd>BCommits<CR>", { desc = "FZF show [G]it [A]ll commits for the current buffer" }) -- visual-select lines to track changes in the range
map("n", "<leader>ft", "<cmd>Filetypes<CR>", { desc = "FZF show [F]ile [T]ypes" })
map("n", "<leader>m", "<cmd>Maps<CR>", { desc = "FZF show normal mode [M]appings" })

-- remaps for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- very useful remaps for clipboard management
map("x", "<leader>p", [["_dP]])
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- replace the word under cursor in the scope of the current buffer
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- try those out once LSP is fully functional ("quick-fix list navigation")
-- map("n", "<C-k>", "<cmd>cnext<CR>zz")
-- map("n", "<C-j>", "<cmd>cprev<CR>zz")
-- map("n", "<leader>k", "<cmd>lnext<CR>zz")
-- map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- goto-preview plugin remaps
map("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
  { desc = "[G]oto [P]review [D]efinition", noremap = true })
map("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
  { desc = "Goto [P]review [T]ype definition", noremap = true })
map("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
  { desc = "[G]oto [P]review [I]mplementation", noremap = true })
map("n", "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
  { desc = "[G]oto [P]review [D]eclaration", noremap = true })
map("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>",
  { desc = "Goto Preview close all windows", noremap = true })
map("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
  { desc = "[G]oto [P]review [R]eferences", noremap = true })

-- prettify and minify json with `jq`
map("n", "<leader>jp", "<cmd>%!jq<CR>", { desc = "[J]son [P]arse" })
map("n", "<leader>jm", "<cmd>%!jq -c<CR>", { desc = "[J]son [M]inify" })

-- DAP remaps
map("n", "<leader>dt", "<cmd>DapUiToggle<CR>", { desc = "[D]ebug UI [T]oggle", noremap = true, silent = true })
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>",
  { desc = "[D]ebug Toggle [B]reakpoint", noremap = true, silent = true })
map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "[D]ebug [C]ontinue", noremap = true, silent = true })
map("n", "<leader>dr", "<cmd>lua require('dapui').open({reset = true})<CR>",
  { desc = "[D]ebug [R]eset UI", noremap = true, silent = true })
map("n", "<F2>", "<cmd>DapTerminate<CR>", { desc = "Stop DAP (F2)", noremap = true, silent = true })
map("n", "<F7>", "<cmd>DapStepInto<CR>", { desc = "Step Into (F7)", noremap = true, silent = true })
map("n", "<F8>", "<cmd>DapStepOver<CR>", { desc = "Step Over (F8)", noremap = true, silent = true })
map("n", "<S-F8>", "<cmd>DapStepOut<CR>", { desc = "Step Out (SHIFT + F8)", noremap = true, silent = true })
map("n", "<F9>", "<cmd>DapContinue<CR>", { desc = "Start/Continue (F9)", noremap = true, silent = true })
map("n", "<leader>dpm", "<cmd>lua require('dap-python').test_method()<CR>",
  { desc = "[D]ebug [P]ython [M]ethod", noremap = true })
map("n", "<leader>dpc", "<cmd>lua require('dap-python').test_class()<CR>",
  { desc = "[D]ebug [P]ython [C]lass", noremap = true })

-- cellular-automaton remaps
map("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")
map("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
map("n", "<leader>fml", "<cmd>CellularAutomaton scramble<CR>")

-- various plugin launchers
map("n", "<leader>lg", "<cmd>LazyGit<CR>")
map("n", "<leader>xx", "<cmd>TroubleToggle<CR>")
map("n", "<leader>6", "<cmd>TodoTrouble<CR>")
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>")

-- comment out a single line with CTRL+/
map("n", "<C-_>", "<cmd>Commentary<CR>")

-- other remaps
map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "[T]oggle word [W]rap" })
map("n", "<leader>rs", "<cmd>source Session.vim<CR>", { desc = "[R]estore [S]ession" })
map("n", "<leader>nn", "<cmd>NoiceDismiss<CR>", { noremap = true, silent = true })
