-- DAP - Debug Adapter Protocol
return {
  { "mfussenegger/nvim-dap" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    opts = {},
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, _)
      local path = "~/bin/debugpy/.venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    opts = {},
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = "mfussenegger/nvim-dap",
    opts = {},
  },
}
