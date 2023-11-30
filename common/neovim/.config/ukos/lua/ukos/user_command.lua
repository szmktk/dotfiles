vim.api.nvim_create_user_command(
  "ScratchVertical",
  function()
    vim.cmd "vnew"
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "hide"
    vim.bo.swapfile = false
  end,
  {}
)

vim.api.nvim_create_user_command(
  "ScratchHorizontal",
  function()
    vim.cmd "new"
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "hide"
    vim.bo.swapfile = false
  end,
  {}
)

vim.api.nvim_create_user_command(
  "ScratchTab",
  function()
    vim.cmd "tabnew"
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "hide"
    vim.bo.swapfile = false
  end,
  {}
)
