local autocmd = vim.api.nvim_create_autocmd
local custom_au_cmd_group = vim.api.nvim_create_augroup("CustomAutoCommandGroup", { clear = true })
local filetype_au_cmd_group = vim.api.nvim_create_augroup("FileTypeAutoCommandGroup", { clear = true })

autocmd("TextYankPost", {
  group = custom_au_cmd_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
  desc = "Briefly highlight yanked text",
})

autocmd({ "BufWritePre" }, {
  group = custom_au_cmd_group,
  pattern = "*",
  command = [[%s/\s\+$//e]],
  desc = "Trim whitespace before saving the current buffer",
})

autocmd({ "CursorHold", "CursorHoldI", "FocusGained", "BufEnter" }, {
  group = custom_au_cmd_group,
  pattern = "*",
  command = [[:checktime]],
  desc = "Automatically check if any buffers were changed from the outside",
})

autocmd({ "FileType" }, {
  group = filetype_au_cmd_group,
  pattern = { "java", "py", "md" },
  command = "setlocal tabstop=4 softtabstop=4 shiftwidth=4",
  desc = "Set tabs to four spaces for given file types",
  -- override locally with "setlocal tabstop=2 softtabstop=2 shiftwidth=2"
})
