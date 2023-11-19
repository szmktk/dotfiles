-- onedark.nvim theme
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

-- darcula-solid theme (somewhere between onedark's warm & warmer, but with a different syntax highlighting theme)
-- vim.cmd.colorscheme("darcula-solid")
-- vim.opt.termguicolors = true
-- vim.opt.background = "dark"

require("lualine").setup {
  options = {
    theme = "onedark" -- requies onedark.nvim to be loaded
    -- theme = "moonfly"
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
