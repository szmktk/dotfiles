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

local open_definition = function(mode)
  local open_command = mode == "tab" and "tabnew" or "vsplit"

  local definitions = vim.lsp.buf_request_sync(0, "textDocument/definition", vim.lsp.util.make_position_params())
  if definitions then
    for _, result in pairs(definitions) do
      if result.result then
        for _, def in pairs(result.result) do
          local uri = def.uri or def.targetUri
          if uri then
            -- convert the URI to a file path
            local bufnr = vim.uri_to_bufnr(uri)
            -- ensure the buffer is loaded
            vim.fn.bufload(bufnr)
            -- open a new view (tab or vertical split)
            vim.cmd(open_command)
            -- set the current buffer of the newly opened view to the target definition
            vim.api.nvim_win_set_buf(0, bufnr)
            -- move cursor to the definition position
            local range = def.range or def.targetSelectionRange
            local pos = range.start
            vim.api.nvim_win_set_cursor(0, { pos.line + 1, pos.character })
            break -- open the first definition found
          end
        end
      end
    end
  end
end

vim.api.nvim_create_user_command("GoToDefinitionNewTab", function() open_definition("tab") end, {})
vim.api.nvim_create_user_command("GoToDefinitionNewVSplit", function() open_definition("split") end, {})

local function duplicate_and_comment_line()
  vim.cmd("t.")
  vim.cmd("normal! k")
  vim.cmd("Commentary")
  vim.cmd("normal! j")
end

vim.api.nvim_create_user_command("DuplicateAndCommentLine", function() duplicate_and_comment_line() end, {})

vim.api.nvim_create_user_command("CopyRelativePath", function()
  local relative_path = vim.fn.expand("%")
  vim.fn.setreg("+", relative_path)
  print("Copied relative path to clipboard: " .. relative_path)
end, { desc = "Copy relative file path to clipboard" })

vim.api.nvim_create_user_command("GBrowse", function() Snacks.gitbrowse() end, {})
vim.api.nvim_create_user_command("DimEnable", function() Snacks.dim() end, {})
vim.api.nvim_create_user_command("DimDisable", function() Snacks.dim.disable() end, {})
vim.api.nvim_create_user_command("Scratch", function() Snacks.scratch() end, {})
vim.api.nvim_create_user_command("ScratchSelect", function() Snacks.scratch.select() end, {})
vim.api.nvim_create_user_command("LazyGit", function() Snacks.lazygit() end, {})
vim.api.nvim_create_user_command("LazyGitLog", function() Snacks.lazygit.log({}) end, {})
vim.api.nvim_create_user_command("LazyGitLogFile", function() Snacks.lazygit.log_file({}) end, {})
