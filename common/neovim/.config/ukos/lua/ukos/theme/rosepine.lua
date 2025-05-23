-- lazy.nvim entry:
-- { "rose-pine/neovim", name = "rose-pine", priority = 1000 },
-- config tested with version:
-- "rose-pine": { "branch": "main", "commit": "92762f4fa2144c05db760ea254f4c399a56a7ef5" },

-- vim-illuminate does not work out-of-the-box with this theme
require("rose-pine").setup({
  --- @usage "auto"|"main"|"moon"|"dawn"
  variant = "moon",
  --- @usage "main"|"moon"|"dawn"
  dark_variant = "main",
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = false,
  disable_italics = false,

  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    background = "base",
    background_nc = "_experimental_nc",
    panel = "surface",
    panel_nc = "base",
    border = "highlight_med",
    comment = "muted",
    link = "iris",
    punctuation = "subtle",

    error = "love",
    hint = "iris",
    info = "foam",
    warn = "gold",

    headings = {
      h1 = "iris",
      h2 = "foam",
      h3 = "rose",
      h4 = "gold",
      h5 = "pine",
      h6 = "foam",
    }
    -- or set all headings at once
    -- headings = "subtle"
  },

  -- Change specific vim highlight groups
  -- https://github.com/rose-pine/neovim/wiki/Recipes
  highlight_groups = {
    ColorColumn = { bg = "rose" },

    -- Blend colours against the "base" background
    CursorLine = { bg = "foam", blend = 10 },
    StatusLine = { fg = "love", bg = "love", blend = 10 },

    -- By default each group adds to the existing config.
    -- If you only want to set what is written in this config exactly,
    -- you can set the inherit option:
    Search = { bg = "gold", inherit = false },
  }
})

vim.cmd.colorscheme("rose-pine")

local lualine_sections = require("ukos.theme.lualine")
require("lualine").setup {
  options = { theme = "rose-pine" },
  sections = lualine_sections.active,
  inactive_sections = lualine_sections.inactive
}
