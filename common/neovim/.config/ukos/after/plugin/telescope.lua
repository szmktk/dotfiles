local telescope = require("telescope")
local telescope_actions = require("telescope.actions")
local telescope_builtin = require("telescope.builtin")
local telescope_themes = require("telescope.themes")
local telescope_undo_actions = require("telescope-undo.actions")
local lga_actions = require("telescope-live-grep-args.actions")
local map = vim.keymap.set

local function search_in_hidden_files(opts)
  return { "--hidden" }
end

telescope.setup {
  defaults = {
    mappings = {
      i = {
        -- ["<C-u>"] = false,
        -- ["<C-d>"] = false,
        ["<C-j>"] = telescope_actions.move_selection_next,
        ["<C-k>"] = telescope_actions.move_selection_previous,
        ["<esc>"] = telescope_actions.close,
      },
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true,
      theme = "ivy",
      mappings = {
        i = {
          ["<C-p>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          ["<C-h>"] = lga_actions.quote_prompt({ postfix = " --hidden " }),
          ["<C-n>"] = lga_actions.quote_prompt({ postfix = " -t " }),
        },
      },
    },
    undo = {
      use_delta = true,
      side_by_side = false,
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.8,
      },
      mappings = {
        i = {
          ["<cr>"] = telescope_undo_actions.yank_additions,
          ["<S-cr>"] = telescope_undo_actions.yank_deletions,
          ["<C-cr>"] = telescope_undo_actions.restore,
          -- alternative defaults, for users whose terminals do questionable things with modified <cr>
          ["<C-y>"] = telescope_undo_actions.yank_deletions,
          ["<C-r>"] = telescope_undo_actions.restore,
        },
        n = {
          ["y"] = telescope_undo_actions.yank_additions,
          ["Y"] = telescope_undo_actions.yank_deletions,
          ["u"] = telescope_undo_actions.restore,
        },
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true
    },
    live_grep = {
      additional_args = search_in_hidden_files
    },
    grep_string = {
      additional_args = search_in_hidden_files,
      theme = "ivy",
    },
  },
}

-- Enable telescope extensions
pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "harpoon")
pcall(telescope.load_extension, "live_grep_args")
pcall(telescope.load_extension, "undo")

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not a git repository. Searching on current working directory")
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    telescope_builtin.live_grep({
      search_dirs = { git_root },
    })
  end
end

vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

-- telescope remaps
map("n", "<leader>?", telescope_builtin.oldfiles, {
  desc = "[?] Find recently opened files",
  noremap = true,
  silent = true,
})
map("n", "<leader><space>", telescope_builtin.buffers, {
  desc = "[ ] Find existing buffers",
  noremap = true,
  silent = true,
})
map("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  telescope_builtin.current_buffer_fuzzy_find(telescope_themes.get_ivy {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer", noremap = true, silent = true })
map("n", "<C-N>", telescope_builtin.git_files, {
  desc = "Search git files",
  noremap = true,
  silent = true,
})
map("n", "<C-F>", telescope.extensions.live_grep_args.live_grep_args, {
  desc = "Grep files with args",
  noremap = true,
  silent = true,
})
map("n", "<leader>gh", telescope_builtin.live_grep, {
  desc = "[G]rep Files (including [H]idden)",
  noremap = true,
  silent = true,
})
map("n", "<leader>sg", ":LiveGrepGitRoot<cr>", {
  desc = "[S]earch by Grep on [G]it Root",
  noremap = true,
  silent = true,
})
map("n", "<leader>sf", telescope_builtin.find_files, {
  desc = "[S]earch All [F]iles",
  noremap = true,
  silent = true,
})
map("n", "<leader>sh", telescope_builtin.help_tags, {
  desc = "[S]earch [H]elp",
  noremap = true,
  silent = true,
})
map("n", "<leader>sw", telescope_builtin.grep_string, {
  desc = "[S]earch current [W]ord",
  noremap = true,
  silent = true,
})
map("n", "<leader>sd", telescope_builtin.diagnostics, {
  desc = "[S]earch [D]iagnostics",
  noremap = true,
  silent = true,
})
map("n", "<leader>sr", telescope_builtin.resume, {
  desc = "[S]earch [R]resume",
  noremap = true,
  silent = true,
})
map("n", "<leader>sn", function() telescope_builtin.find_files { cwd = vim.fn.stdpath 'config' } end, {
  desc = "[S]earch [N]eovim files",
  noremap = true,
  silent = true,
})
map("n", "<leader>sm", telescope_builtin.marks, {
  desc = "[S]earch [M]arks",
  noremap = true,
  silent = true,
})
map("n", "<leader>tt", telescope_builtin.builtin, {
  desc = "[T]elescope builtin",
  noremap = true,
  silent = true,
})
map("n", "<leader>gs", telescope_builtin.git_status, {
  desc = "[G]it [S]tatus",
  noremap = true,
  silent = true,
})
map("n", "<leader>gt", telescope_builtin.git_branches, {
  desc = "[G]it [B]ranches",
  noremap = true,
  silent = true,
})

-- fzf remaps
map("n", "<leader>gc", "<cmd>GFiles?<CR>", {
  desc = "FZF show [G]it [C]hanged files",
  noremap = true,
  silent = true,
})
map("n", "<leader>af", "<cmd>Files<CR>", {
  desc = "FZF show [A]ll [F]iles",
  noremap = true,
  silent = true,
})
map("n", "<leader>;", "<cmd>BLines<CR>", {
  desc = "FZF search lines in the current buffer",
  noremap = true,
  silent = true,
})
map("n", "<leader>o", "<cmd>BTags<CR>", {
  desc = "FZF show tags in the current buffer",
  noremap = true,
  silent = true,
})
map("n", "<leader>O", "<cmd>Tags<CR>", {
  desc = "FZF show tags in the project (ctags -R)",
  noremap = true,
  silent = true,
})
map("n", "<leader>gl", "<cmd>Commits<CR>", {
  desc = "FZF show [G]it commit [L]og",
  noremap = true,
  silent = true,
})
map("n", "<leader>ga", "<cmd>BCommits<CR>", {
  desc = "FZF show [G]it [A]ll commits for the current buffer", -- visual-select lines to track changes in the range
  noremap = true,
  silent = true,
})
map("n", "<leader>ft", "<cmd>Filetypes<CR>", {
  desc = "FZF show [F]ile [T]ypes",
  noremap = true,
  silent = true,
})
map("n", "<leader>m", "<cmd>Maps<CR>", {
  desc = "FZF show normal mode [M]appings",
  noremap = true,
  silent = true,
})
