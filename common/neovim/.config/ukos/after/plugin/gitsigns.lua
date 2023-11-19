require("gitsigns").setup {
  signs = {
    add = {
      hl = "GitSignsAdd",
      text = "▎",
      numhl = "GitSignsAddNr",
      linehl = "GitSignsAddLn",
    },
    change = {
      hl = "GitSignsChange",
      text = "▎",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
    delete = {
      hl = "GitSignsDelete",
      text = "契",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    topdelete = {
      hl = "GitSignsDelete",
      text = "契",
      numhl = "GitSignsDeleteNr",
      linehl = "GitSignsDeleteLn",
    },
    changedelete = {
      hl = "GitSignsChange",
      text = "▎",
      numhl = "GitSignsChangeNr",
      linehl = "GitSignsChangeLn",
    },
  },

  -- https://github.com/lewis6991/gitsigns.nvim/issues/775#issuecomment-1589415441
  _signs_staged_enable = true,

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
    map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Gitsigns [H]unk [S]tage" })
    map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Gitsigns [H]unk [R]eset" })
    map("n", "<leader>gh", ":Gitsigns change_base HEAD<CR>",
      { desc = "Gitsigns change the base revision to diff against" })
    map("n", "<leader>hg", ":Gitsigns reset_base<CR>",
      { desc = "Gitsigns reset the base revision to diff against back to the index" })
    map("n", "<leader>hS", gs.stage_buffer, { desc = "Gitsigns [H]unk [S]tage entire buffer" })
    map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Gitsigns [H]unk Stage [U]ndo" })
    map("n", "<leader>hR", gs.reset_buffer, { desc = "Gitsigns [H]unks [R]eset entire buffer" })
    map("n", "<leader>hp", gs.preview_hunk, { desc = "Gitsigns [H]unk [P]review" })
    map("n", "<leader>hb", function() gs.blame_line { full = true } end,
      { desc = "Gitsigns [H]unk [B]lame Current Line" })
    map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Gitsigns [T]oggle [B]lame Current Line" })
    -- map("n", "<leader>hD", gs.diffthis, { desc = "Gitsigns [H]unks [D]iff" })
    map("n", "<leader>hd", function() gs.diffthis("~") end, { desc = "Gitsigns [H]unks [D]iff with Vimdiff" })
    map("n", "<leader>td", gs.toggle_deleted, { desc = "Gitsigns [T]oggle [D]eleted" })

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns Select Hunk" })
  end
}
