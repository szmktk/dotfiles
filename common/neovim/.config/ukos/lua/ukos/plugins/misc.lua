-- Miscellaneous - Plugins that do not fit other categories
return {
  "wakatime/vim-wakatime",
  "Eandrju/cellular-automaton.nvim",
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "allaman/kustomize.nvim",
    requires = "nvim-lua/plenary.nvim",
    ft = "yaml",
    opts = {},
  },
}
