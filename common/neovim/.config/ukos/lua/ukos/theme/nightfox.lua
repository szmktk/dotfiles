-- lazy.nvim entry:
-- { "EdenEast/nightfox.nvim", priority = 1000 },
-- config tested with version:
-- "nightfox.nvim": { "branch": "main", "commit": "eb82712f86319272f4b7b9dbb4ec6df650e6987f" },

require("nightfox").setup({
  options = {
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled",
    transparent = false,
    terminal_colors = true,
    dim_inactive = false,
    module_default = true,
    colorblind = {
      enable = false,
      simulate_only = false,
      severity = {
        protan = 0,
        deutan = 0,
        tritan = 0,
      },
    },
    styles = {
      comments = "NONE",
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

-- vim.cmd.colorscheme("nightfox")
-- vim.cmd.colorscheme("dayfox")
-- vim.cmd.colorscheme("dawnfox")
vim.cmd.colorscheme("duskfox")
-- vim.cmd.colorscheme("nordfox")
-- vim.cmd.colorscheme("terafox")
-- vim.cmd.colorscheme("carbonfox")

require("lualine").setup {
  options = {
    theme = "nightfox"
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
