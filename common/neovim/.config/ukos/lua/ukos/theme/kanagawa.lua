-- lazy.nvim entry:
-- { "rebelot/kanagawa.nvim", priority = 1000 },
-- config tested with version:
-- "kanagawa.nvim": { "branch": "master", "commit": "c19b9023842697ec92caf72cd3599f7dd7be4456" },

-- vim-illuminate does not work out-of-the-box with this theme
require("kanagawa").setup({
    compile = false,
    undercurl = true,
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false},
    statementStyle = { bold = false },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    -- theme = "wave",              -- Load "wave" theme when "background" option is not set
    -- background = {               -- map the value of "background" option to a theme
    --     dark = "wave",           -- try "dragon" !
    --     light = "lotus"
    -- },
})

vim.cmd.colorscheme("kanagawa-wave")
-- vim.cmd.colorscheme("kanagawa-dragon")
-- vim.cmd.colorscheme("kanagawa-lotus")

require("lualine").setup {
  options = {
    theme = "kanagawa"
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
