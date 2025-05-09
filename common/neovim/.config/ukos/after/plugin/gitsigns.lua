require("gitsigns").setup {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "契" },
    topdelete = { text = "契" },
    changedelete = { text = "▎" },
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map({ "n", "v" }, "]c", function()
      if vim.wo.diff then return "]c" end
      vim.schedule(function() gs.next_hunk() end)
      return "<Ignore>"
    end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })

    map({ "n", "v" }, "[c", function()
      if vim.wo.diff then return "[c" end
      vim.schedule(function() gs.prev_hunk() end)
      return "<Ignore>"
    end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })

    -- Actions
    map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Gitsigns [H]unk [S]tage", silent = true })
    map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Gitsigns [H]unk [R]eset", silent = true })
    map("n", "<leader>hz", ":Gitsigns change_base HEAD<CR>",
      { desc = "Gitsigns change the base revision to diff against", silent = true })
    map("n", "<leader>hy", ":Gitsigns reset_base<CR>",
      { desc = "Gitsigns reset the base revision to diff against back to the index", silent = true })
    map("n", "<leader>hS", gs.stage_buffer, { desc = "Gitsigns [H]unk [S]tage entire buffer" })
    map("n", "<leader>hR", gs.reset_buffer, { desc = "Gitsigns [H]unks [R]eset entire buffer" })
    map("n", "<leader>hp", gs.preview_hunk, { desc = "Gitsigns [H]unk [P]review" })
    map("n", "<leader>hb", function() gs.blame_line { full = false } end,
      { desc = "Gitsigns [H]unk [B]lame Current Line" })
    map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Gitsigns [T]oggle [B]lame Current Line" })
    -- map("n", "<leader>hD", gs.diffthis, { desc = "Gitsigns [H]unks [D]iff" })
    map("n", "<leader>hd", function() gs.diffthis("~") end, { desc = "Gitsigns [H]unks [D]iff with Vimdiff" })
    -- map("n", "<leader>td", gs.preview_hunk_inline, { desc = "Gitsigns [T]oggle git show [D]eleted" })

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns Select Hunk" })
  end
}
