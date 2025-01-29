-- UI - User Interface plugins
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      lazy = true
    }
  },
  { "nanozuki/tabby.nvim" },
  {
    "folke/noice.nvim",
    event = "VimEnter",
    opts = {
      presets = {
        bottom_search = false,        -- use a classic bottom cmdline for search
        command_palette = false,      -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,        -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = { delay = 2000 }
  },
}
