-- Navigation - Plugins related to navigation within Neovim
return {
  "rmagatti/auto-session",
  "christoomey/vim-tmux-navigator",
  "ThePrimeagen/harpoon",
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup()
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        -- available colors: info, warning, hint, test
        OMG = { icon = " ", color = "hint", alt = { "YAY", "WTF" } },
      },
    }
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      position = "bottom",
      height = 20,
    },
  },
}
