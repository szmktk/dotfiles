local map = vim.keymap.set

vim.fn.sign_define(
  "DapBreakpoint",
  {
    text = "🔴",
    texthl = "DapBreakpoint",
    linehl = "DapBreakpoint",
    numhl = "DapBreakpoint"
  }
)

map("n", "<leader>dt", "<cmd>DapUiToggle<CR>", {
  desc = "[D]ebug UI [T]oggle",
  noremap = true,
  silent = true,
})
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", {
  desc = "[D]ebug Toggle [B]reakpoint",
  noremap = true,
  silent = true,
})
map("n", "<leader>dc", "<cmd>DapContinue<CR>", {
  desc = "[D]ebug [C]ontinue",
  noremap = true,
  silent = true,
})
map("n", "<leader>dr", "<cmd>lua require('dapui').open({reset = true})<CR>", {
  desc = "[D]ebug [R]eset UI",
  noremap = true,
  silent = true,
})
map("n", "<F2>", "<cmd>DapTerminate<CR>", {
  desc = "Stop DAP (F2)",
  noremap = true,
  silent = true,
})
map("n", "<F7>", "<cmd>DapStepInto<CR>", {
  desc = "Step Into (F7)",
  noremap = true,
  silent = true,
})
map("n", "<F8>", "<cmd>DapStepOver<CR>", {
  desc = "Step Over (F8)",
  noremap = true,
  silent = true,
})
map("n", "<S-F8>", "<cmd>DapStepOut<CR>", {
  desc = "Step Out (SHIFT + F8)",
  noremap = true,
  silent = true,
})
map("n", "<F9>", "<cmd>DapContinue<CR>", {
  desc = "Start/Continue (F9)",
  noremap = true,
  silent = true,
})
map("n", "<leader>dpm", "<cmd>lua require('dap-python').test_method()<CR>", {
  desc = "[D]ebug [P]ython [M]ethod",
  noremap = true,
  silent = true,
})
map("n", "<leader>dpc", "<cmd>lua require('dap-python').test_class()<CR>", {
  desc = "[D]ebug [P]ython [C]lass",
  noremap = true,
  silent = true,
})
