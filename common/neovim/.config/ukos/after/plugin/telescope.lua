local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")

local function search_in_hidden_files(opts)
  return { "--hidden" }
end

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        -- ["<C-u>"] = false,
        -- ["<C-d>"] = false,
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<esc>"] = actions.close,
      },
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true,
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
          ["<cr>"] = require("telescope-undo.actions").yank_additions,
          ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
          ["<C-cr>"] = require("telescope-undo.actions").restore,
          -- alternative defaults, for users whose terminals do questionable things with modified <cr>
          ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
          ["<C-r>"] = require("telescope-undo.actions").restore,
        },
        n = {
          ["y"] = require("telescope-undo.actions").yank_additions,
          ["Y"] = require("telescope-undo.actions").yank_deletions,
          ["u"] = require("telescope-undo.actions").restore,
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
      additional_args = search_in_hidden_files
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "undo")
pcall(require("telescope").load_extension, "live_grep_args")

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
    require("telescope.builtin").live_grep({
      search_dirs = { git_root },
    })
  end
end

vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<C-N>", require("telescope.builtin").git_files, { desc = "Search git files", noremap = true })
vim.keymap.set("n", "<C-F>", require("telescope").extensions.live_grep_args.live_grep_args,
  { desc = "Grep files with args", noremap = true })
vim.keymap.set("n", "<leader>gh", require("telescope.builtin").live_grep,
  { desc = "[G]rep Files (including [H]idden)", noremap = true })
vim.keymap.set("n", "<leader>sg", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by Grep on [G]it Root", noremap = true })
-- vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles", noremap = true })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files,
  { desc = "[S]earch All [F]iles", noremap = true })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp", noremap = true })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string,
  { desc = "[S]earch current [W]ord", noremap = true })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics,
  { desc = "[S]earch [D]iagnostics", noremap = true })
vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]resume", noremap = true })
vim.keymap.set("n", "<leader>tt", require("telescope.builtin").builtin, { desc = "[T]elescope builtin", noremap = true })
vim.keymap.set("n", "<leader>gs", require("telescope.builtin").git_status, { desc = "[G]it [S]tatus", noremap = true })
