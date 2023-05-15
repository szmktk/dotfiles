local tree_cb = require"nvim-tree.config".nvim_tree_callback

require"nvim-tree".setup {
  -- disables netrw completely
  disable_netrw = false,
  -- hijack netrw window on startup
  hijack_netrw = true,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  -- open_on_tab = false,
  open_on_tab = true,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor = true,
  -- updates the root directory of the tree on `DrChanged` (when your run `:cd` usually)
  update_cwd = false,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable = true,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = nil,
    -- the command arguments as a list
    args = {}
  },

  view = {
    -- width of the window, can be either a number (columns) or a string in `%`
    width = 35,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
    side = "left",
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      list = {{key = "l", cb = tree_cb("edit")}, {key = "h", cb = tree_cb("close_node")}}
    }
  },

  actions = {
    open_file = {
      -- if true the tree will resize itself after opening a file
      resize_window = true,
    }
  },

  git = { enable = true, ignore = false }
}

--vim.api.nvim_set_keymap("n", "<Leader>b", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<M-1>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

-- disable word wrap
vim.cmd('autocmd FileType LuaTree setlocal nowrap')

