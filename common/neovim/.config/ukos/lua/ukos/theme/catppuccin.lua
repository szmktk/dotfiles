-- lazy.nvim entry:
-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
-- config tested with version:
-- "catppuccin": { "branch": "main", "commit": "a2107df4379d66e72a36a89792603151cebec1bf" },

require("catppuccin").setup({
    -- flavour = "mocha", -- latte, frappe, macchiato, mocha
    -- background = { -- :h background
    --     light = "latte",
    --     dark = "mocha",
    -- },
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = true,
    no_bold = true,
    no_underline = true,
})

-- vim.cmd.colorscheme("catppuccin-latte")
-- vim.cmd.colorscheme("catppuccin-frappe")
vim.cmd.colorscheme("catppuccin-macchiato")
-- vim.cmd.colorscheme("catppuccin-mocha")

require("lualine").setup {
  options = {
    theme = "catppuccin"
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
