local map = vim.keymap.set
local goto_preview = require("goto-preview")

map("n", "gpd", goto_preview.goto_preview_definition, {
  desc = "[G]oto [P]review [D]efinition",
  noremap = true,
  silent = true,
})
map("n", "gpt", goto_preview.goto_preview_type_definition, {
  desc = "Goto [P]review [T]ype definition",
  noremap = true,
  silent = true,
})
map("n", "gpi", goto_preview.goto_preview_implementation, {
  desc = "[G]oto [P]review [I]mplementation",
  noremap = true,
  silent = true,
})
map("n", "gpD", goto_preview.goto_preview_declaration, {
  desc = "[G]oto [P]review [D]eclaration",
  noremap = true,
  silent = true,
})
map("n", "gP", goto_preview.close_all_win, {
  desc = "Goto Preview close all windows",
  noremap = true,
  silent = true,
})
map("n", "gpr", goto_preview.goto_preview_references, {
  desc = "[G]oto [P]review [R]eferences",
  noremap = true,
  silent = true,
})
