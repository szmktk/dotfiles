require("auto-session").setup({
  enabled = true,
  auto_save = true,
  auto_restore = true,
  auto_create = true,
  suppressed_dirs = { "/", "~/", "~/Downloads", "~/Downloads/*" },
  log_level = "warn",
  post_restore_cmds = {},
})
