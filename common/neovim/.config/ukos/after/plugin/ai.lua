local home = vim.fn.expand("$HOME")
local map = vim.keymap.set

require("chatgpt").setup({
  api_key_cmd = "pass show api/tokens/openai"
})

map("n", "<leader>cp", "<cmd>ChatGPT<CR>", {
  desc = "[C]hatGPT [P]rompt",
  noremap = true,
  silent = true,
})
map("n", "<leader>cc", "<cmd>ChatGPTCompleteCode<CR>", {
  desc = "[C]hatGPT [C]omplete code",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>ce", "<cmd>ChatGPTEditWithInstructions<CR>", {
  desc = "[C]hatGPT [E]dit with instructions",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", {
  desc = "[C]hatGPTRun [G]rammar correction",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>ctr", "<cmd>ChatGPTRun translate<CR>", {
  desc = "[C]hatGPTRun [T][R]anslate",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", {
  desc = "[C]hatGPTRun [K]eywords",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", {
  desc = "[C]hatGPTRun [D]ocstring",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>ct", "<cmd>ChatGPTRun add_tests<CR>", {
  desc = "[C]hatGPTRun Add [T]ests",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", {
  desc = "[C]hatGPTRun [O]ptimize code",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", {
  desc = "[C]hatGPTRun [S]ummarize",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", {
  desc = "[C]hatGPTRun [F]ix bugs",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", {
  desc = "[C]hatGPTRun E[X]plain code",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", {
  desc = "[C]hatGPTRun [R]oxygen edit",
  noremap = true,
  silent = true,
})
map({ "n", "v" }, "<leader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", {
  desc = "[C]hatGPTRun code readability ana[L]ysis",
  noremap = true,
  silent = true,
})
