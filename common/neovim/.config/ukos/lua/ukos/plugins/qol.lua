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
      -- Deal with big files
      bigfile = { enabled = true },
      -- Beautiful declarative dashboards
      dashboard = {},
      -- Focus on the active scope by dimming the rest
      dim = {},
      -- Open the current file, branch, commit, or repo in a browser (e.g. GitHub, GitLab, Bitbucket)
      gitbrowse = {},
      -- Open LazyGit in a float, auto-configure colorscheme and integration with Neovim
      lazygit = { configure = false, win = { style = "dashboard" } },
      -- Scratch buffers with a persistent file
      scratch = {},
      -- When doing nvim somefile.txt, it will render the file as quickly as possible, before loading your plugins.
      quickfile = {},
      -- Auto-show LSP references and quickly navigate between them
      words = { enabled = true },
    },
  },
}
