local autocmd = vim.api.nvim_create_autocmd
local custom_au_cmd_group = vim.api.nvim_create_augroup("CustomAutoCommandGroup", { clear = true })
local filetype_au_cmd_group = vim.api.nvim_create_augroup("FileTypeAutoCommandGroup", { clear = true })
local go_au_cmd_group = vim.api.nvim_create_augroup("GoAutoCommandGroup", { clear = true })
local number_toggle_au_cmd_group = vim.api.nvim_create_augroup("NumberToggleAutoCommandGroup", { clear = true })
local git_pull_au_cmd_group = vim.api.nvim_create_augroup("AutoGitPullAutoCommandGroup", { clear = true })

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

autocmd({ "BufLeave", "BufWritePre", "FocusLost" }, {
  group = go_au_cmd_group,
  pattern = "*.go",
  callback = function(args)
    require("conform").format({ async = true, bufnr = args.buf })
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

-- autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
autocmd({ "InsertLeave" }, {
  group = number_toggle_au_cmd_group,
  pattern = "*",
  callback = function() vim.wo.relativenumber = true end,
})
-- autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
autocmd({ "InsertEnter" }, {
  group = number_toggle_au_cmd_group,
  pattern = "*",
  callback = function() vim.wo.relativenumber = false end,
})

autocmd({ "VimEnter" }, {
  group = git_pull_au_cmd_group,
  pattern = "*",
  callback = function()
    vim.defer_fn(function()
      local Job = require("plenary.job")

      if vim.fn.isdirectory(".git") == 1 then
        local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("%s+", "")
        if branch == "main" or branch == "master" then
          Job:new({
            command = "git",
            args = { "pull" },
            on_exit = function(_, return_val)
              if return_val == 0 then
                print("Pulled changes from origin on branch: " .. branch)
              else
                print("Git pull failed on branch: " .. branch)
              end
            end,
          }):start()
        else
          print("Not on main or master branch, no pull executed.")
        end
      end
    end, 100) -- delay for 100ms
  end
})
