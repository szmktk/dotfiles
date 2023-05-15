-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use ("wbthomason/packer.nvim")

  use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }
  use ("navarasu/onedark.nvim")
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }

  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use("nvim-treesitter/playground")
  -- use("theprimeagen/harpoon")
  -- use("mbbill/undotree")
  use("mhinz/vim-startify")
  use("airblade/vim-rooter")
  use {
    "junegunn/fzf.vim",
    requires = { "junegunn/fzf", run = ":call fzf#install()" }
  }
  use {
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" }
  }
  use("wakatime/vim-wakatime")
  use("tpope/vim-commentary")
  use("tpope/vim-fugitive")
  use("tpope/vim-surround")
  use("lewis6991/gitsigns.nvim")
  use("christoomey/vim-tmux-navigator")
  use("ThePrimeagen/vim-be-good")
  use("windwp/nvim-autopairs")

  -- use {
	  -- "VonHeikemen/lsp-zero.nvim",
	  -- branch = "v2.x",
	  -- requires = {
		  -- -- LSP Support
		  -- {"neovim/nvim-lspconfig"},             -- Required
		  -- {                                      -- Optional
		  -- "williamboman/mason.nvim",
		  -- run = function()
			  -- pcall(vim.cmd, "MasonUpdate")
		  -- end,
	  -- },
	  -- {"williamboman/mason-lspconfig.nvim"}, -- Optional

	  -- -- Autocompletion
	  -- {"hrsh7th/nvim-cmp"},     -- Required
	  -- {"hrsh7th/cmp-nvim-lsp"}, -- Required
	  -- {"L3MON4D3/LuaSnip"},     -- Required
  -- }
-- }

end)
