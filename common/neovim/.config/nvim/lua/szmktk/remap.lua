local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "Q", "<nop>")

-- quick escape from INSERT mode
map("i", "jk", "<ESC>")

-- quick exit (works best with "autowriteall" option, without it a "!" is necessary)
map("n", "QQ", "<cmd>qa<enter>", { noremap = false })

map("n", "<leader>ve", "<cmd>vsplit $MYVIMRC<CR>")
map("n", "<leader>vs", "<cmd>source $MYVIMRC<CR>")
map("n", "<leader>vev", "<cmd>vsplit ~/.vimrc<CR>")

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
map({"n", "v"}, "H", "^")
map({"n", "v"}, "L", "$")

-- fzf remaps
map("n", "<C-F>", "<cmd>Rg<CR>")
map("n", "<C-N>", "<cmd>GFiles<CR>")
map("n", "<leader>gc", "<cmd>GFiles?<CR>")
map("n", "<leader>af", "<cmd>Files<CR>")
map("n", "<leader>a", "<cmd>Buffers<CR>")
map("n", "<leader>A", "<cmd>Windows<CR>")
map("n", "<leader>;", "<cmd>BLines<CR>")
map("n", "<leader>o", "<cmd>BTags<CR>")
map("n", "<leader>O", "<cmd>Tags<CR>")
map("n", "<leader>?", "<cmd>History<CR>")
map("n", "<leader>gl", "<cmd>Commits<CR>")
map("n", "<leader>ga", "<cmd>BCommits<CR>")
map("n", "<leader>ft", "<cmd>Filetypes<CR>")

-- prettify and minify json with `jq`
map("n", "<leader>jp", "<cmd>%!jq<CR>")
map("n", "<leader>jm", "<cmd>%!jq -c<CR>")

-- buffer navigation
map("n", "[b", "<cmd>bprev<CR>")
map("n", "]b", "<cmd>bnext<CR>")

-- comments
map("n", "<C-_>", "<cmd>Commentary<CR>")
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>")
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>")

-- invoke git blame (aka "annotate" feature)
map("n", "<leader>gb", "<cmd>Git blame<CR>")

-- other remaps
map("n", "<leader>gs", "<cmd>Git<CR>")
map("n", "<leader>gk", "<cmd>vertical Git<CR>")
map("n", "<leader>lg", "<cmd>LazyGit<CR>")
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>")
map("n", "<leader>tw", "<cmd>set wrap!<CR>")
map("n", "<leader>sc", "<cmd>set spell!<CR>")
map("n", "<leader>ms", "<cmd>NvimTreeClose | mksession! | NvimTreeOpen<CR>")
map("n", "<leader>rs", "<cmd>source Session.vim<CR>")
map("n", "<leader>f", vim.lsp.buf.format)

-- try those out once LSP is fully functional ("quick-fix list navigation")
map("n", "<leader>qn", "<cmd>cnext<CR>zz")
map("n", "<leader>qp", "<cmd>cprev<CR>zz")
-- map("n", "<leader>k", "<cmd>lnext<CR>zz")
-- map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- very useful remaps for clipboard management
map("x", "<leader>p", [["_dP]])
map({"n", "v"}, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({"n", "v"}, "<leader>d", [["_d]])

-- replace the word under cursor in the scope of the current buffer
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("x", "<leader>s", [["hy:%s/<C-r>h/<C-r>h/gc<Left><Left><Left>]])
