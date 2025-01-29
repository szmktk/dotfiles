local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "ukos.plugins.debug" },
  { import = "ukos.plugins.file_management" },
  { import = "ukos.plugins.finder" },
  { import = "ukos.plugins.games" },
  { import = "ukos.plugins.history" },
  { import = "ukos.plugins.language_server" },
  { import = "ukos.plugins.language_support" },
  { import = "ukos.plugins.misc" },
  { import = "ukos.plugins.navigation" },
  { import = "ukos.plugins.qol" },
  { import = "ukos.plugins.ui" },
})
