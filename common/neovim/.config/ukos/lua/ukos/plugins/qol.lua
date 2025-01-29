-- QoL - Plugins that improve the quality of developer's life
return {
  "airblade/vim-rooter",
  "tpope/vim-commentary",
  "tpope/vim-surround",
  { "windwp/nvim-autopairs", opts = {} },
  "tpope/vim-sleuth",
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "┊" },
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = {},
      dim = {},
      gitbrowse = {},
      lazygit = { configure = false, win = { style = "dashboard" } },
      scratch = {},
      quickfile = {},
      words = { enabled = true },
    },
  },
}
