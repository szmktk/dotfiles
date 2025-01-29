require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
      -- (experimental) enable shelling out to `pytest` to discover test
      -- instances for files containing a parametrize mark (default: false)
      -- pytest_discover_instances = true,
    }),
    require("neotest-golang"),
  },
})

local map = vim.keymap.set
map("n", "<leader>tr", require("neotest").run.run, {
  desc = "[T]est [R]un nearest",
  noremap = true,
  silent = true,
})
map("n", "<leader>tl", require("neotest").run.run_last, {
  desc = "[T]est run [L]ast",
  noremap = true,
  silent = true,
})
map("n", "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, {
  desc = "[T]est run [D]ebug",
  noremap = true,
  silent = true,
})
map("n", "<leader>ta", function() require("neotest").run.run(vim.fn.expand("%")) end, {
  desc = "[T]est run [A]ll",
  noremap = true,
  silent = true,
})
map("n", "<leader>tx", require("neotest").run.stop, {
  desc = "[T]est stop running",
  noremap = true,
  silent = true,
})
map("n", "<leader>ts", require("neotest").summary.toggle, {
  desc = "[T]est [S]ummary toggle",
  noremap = true,
  silent = true,
})
map("n", "<leader>to", require("neotest").output.open, {
  desc = "[T]est [O]utput",
  noremap = true,
  silent = true,
})
map("n", "<leader>tO", function() require("neotest").output.open({ enter = true }) end, {
  desc = "[T]est output enter",
  noremap = true,
  silent = true,
})
map("n", "[t", require("neotest").jump.prev, {
  desc = "Test jump previous",
  noremap = true,
  silent = true,
})
map("n", "]t", require("neotest").jump.next, {
  desc = "Test jump next",
  noremap = true,
  silent = true,
})
