-- Games - Plugins used to practice skills
return {
  "nvim-treesitter/playground",
  "ThePrimeagen/vim-be-good",
  {
    "nvzone/typr",
    enabled = true,
    event = "VeryLazy",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
}
