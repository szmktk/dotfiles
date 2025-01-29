-- lazy.nvim entry:
-- { "briones-gabriel/darcula-solid.nvim", dependencies = { "rktjmp/lush.nvim" }, priority = 1000 },
-- config tested with version:
-- "darcula-solid.nvim": { "branch": "main", "commit": "d950b9ca20096313c435a93e57af7815766f3d3d" },

-- vim-illuminate does not work out-of-the-box with this theme
-- darcula-solid theme (somewhere between onedark's warm & warmer, but with a different syntax highlighting theme)
vim.cmd.colorscheme("darcula-solid")
vim.opt.termguicolors = true
vim.opt.background = "dark"

local lualine_sections = require("ukos.theme.lualine")
require("lualine").setup {
  options = { theme = "moonfly" },
  sections = lualine_sections.active,
  inactive_sections = lualine_sections.inactive
}
