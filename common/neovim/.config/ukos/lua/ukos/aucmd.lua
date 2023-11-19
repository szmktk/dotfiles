local autocmd = vim.api.nvim_create_autocmd
local custom_au_cmd_group = vim.api.nvim_create_augroup("CustomAutoCommandGroup", { clear = true })
local filetype_au_cmd_group = vim.api.nvim_create_augroup("FileTypeAutoCommandGroup", { clear = true })
local go_au_cmd_group = vim.api.nvim_create_augroup("GoAutoCommandGroup", { clear = true })

autocmd("TextYankPost", {
  group = custom_au_cmd_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
  desc = "Briefly highlight yanked text",
})

autocmd({ "BufLeave", "FocusLost" }, {
  group = custom_au_cmd_group,
  pattern = "*",
  -- command = "silent! wall",
  command = "wall",
  desc = "Save changes in current buffer when leaving or losing focus",
})

autocmd({ "BufWritePre" }, {
  group = custom_au_cmd_group,
  pattern = "*",
  command = [[%s/\s\+$//e]],
  desc = "Trim whitespace before saving the current buffer",
})

autocmd({ "BufWritePre" }, {
  group = go_au_cmd_group,
  pattern = "*.go",
  callback = function()
    require("go.format").goimport()
  end,
  desc = "Run gofmt and organize imports before saving the current buffer"
})

autocmd({ "CursorHold", "CursorHoldI", "FocusGained", "BufEnter" }, {
  group = custom_au_cmd_group,
  pattern = "*",
  command = [[:checktime]],
  desc = "Automatically check if any buffers were changed from the outside",
})

autocmd({ "FileType" }, {
  group = filetype_au_cmd_group,
  pattern = { "java", "py", "md", "go" },
  command = "setlocal tabstop=4 softtabstop=4 shiftwidth=4",
  desc = "Set tabs to four spaces for given file types",
  -- override locally with "setlocal tabstop=2 softtabstop=2 shiftwidth=2"
})
