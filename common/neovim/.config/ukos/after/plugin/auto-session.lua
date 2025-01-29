require("auto-session").setup({
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_enabled = true,
  auto_session_create_enabled = true,
  auto_session_suppress_dirs = { "/", "~/", "~/Downloads", "~/Downloads/*" },
  log_level = "warn",
  pre_save_cmds = { "NvimTreeClose" },
  post_restore_cmds = {},
})

require("session-lens").setup {
  path_display = { "shorten" },
  theme = "dropdown",
}
