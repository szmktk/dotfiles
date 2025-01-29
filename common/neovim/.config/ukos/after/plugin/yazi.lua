local map = vim.keymap.set
local yazi = require("yazi")

local function launch_yazi()
  yazi.yazi()
end

local function yazi_cwd()
  yazi.yazi(nil, vim.fn.getcwd())
end

map("n", "-", launch_yazi, {
  desc = "Open yazi file manager",
  noremap = true,
  silent = true,
})
map("n", "<leader>-", yazi_cwd, {
  desc = "Open yazi in nvim's [CW]D",
  noremap = true,
  silent = true,
})

yazi.setup({
  open_for_directories = false -- default
})
