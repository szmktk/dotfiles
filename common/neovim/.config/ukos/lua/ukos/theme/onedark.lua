-- lazy.nvim entry:
-- { "navarasu/onedark.nvim", priority = 1000 },
-- config tested with version:
-- "onedark.nvim": { "branch": "master", "commit": "b9acd92ded2ba155867ca5af9d618e933d96e3b0" },

-- vim-illuminate does not work out-of-the-box with this theme
local theme = require("onedark")

theme.setup {
  -- style = "dark" -- default
  -- style = "darker"
  -- style = "cool"
  -- style = "deep"
  -- style = "warm"
  style = "warmer",
  highlights = {
    -- https://github.com/RRethy/vim-illuminate/issues/154#issuecomment-1400005544
    IlluminatedWordText = { bg = "#32424f" },
    IlluminatedWordRead = { bg = "#32424f" },
    IlluminatedWordWrite = { bg = "#32424f" },
  },
}

theme.load()

local lualine_sections = require("ukos.theme.lualine")
require("lualine").setup {
  options = { theme = "onedark" },
  sections = lualine_sections.active,
  inactive_sections = lualine_sections.inactive
}
