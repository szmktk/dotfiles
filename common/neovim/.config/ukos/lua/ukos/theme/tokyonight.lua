-- lazy.nvim entry:
-- {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
-- },
-- config tested with version:
-- "tokyonight.nvim": { "branch": "main", "commit": "f247ee700b569ed43f39320413a13ba9b0aef0db" },

-- vim.cmd.colorscheme("tokyonight-night")
vim.cmd.colorscheme("tokyonight-storm")
-- vim.cmd.colorscheme("tokyonight-day")
-- vim.cmd.colorscheme("tokyonight-moon")

require("lualine").setup {
  options = {
    theme = "tokyonight"
  },
  sections = {
    lualine_c = {
      {
        "filename",
        file_status = true,
        newfile_status = true,
        path = 1, -- 1: Relative path
      }
    }
  },
  inactive_sections = {
    lualine_c = {
      {
        "filename",
        file_status = true,
        newfile_status = true,
        path = 1, -- 1: Relative path
      }
    }
  }
}
